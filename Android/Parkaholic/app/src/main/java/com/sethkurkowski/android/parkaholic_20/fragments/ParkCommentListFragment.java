package com.sethkurkowski.android.parkaholic_20.fragments;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.ListFragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.sethkurkowski.android.parkaholic_20.Helpers.FirebaseHelper;
import com.sethkurkowski.android.parkaholic_20.HomeActivity;
import com.sethkurkowski.android.parkaholic_20.R;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueRatings;

import java.util.ArrayList;

// Seth Kurkowski
// May 24, 2018
// ParkCommentListFragment.java

public class ParkCommentListFragment extends ListFragment implements FirebaseHelper.FirebaseDataCallback {

    public static final String ARG_PARK_ID = "ARG_PARK_ID";

    private ArrayList<String> mComments;

    public static ParkCommentListFragment newInstance(String parkId) {

        Bundle args = new Bundle();

        args.putString(ARG_PARK_ID, parkId);

        ParkCommentListFragment fragment = new ParkCommentListFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.frag_venue_comment_list, container, false);
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);

        FirebaseHelper firebaseHelper = FirebaseHelper.getInstance();
        firebaseHelper.setDataCallback(this);

        if (getArguments() != null && getArguments().containsKey(ARG_PARK_ID)) {
            String parkId = getArguments().getString(ARG_PARK_ID);
            if (parkId != null) {
                firebaseHelper.getVenueComments(parkId);
            }
        }
    }

    @Override
    public void onReceivedRatings(VenueRatings ratings) {

    }

    @Override
    public void onReceivedComments(ArrayList<String> comments) {
        Log.i(HomeActivity.tag, comments.toString());
        setListAdapter(new CommentAdapter(getContext(), comments));
    }
}
