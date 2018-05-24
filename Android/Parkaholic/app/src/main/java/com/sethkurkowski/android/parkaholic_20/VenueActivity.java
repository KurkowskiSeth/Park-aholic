package com.sethkurkowski.android.parkaholic_20;

import android.content.Intent;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.StackView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.sethkurkowski.android.parkaholic_20.Helpers.ApiHelper;
import com.sethkurkowski.android.parkaholic_20.Helpers.FirebaseAuthHelper;
import com.sethkurkowski.android.parkaholic_20.Helpers.FirebaseHelper;
import com.sethkurkowski.android.parkaholic_20.VenueData.Venue;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueImageAsyncTask;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueRatings;
import com.sethkurkowski.android.parkaholic_20.Adapters.CommentAdapter;
import com.sethkurkowski.android.parkaholic_20.Adapters.StackViewAdapter;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.HashMap;

public class VenueActivity extends AppCompatActivity implements VenueImageAsyncTask.VenueImageTaskCallback, FirebaseHelper.FirebaseDataCallback, View.OnClickListener {

    public static final String EXTRA_PARK = "EXTRA_PARK";

    private FirebaseAuthHelper firebaseAuthHelper;
    private FirebaseHelper firebaseHelper;
    FirebaseDatabase database = FirebaseDatabase.getInstance();
    DatabaseReference reference;

