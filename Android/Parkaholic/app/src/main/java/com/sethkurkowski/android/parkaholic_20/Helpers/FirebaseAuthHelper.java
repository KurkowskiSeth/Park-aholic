package com.sethkurkowski.android.parkaholic_20.Helpers;

// Seth Kurkowski
// May 15, 2018
// FirebaseAuthHelper.java

import android.app.Activity;
import android.support.annotation.NonNull;
import android.util.Log;

import com.firebase.ui.auth.AuthUI;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseUser;
import com.sethkurkowski.android.parkaholic_20.VenueActivity;

import java.util.Arrays;
import java.util.List;

public class FirebaseAuthHelper {

    public static final int RC_SIGN_IN = 123;

    List<AuthUI.IdpConfig> providers = Arrays.asList(
            new AuthUI.IdpConfig.EmailBuilder().build(),
            new AuthUI.IdpConfig.GoogleBuilder().build(),
            new AuthUI.IdpConfig.FacebookBuilder().build(),
            new AuthUI.IdpConfig.TwitterBuilder().build()
    );

    private Activity mActivity;
    private FirebaseUser mUser;
    private static FirebaseAuthHelper firebaseAuthHelper = null;
    public boolean mIsSignedIn = false;

    private FirebaseAuthHelper(Activity activity) {
        mUser = null;
        mActivity = activity;
    }

    public static FirebaseAuthHelper getInstance(Activity activity) {
        if (firebaseAuthHelper == null) {
            firebaseAuthHelper = new FirebaseAuthHelper(activity);
        }
        return firebaseAuthHelper;
    }

    public void setmActivity(Activity activity) {
        mActivity = activity;
    }

    public void signIn() {
        mActivity.startActivityForResult(
                AuthUI.getInstance()
                        .createSignInIntentBuilder()
                        .setAvailableProviders(providers)
                        .build(),
                RC_SIGN_IN
        );
    }

    public void signOut() {
        AuthUI.getInstance()
                .signOut(mActivity)
                .addOnCompleteListener(new OnCompleteListener<Void>() {
                    @Override
                    public void onComplete(@NonNull Task<Void> task) {
                        firebaseAuthHelper.setmUser(null);
                        firebaseAuthHelper.mIsSignedIn = false;
                        mActivity.invalidateOptionsMenu();
                    }
                });
    }

    public void setmUser(FirebaseUser firebaseUser) {
        firebaseAuthHelper.mUser = firebaseUser;
        firebaseAuthHelper.mIsSignedIn = true;
    }
}
