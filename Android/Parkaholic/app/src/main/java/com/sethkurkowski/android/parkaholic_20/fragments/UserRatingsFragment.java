package com.sethkurkowski.android.parkaholic_20.fragments;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.sethkurkowski.android.parkaholic_20.R;
import com.sethkurkowski.android.parkaholic_20.VenueActivity;

// Seth Kurkowski
// May 17, 2017
// .java

public class UserRatingsFragment extends Fragment implements View.OnClickListener {

    private static final String ARG_QUESTION = "ARG_QUESTION";
    private static String question;

    private TextView userPromptTV;
    private Button thumbsUp;
    private Button thumbsInBetween;
    private Button thumbsDown;

    private UserRatingCallback userRatingCallback;
    public interface UserRatingCallback {
        void onRatingSubmit(String category, Double value);
    }

    public static UserRatingsFragment newInstance(String _question) {
        Bundle args = new Bundle();

        question = _question;
        args.putString(ARG_QUESTION, _question);

        UserRatingsFragment fragment = new UserRatingsFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);

        if (context instanceof UserRatingCallback) {
            userRatingCallback = (UserRatingCallback) context;
        }
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.frag_user_ratings, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        if (getArguments() != null && getArguments().containsKey(ARG_QUESTION)) {

            userPromptTV = view.findViewById(R.id.user_prompt_tv);
            thumbsUp = view.findViewById(R.id.thumbs_up_btn);
            thumbsInBetween = view.findViewById(R.id.thumbs_in_between_btn);
            thumbsDown = view.findViewById(R.id.thumbs_down_btn);

            userPromptTV.setText(question);
            thumbsUp.setOnClickListener(this);
            thumbsInBetween.setOnClickListener(this);
            thumbsDown.setOnClickListener(this);
        }
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.thumbs_up_btn) {
            userRatingCallback.onRatingSubmit(question, 10.0);
        }
        if (v.getId() == R.id.thumbs_in_between_btn) {
            userRatingCallback.onRatingSubmit(question, 5.0);
        }
        if (v.getId() == R.id.thumbs_down_btn) {
            userRatingCallback.onRatingSubmit(question, 0.0);
        }
    }
}
