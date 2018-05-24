package com.sethkurkowski.android.parkaholic_20;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
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
import com.sethkurkowski.android.parkaholic_20.VenueData.Venue;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueImageAsyncTask;
import com.sethkurkowski.android.parkaholic_20.fragments.ImageFlipperFragment;
import com.sethkurkowski.android.parkaholic_20.fragments.ParkInfoFragment;
import com.sethkurkowski.android.parkaholic_20.fragments.ParkRatingsFragment;

import java.util.ArrayList;
import java.util.HashMap;

public class VenueActivity extends AppCompatActivity implements VenueImageAsyncTask.VenueImageTaskCallback {

    public static final String EXTRA_PARK = "EXTRA_PARK";

    private FirebaseAuthHelper firebaseAuthHelper;
    FirebaseDatabase database = FirebaseDatabase.getInstance();
    DatabaseReference reference;

    Venue mVenue;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_venue);

        firebaseAuthHelper = FirebaseAuthHelper.getInstance(this);
        firebaseAuthHelper.setmActivity(this);

        if (getIntent().getExtras() != null && getIntent().getExtras().containsKey(HomeActivity.EXTRA_PARK)) {
            mVenue = (Venue) getIntent().getExtras().get(HomeActivity.EXTRA_PARK);

            if (mVenue != null) {
                ApiHelper.pullParkImages(this, mVenue.getmID());

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
        // MARK: Load Info Fragment
        getSupportFragmentManager().beginTransaction().replace(R.id.park_info_frag_container, ParkInfoFragment.newInstance(mVenue.getmCity(), mVenue.getAddress(), mVenue.getPhoneNumber(), mVenue.getmUrl())).commit();
        // MARK: Load Ratings Fragment
        getSupportFragmentManager().beginTransaction().replace(R.id.park_ratings_frag_container, ParkRatingsFragment.newInstance(mVenue.getmID())).commit();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        if (firebaseAuthHelper.mIsSignedIn) {
            getMenuInflater().inflate(R.menu.activity_venue_signed_in, menu);
        } else {
            getMenuInflater().inflate(R.menu.activity_venue_signed_out, menu);
        }
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.sign_in) {
            firebaseAuthHelper.signIn();
        } else if (item.getItemId() == R.id.user_account) {
            firebaseAuthHelper.signOut();
        } else if (item.getItemId() == R.id.add_review) {
            if (firebaseAuthHelper.mIsSignedIn) {
                Intent reviewIntent = new Intent(this, ReviewActivity.class);
                reviewIntent.putExtra(EXTRA_PARK, mVenue);
                startActivity(reviewIntent);
            } else {
                Toast.makeText(this, R.string.please_sign_in, Toast.LENGTH_SHORT).show();
            }
        }
        return super.onOptionsItemSelected(item);
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
    public void taskFinish(ArrayList<String> imageUris) {
        Log.i(HomeActivity.tag, "imageTaskFinish");

        // MARK: Load Park Images Fragment
        getSupportFragmentManager().beginTransaction().replace(R.id.park_image_frag_container, ImageFlipperFragment.newInstance(imageUris)).commit();
    }
}
