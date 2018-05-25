package com.sethkurkowski.android.parkaholic_20.Helpers;

// Seth Kurkowski
// May 19, 2018
// FirebaseDatabaseHelper.java

import android.util.Log;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.GenericTypeIndicator;
import com.google.firebase.database.ValueEventListener;
import com.sethkurkowski.android.parkaholic_20.HomeActivity;
import com.sethkurkowski.android.parkaholic_20.VenueActivity;
import com.sethkurkowski.android.parkaholic_20.VenueData.Venue;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueRatings;

import java.util.ArrayList;
import java.util.List;

public class FirebaseHelper {

    private static FirebaseHelper firebaseHelper = null;
    private FirebaseDatabase database = FirebaseDatabase.getInstance();
    private DatabaseReference reference;

    private FirebaseDataCallback callback;
    public interface FirebaseDataCallback {
        void onReceivedRatings(VenueRatings ratings);
        void onReceivedComments(ArrayList<String> comments);
    }

    public static FirebaseHelper getInstance() {
        if (firebaseHelper == null) {
            firebaseHelper = new FirebaseHelper();
        }
        return firebaseHelper;
    }

    public void setDataCallback(FirebaseDataCallback dataCallback) {
        if (dataCallback != null) {
            callback = dataCallback;
        }
    }

    public void getVenueRatings(String parkId) {
        reference = database.getReference("parks").child(parkId).child("averages");

        final Integer[] qualityRatings = new Integer[1];
        final Integer[] qualityReviews = new Integer[1];
        final Integer[] equipmentRatings = new Integer[1];
        final Integer[] equipmentReviews = new Integer[1];
        final Integer[] neighborhoodRatings = new Integer[1];
        final Integer[] neighborhoodReviews = new Integer[1];
        final Integer[] enjoymentRatings = new Integer[1];
        final Integer[] enjoymentReviews = new Integer[1];
        final Integer[] returnRatings = new Integer[1];
        final Integer[] returnReviews = new Integer[1];

        reference.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                qualityRatings[0] = dataSnapshot.child("parkQuality").child("totalRatings").getValue(Integer.class);
                qualityReviews[0] = dataSnapshot.child("parkQuality").child("totalReviews").getValue(Integer.class);

                equipmentRatings[0] = dataSnapshot.child("parkEquipment").child("totalRatings").getValue(Integer.class);
                equipmentReviews[0] = dataSnapshot.child("parkEquipment").child("totalReviews").getValue(Integer.class);

                neighborhoodRatings[0] = dataSnapshot.child("neighborhood").child("totalRatings").getValue(Integer.class);
                neighborhoodReviews[0] = dataSnapshot.child("neighborhood").child("totalReviews").getValue(Integer.class);

                enjoymentRatings[0] = dataSnapshot.child("overallEnjoyment").child("totalRatings").getValue(Integer.class);
                enjoymentReviews[0] = dataSnapshot.child("overallEnjoyment").child("totalReviews").getValue(Integer.class);

                returnRatings[0] = dataSnapshot.child("likelinessToReturn").child("totalRatings").getValue(Integer.class);
                returnReviews[0] = dataSnapshot.child("likelinessToReturn").child("totalReviews").getValue(Integer.class);

                if (qualityRatings[0] != null && qualityReviews[0] != null &&
                        equipmentRatings[0] != null && equipmentReviews[0] != null &&
                        neighborhoodRatings[0] != null && neighborhoodReviews[0] != null &&
                        enjoymentRatings[0] != null && enjoymentReviews[0] != null &&
                        returnRatings[0] != null && returnReviews[0] != null) {

                    if (callback != null) {
                        callback.onReceivedRatings(new VenueRatings(qualityRatings[0], qualityReviews[0],
                                equipmentRatings[0], equipmentReviews[0],
                                neighborhoodRatings[0], neighborhoodReviews[0],
                                enjoymentRatings[0], enjoymentReviews[0],
                                returnRatings[0], returnReviews[0]));
                    }
                } else {
                    if (callback != null) {
                        callback.onReceivedRatings(null);
                    }
                }
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        });
    }

    public void getVenueComments(String parkId) {
        reference = database.getReference().child("parks").child(parkId).child("comments");
        reference.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                GenericTypeIndicator<List<String>> genericTypeIndicator = new GenericTypeIndicator<List<String>>() {};
                List<String> commentsList = dataSnapshot.getValue(genericTypeIndicator);
                ArrayList<String> commentsArrayList = (ArrayList<String>) commentsList;
                if (commentsArrayList != null) {
                    callback.onReceivedComments(commentsArrayList);
                } else {
                    commentsArrayList = new ArrayList<>();
                    commentsArrayList.add("No Comments Yet ~ No Comments Yet");
                    callback.onReceivedComments(commentsArrayList);
                }
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        });
    }

    public void setVenueComments(ArrayList<String> comments, String parkId) {
        reference = database.getReference().child("parks").child(parkId).child("comments");
        reference.setValue(comments);
    }

    public void setVenueCommentsListener(String parkId) {
        reference = database.getReference().child("parks").child(parkId).child("comments");
        reference.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                GenericTypeIndicator<List<String>> genericTypeIndicator = new GenericTypeIndicator<List<String>>() {};
                List<String> commentsList = dataSnapshot.getValue(genericTypeIndicator);
                ArrayList<String> commentsArrayList = (ArrayList<String>) commentsList;
                if (commentsArrayList != null) {
                    callback.onReceivedComments(commentsArrayList);
                } else {
                    commentsArrayList = new ArrayList<>();
                    commentsArrayList.add("No Comments Yet ~ No Comments Yet");
                    callback.onReceivedComments(commentsArrayList);
                }
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {

            }
        });
    }

}