    Venue mVenue;
    ListView list;
    ArrayList<String> mComments;
    LayoutInflater inflater;
    boolean isFavorite = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_venue);

        firebaseAuthHelper = FirebaseAuthHelper.getInstance(this);
        firebaseAuthHelper.setmActivity(this);

        firebaseHelper = FirebaseHelper.getInstance();
        firebaseHelper.setDataCallback(this);

        if (getIntent().getExtras() != null && getIntent().getExtras().containsKey(HomeActivity.EXTRA_PARK)) {
            mVenue = (Venue) getIntent().getExtras().get(HomeActivity.EXTRA_PARK);

            if (mVenue != null) {
                list = findViewById(android.R.id.list);
                ApiHelper.pullParkImages(this, mVenue.getmID());

                FloatingActionButton floatingActionButton = findViewById(R.id.floatingActionButton);
                floatingActionButton.setOnClickListener(this);
                if (getSupportActionBar() != null) {
                    getSupportActionBar().setTitle(mVenue.getmName());
                    reference = database.getReference("parks").child((mVenue.getmID()));
                    pullDataFromDatabase();
                }
            }
        }
    }

    @Override
    protected void onResume() {
        super.onResume();

        if (list != null && mComments != null) {
            firebaseHelper.getVenueComments(mVenue.getmID());
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        if (firebaseAuthHelper.mIsSignedIn) {
            if (isFavorite) {
                getMenuInflater().inflate(R.menu.activity_venue_signed_in_favorited, menu);
            } else {
                getMenuInflater().inflate(R.menu.activity_venue_signed_in_unfavorited, menu);
            }
        } else {
            if (isFavorite) {
                getMenuInflater().inflate(R.menu.activity_venue_signed_out_favorited, menu);
            } else {
                getMenuInflater().inflate(R.menu.activity_venue_signed_out_unfavorited, menu);
            }
        }
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.sign_in) {
            firebaseAuthHelper.signIn();
        } else if (item.getItemId() == R.id.user_account) {
            firebaseAuthHelper.signOut();
        } else if (item.getItemId() == R.id.add_favorite) {
            isFavorite = true;
            invalidateOptionsMenu();
        } else if (item.getItemId() == R.id.unfavor) {
            isFavorite = false;
            invalidateOptionsMenu();
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.floatingActionButton) {
            if (firebaseAuthHelper.mIsSignedIn) {
                Intent reviewIntent = new Intent(this, ReviewActivity.class);
                reviewIntent.putExtra(EXTRA_PARK, mVenue);
                startActivity(reviewIntent);
            } else {
                Toast.makeText(this, R.string.please_sign_in, Toast.LENGTH_SHORT).show();
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == FirebaseAuthHelper.RC_SIGN_IN) {
            if (resultCode == RESULT_OK) {
                firebaseAuthHelper.setmUser(FirebaseAuth.getInstance().getCurrentUser());
                invalidateOptionsMenu();
            }
        }
    }

    private void pullDataFromDatabase() {
        reference.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot != null) {
                    Object data = dataSnapshot.getValue();
                    if (data == null) {
                        addNewParkToDatabase();
                    }
                }
            }
            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        });
    }

    private void addNewParkToDatabase() {
        DatabaseReference reference = database.getReference("parks").child(mVenue.getmID());

        HashMap<String, Integer> newRatings = new HashMap<>();
        newRatings.put("totalRatings", 0);
        newRatings.put("totalReviews", 0);

        HashMap<String, Object> newAverages = new HashMap<>();
        newAverages.put("likelinessToReturn", newRatings);
        newAverages.put("neighborhood", newRatings);
        newAverages.put("overallEnjoyment", newRatings);
        newAverages.put("parkEquipment", newRatings);
        newAverages.put("parkQuality", newRatings);

        HashMap<String, Object> newPark = new HashMap<>();
        newPark.put("parkName", mVenue.getmName());
        newPark.put("averages", newAverages);

        reference.setValue(newPark);
    }

    @Override
    public void taskStart() {
        Log.i(HomeActivity.tag, "imageTaskStart");
    }

    @Override
    public void taskFinish(ArrayList<String> imageUrls) {
        Log.i(HomeActivity.tag, "imageTaskFinish");
        inflater = LayoutInflater.from(this);

        // Load stackView.
        StackView stackView = findViewById(R.id.image_stack);
        for (String s : imageUrls) {
            ImageView imageView = new ImageView(this);
            Picasso.with(this).load(s).into(imageView);
            stackView.setAdapter(new StackViewAdapter(this, 0, 0, imageUrls));
        }

        // Header for park info
        View infoHeader = inflater.inflate(R.layout.list_header, null);
        ((TextView)infoHeader.findViewById(R.id.header_tv)).setText(R.string.park_info_heading);
        list.addHeaderView(infoHeader);

        // Load Info Layout and add it as a header
        View infoViewLayout = inflater.inflate(R.layout.venue_info, null);
        list.addHeaderView(infoViewLayout);

        TextView addressTitleTV = infoViewLayout.findViewById(R.id.address_title_tv);
        TextView addressCityTV = infoViewLayout.findViewById(R.id.address_city_tv);
        if (mVenue.getAddress() == null) {
            addressTitleTV.setText(R.string.park_city);
            addressCityTV.setText(mVenue.getmCity());
        } else {
            addressCityTV.setText(mVenue.getAddress());
            Log.i(HomeActivity.tag, "Address: " + mVenue.getAddress());
        }

        TextView phoneTitleTV = infoViewLayout.findViewById(R.id.phone_title_tv);
        TextView phoneNumberTV = infoViewLayout.findViewById(R.id.phone_number_tv);
        if (mVenue.getPhoneNumber() == null) {
            phoneTitleTV.setVisibility(View.GONE);
            phoneNumberTV.setVisibility(View.GONE);
        } else {
            phoneNumberTV.setText(mVenue.getPhoneNumber());
            Log.i(HomeActivity.tag, "Phone Number: " + mVenue.getPhoneNumber());
        }

        TextView urlTitleTV = infoViewLayout.findViewById(R.id.url_title_tv);
        TextView parkUrlTV = infoViewLayout.findViewById(R.id.park_url_tv);
        if (mVenue.getmUrl() == null || mVenue.getmUrl().trim().length() == 0) {
            urlTitleTV.setVisibility(View.GONE);
            parkUrlTV.setVisibility(View.GONE);
        } else {
            parkUrlTV.setText(mVenue.getmUrl());
            Log.i(HomeActivity.tag, "URL: " + mVenue.getmUrl());
        }

        // Load Park Ratings Layout and add as third header
        firebaseHelper.getVenueRatings(mVenue.getmID());
    }

    @Override
    public void onReceivedRatings(VenueRatings ratings) {
        if (ratings != null) {

            // Create header for park ratings
            View ratingsHeader = inflater.inflate(R.layout.list_header, null);
            ((TextView) ratingsHeader.findViewById(R.id.header_tv)).setText(R.string.park_ratings_heading);
            list.addHeaderView(ratingsHeader);

            // Load ratings layout and add to list as a header
            View parkRatingsLayout = inflater.inflate(R.layout.venue_ratings, null);
            list.addHeaderView(parkRatingsLayout);
            updateVenueStars(ratings, parkRatingsLayout);
        }

        // Create header for user comments
        View commentsHeader = inflater.inflate(R.layout.list_header, null);
        ((TextView) commentsHeader.findViewById(R.id.header_tv)).setText(R.string.park_comments_heading);
        list.addHeaderView(commentsHeader);

        // Load Comments and set up adapter for list
        firebaseHelper.getVenueComments(mVenue.getmID());
    }

    @Override
    public void onReceivedComments(ArrayList<String> comments) {
        // Load comments into adapter
        mComments = comments;
        list.clearChoices();
        list.setAdapter(new CommentAdapter(this, comments));
    }

    private void updateVenueStars(VenueRatings ratings, View view) {
        updateQualityStars(ratings.getQuality(), view);
        updateEquipmentStars(ratings.getEquipment(), view);
        updateNeighborhoodStars(ratings.getNeighborhood(), view);
        updateEnjoymentStars(ratings.getEnjoyment(), view);
        updateReturnStars(ratings.getLikelinessToReturn(), view);
    }

    private void updateQualityStars(int rating, View view) {
        if (view != null) {
            ImageView star1 = view.findViewById(R.id.qualityStar1);
            ImageView star2 = view.findViewById(R.id.qualityStar2);
            ImageView star3 = view.findViewById(R.id.qualityStar3);
            ImageView star4 = view.findViewById(R.id.qualityStar4);
            ImageView star5 = view.findViewById(R.id.qualityStar5);

            if (rating == 1) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 2) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 3) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 4) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 5) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star5.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            }
        }
    }

    private void updateEquipmentStars(int rating, View view) {
        if (view != null) {
            ImageView star1 = view.findViewById(R.id.equipmentStar1);
            ImageView star2 = view.findViewById(R.id.equipmentStar2);
            ImageView star3 = view.findViewById(R.id.equipmentStar3);
            ImageView star4 = view.findViewById(R.id.equipmentStar4);
            ImageView star5 = view.findViewById(R.id.equipmentStar5);

            if (rating == 1) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 2) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 3) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 4) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 5) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star5.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            }
        }
    }

    private void updateNeighborhoodStars(int rating, View view) {
        if (view != null) {
            ImageView star1 = view.findViewById(R.id.neighborhoodStar1);
            ImageView star2 = view.findViewById(R.id.neighborhoodStar2);
            ImageView star3 = view.findViewById(R.id.neighborhoodStar3);
            ImageView star4 = view.findViewById(R.id.neighborhoodStar4);
            ImageView star5 = view.findViewById(R.id.neighborhoodStar5);

            if (rating == 1) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 2) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 3) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 4) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 5) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star5.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            }
        }
    }

    private void updateEnjoymentStars(int rating, View view) {
        if (view != null) {
            ImageView star1 = view.findViewById(R.id.enjoymentStar1);
            ImageView star2 = view.findViewById(R.id.enjoymentStar2);
            ImageView star3 = view.findViewById(R.id.enjoymentStar3);
            ImageView star4 = view.findViewById(R.id.enjoymentStar4);
            ImageView star5 = view.findViewById(R.id.enjoymentStar5);

            if (rating == 1) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 2) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 3) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 4) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 5) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star5.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            }
        }
    }

    private void updateReturnStars(int rating, View view) {
        if (view != null) {
            ImageView star1 = view.findViewById(R.id.returnStar1);
            ImageView star2 = view.findViewById(R.id.returnStar2);
            ImageView star3 = view.findViewById(R.id.returnStar3);
            ImageView star4 = view.findViewById(R.id.returnStar4);
            ImageView star5 = view.findViewById(R.id.returnStar5);

            if (rating == 1) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 2) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 3) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 4) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 5) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star5.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            }
        }
    }
}
