package com.sethkurkowski.android.parkaholic_20;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.sethkurkowski.android.parkaholic_20.Helpers.FirebaseHelper;
import com.sethkurkowski.android.parkaholic_20.VenueData.Venue;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueRatings;
import com.sethkurkowski.android.parkaholic_20.fragments.UserCommentFragment;
import com.sethkurkowski.android.parkaholic_20.fragments.UserRatingsFragment;

import java.util.ArrayList;

public class ReviewActivity extends AppCompatActivity implements UserRatingsFragment.UserRatingCallback, UserCommentFragment.UserCommentCallback, FirebaseHelper.FirebaseDataCallback {

    String parkQualityFrag = "PARK_QUALITY_FRAG";
    String parkEquipmentFrag = "PARK_EQUIPMENT_FRAG";
    String parkNeighborhoodFrag = "PARK_NEIGHBORHOOD_FRAG";
    String parkEnjoymentFrag = "PARK_ENJOYMENT_FRAG";
    String parkReturnFrag = "PARK_RETURN_FRAG";
    String userCommentFrag = "USER_COMMENT_FRAG";
    String currentFrag;
    String mComment;

    Double qualityRating;
    Double equipmentRating;
    Double neighborhoodRating;
    Double enjoymentRating;
    Double returnRating;

    Double totalQualityRatings;
    Double totalEquipmentRatings;
    Double totalNeighborhoodRating;
    Double totalEnjoymentRating;
    Double totalReturnRating;
    Integer totalQualityReviews;
    Integer totalEquipmentReviews;
    Integer totalNeighborhoodReviews;
    Integer totalEnjoymentReviews;
    Integer totalReturnReviews;

    Venue mVenue;

    FirebaseDatabase database = FirebaseDatabase.getInstance();
    DatabaseReference reference;

