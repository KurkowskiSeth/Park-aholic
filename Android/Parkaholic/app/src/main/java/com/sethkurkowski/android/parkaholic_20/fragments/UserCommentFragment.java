package com.sethkurkowski.android.parkaholic_20.fragments;

// Seth Kurkowski
// May 17, 2018
// .java

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;

import com.sethkurkowski.android.parkaholic_20.R;
import com.sethkurkowski.android.parkaholic_20.VenueActivity;

public class UserCommentFragment extends Fragment implements View.OnClickListener {

    EditText userCommentET;
    Button submitBtn;

    UserCommentCallback userCommentCallback;
    public interface UserCommentCallback {
        void commentSubmit(String comment);
    }

    public static UserCommentFragment newInstance() {
        Bundle args = new Bundle();

        UserCommentFragment fragment = new UserCommentFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);

        if (context instanceof UserCommentCallback) {
            userCommentCallback = (UserCommentCallback) context;
        }
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.frag_user_comment, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        userCommentET = view.findViewById(R.id.user_comment_ET);
        submitBtn = view.findViewById(R.id.submit_comment_btn);

        submitBtn.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        String comment = userCommentET.getText().toString();
        userCommentCallback.commentSubmit(comment);
    }
}