    FirebaseHelper firebaseHelper = FirebaseHelper.getInstance();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_review);

        firebaseHelper.setDataCallback(this);

        if (getIntent().getExtras() != null && getIntent().getExtras().containsKey(VenueActivity.EXTRA_PARK)) {

            mVenue = (Venue) getIntent().getExtras().get(VenueActivity.EXTRA_PARK);
            if (mVenue != null) {
                if (mVenue.getmName() != null) {
                    if (getSupportActionBar() != null) {
                        getSupportActionBar().setTitle(mVenue.getmName());
                    }
                    getSupportFragmentManager().beginTransaction().replace(R.id.frag_container, UserRatingsFragment.newInstance(getString(R.string.park_quality_question))).addToBackStack(parkQualityFrag).commit();
                    currentFrag = parkQualityFrag;
                }
            }
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_review_menu, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.cancel) {
            finish();
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onRatingSubmit(String category, Double value) {
        if (category.equals(getString(R.string.park_quality_question))) {
            qualityRating = value;
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.frag_container, UserRatingsFragment.newInstance(getString(R.string.park_equipment_question)))
                    .addToBackStack(parkEquipmentFrag)
                    .commit();
            currentFrag = parkEquipmentFrag;
        } else if (category.equals(getString(R.string.park_equipment_question))) {
            equipmentRating = value;
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.frag_container, UserRatingsFragment.newInstance(getString(R.string.park_neighhorhood_question)))
                    .addToBackStack(parkNeighborhoodFrag)
                    .commit();
            currentFrag = parkNeighborhoodFrag;
        } else if (category.equals(getString(R.string.park_neighhorhood_question))) {
            neighborhoodRating = value;
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.frag_container, UserRatingsFragment.newInstance(getString(R.string.park_enjoyment_question)))
                    .addToBackStack(parkEnjoymentFrag)
                    .commit();
            currentFrag = parkEnjoymentFrag;
        } else if (category.equals(getString(R.string.park_enjoyment_question))) {
            enjoymentRating = value;
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.frag_container, UserRatingsFragment.newInstance(getString(R.string.park_return_question)))
                    .addToBackStack(parkReturnFrag)
                    .commit();
            currentFrag = parkReturnFrag;
        } else if (category.equals(getString(R.string.park_return_question))) {
            returnRating = value;
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.frag_container, UserCommentFragment.newInstance())
                    .addToBackStack(userCommentFrag)
                    .commit();
        }
    }

    @Override
    public void onBackPressed() {
        if (currentFrag.equals(parkQualityFrag)) {
            finish();
        } else if (currentFrag.equals(parkEquipmentFrag)) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.frag_container, UserRatingsFragment.newInstance(getString(R.string.park_quality_question)))
                    .addToBackStack(parkQualityFrag)
                    .commit();
            currentFrag = parkQualityFrag;
        } else if (currentFrag.equals(parkNeighborhoodFrag)) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.frag_container, UserRatingsFragment.newInstance(getString(R.string.park_equipment_question)))
                    .addToBackStack(parkEquipmentFrag)
                    .commit();
            currentFrag = parkEquipmentFrag;
        } else if (currentFrag.equals(parkEnjoymentFrag)) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.frag_container, UserRatingsFragment.newInstance(getString(R.string.park_neighhorhood_question)))
                    .addToBackStack(parkNeighborhoodFrag)
                    .commit();
            currentFrag = parkNeighborhoodFrag;
        } else if (currentFrag.equals(parkReturnFrag)) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.frag_container, UserRatingsFragment.newInstance(getString(R.string.park_enjoyment_question)))
                    .addToBackStack(parkEnjoymentFrag)
                    .commit();
            currentFrag = parkEnjoymentFrag;
        } else if (currentFrag.equals(userCommentFrag)) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.frag_container, UserRatingsFragment.newInstance(getString(R.string.park_return_question)))
                    .addToBackStack(parkReturnFrag)
                    .commit();
            currentFrag = parkReturnFrag;
        }
        super.onBackPressed();
    }

    @Override
    public void commentSubmit(final String comment) {
        Log.i(HomeActivity.tag, comment);

        reference = database.getReference("parks").child((mVenue.getmID()));

        reference.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                totalQualityRatings = dataSnapshot.child("averages").child("parkQuality").child("totalRatings").getValue(Double.class);

                totalQualityReviews = dataSnapshot.child("averages").child("parkQuality").child("totalReviews").getValue(Integer.class);

                totalEquipmentRatings = dataSnapshot.child("averages").child("parkEquipment").child("totalRatings").getValue(Double.class);

                totalEquipmentReviews = dataSnapshot.child("averages").child("parkEquipment").child("totalReviews").getValue(Integer.class);

                totalNeighborhoodRating = dataSnapshot.child("averages").child("neighborhood").child("totalRatings").getValue(Double.class);

                totalNeighborhoodReviews = dataSnapshot.child("averages").child("neighborhood").child("totalReviews").getValue(Integer.class);

                totalEnjoymentRating = dataSnapshot.child("averages").child("overallEnjoyment").child("totalRatings").getValue(Double.class);

                totalEnjoymentReviews = dataSnapshot.child("averages").child("overallEnjoyment").child("totalReviews").getValue(Integer.class);

                totalReturnRating = dataSnapshot.child("averages").child("likelinessToReturn").child("totalRatings").getValue(Double.class);

                totalReturnReviews = dataSnapshot.child("averages").child("likelinessToReturn").child("totalReviews").getValue(Integer.class);

                totalQualityRatings += qualityRating;
                totalQualityReviews++;
                totalEquipmentRatings += equipmentRating;
                totalEquipmentReviews++;
                totalNeighborhoodRating += neighborhoodRating;
                totalNeighborhoodReviews++;
                totalEnjoymentRating += enjoymentRating;
                totalEnjoymentReviews++;
                totalReturnRating += returnRating;
                totalReturnReviews++;

                DatabaseReference updateReference = database.getReference("parks").child(mVenue.getmID()).child("averages").child("parkQuality").child("totalRatings");
                updateReference.setValue(totalQualityRatings);

                updateReference = database.getReference("parks").child(mVenue.getmID()).child("averages").child("parkQuality").child("totalReviews");
                updateReference.setValue(totalQualityReviews);

                updateReference = database.getReference("parks").child(mVenue.getmID()).child("averages").child("parkEquipment").child("totalRatings");
                updateReference.setValue(totalEquipmentRatings);

                updateReference = database.getReference("parks").child(mVenue.getmID()).child("averages").child("parkEquipment").child("totalReviews");
                updateReference.setValue(totalEquipmentReviews);

                updateReference = database.getReference("parks").child(mVenue.getmID()).child("averages").child("neighborhood").child("totalRatings");
                updateReference.setValue(totalNeighborhoodRating);

                updateReference = database.getReference("parks").child(mVenue.getmID()).child("averages").child("neighborhood").child("totalReviews");
                updateReference.setValue(totalNeighborhoodReviews);

                updateReference = database.getReference("parks").child(mVenue.getmID()).child("averages").child("overallEnjoyment").child("totalRatings");
                updateReference.setValue(totalEnjoymentRating);

                updateReference = database.getReference("parks").child(mVenue.getmID()).child("averages").child("overallEnjoyment").child("totalReviews");
                updateReference.setValue(totalEnjoymentReviews);

                updateReference = database.getReference("parks").child(mVenue.getmID()).child("averages").child("likelinessToReturn").child("totalRatings");
                updateReference.setValue(totalReturnRating);

                updateReference = database.getReference("parks").child(mVenue.getmID()).child("averages").child("likelinessToReturn").child("totalReviews");
                updateReference.setValue(totalReturnReviews);

                if (comment.trim().length() > 0) {
                    Log.i(HomeActivity.tag, "waaaaaaat");
                    mComment = comment;
                    firebaseHelper.getVenueComments(mVenue.getmID());
                }
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        });

        finish();
    }

    @Override
    public void onReceivedRatings(VenueRatings ratings) {
    }

    @Override
    public void onReceivedComments(ArrayList<String> comments) {
        comments.add("default user 2 ~ " + mComment);
        Log.i(HomeActivity.tag, comments.toString());
        firebaseHelper.setVenueComments(comments, mVenue.getmID());
    }
}
