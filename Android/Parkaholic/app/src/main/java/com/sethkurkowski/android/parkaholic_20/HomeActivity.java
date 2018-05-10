package com.sethkurkowski.android.parkaholic_20;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;

import com.firebase.ui.auth.AuthUI;
import com.firebase.ui.auth.IdpResponse;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.sethkurkowski.android.parkaholic_20.VenueData.Venue;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueAsyncTask;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

// Seth Kurkowski
// May 8, 2018
// HomeActivity.java

public class HomeActivity extends AppCompatActivity implements VenueAsyncTask.VenueTaskCallback, ParkMapFragment.MapFragCallback {

    public static final String tag = "HomeActivity.TAG";

    public static final String EXTRA_PARK = "EXTRA_PARK";

    private static final int REQUEST_LOCATION_PERMISSIONS = 0x01001;
    private static final int RC_SIGN_IN = 123;

    List<AuthUI.IdpConfig> providers = Arrays.asList(
            new AuthUI.IdpConfig.EmailBuilder().build(),
            new AuthUI.IdpConfig.GoogleBuilder().build(),
            new AuthUI.IdpConfig.FacebookBuilder().build(),
            new AuthUI.IdpConfig.TwitterBuilder().build()
    );

    private FirebaseUser mUser;

    private LocationManager mLocationManager;
    private Location mLastKnownLocation;
    private Double mLatitude;
    private Double mLongitude;

    ArrayList<Venue> mVenues;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Log.i(tag, "onCreate");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        // Get user's current location.
        mLocationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
        if (checkLocationPermission()) {
            mLastKnownLocation = mLocationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER);

            if (mLastKnownLocation != null) {
                mLatitude = mLastKnownLocation.getLatitude();
                Log.i(tag, "Lat: " + Double.toString(mLatitude));
                mLongitude = mLastKnownLocation.getLongitude();
                Log.i(tag, "Long: " + Double.toString(mLongitude));
            }
        }

        // Use last known location and get parks based off that.
        if (mLatitude != null && mLongitude != null) {
            callApiPullTask(mLatitude, mLongitude);
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        if (mUser != null) {
            getMenuInflater().inflate(R.menu.activity_home_signed_in, menu);
        } else {
            getMenuInflater().inflate(R.menu.activity_home_signed_out, menu);
        }
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.sign_in) {
            // Start activity to sign user in.
            startActivityForResult(
                    AuthUI.getInstance()
                            .createSignInIntentBuilder()
                            .setAvailableProviders(providers)
                            .build(),
                    RC_SIGN_IN
            );
        } else if (item.getItemId() == R.id.user_account) {
            // Sign user out.
            AuthUI.getInstance()
                    .signOut(this)
                    .addOnCompleteListener(new OnCompleteListener<Void>() {
                        @Override
                        public void onComplete(@NonNull Task<Void> task) {
                            mUser = null;
                            invalidateOptionsMenu();
                        }
                    });
        }

        return super.onOptionsItemSelected(item);
    }

    private Boolean checkLocationPermission() {

        // Check if user has granted location permissions
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
            return true;
        } else {
            // Request for user to give app location permissions.
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, REQUEST_LOCATION_PERMISSIONS);

            // Check one more time to see if user has granted permission if not then return false so the user isn't spammed with request.
            return ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED;
        }
    }

    private Boolean isConnected() {
        ConnectivityManager mgr = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);

        if (mgr != null) {
            NetworkInfo info = mgr.getActiveNetworkInfo();
            if (info != null) {
                return info.isConnected();
            }
        }
        return false;
    }

    private void callApiPullTask(Double _lat, Double _long) {
        Log.i(tag, "callApiPullTask");
        VenueAsyncTask asyncTask = new VenueAsyncTask(this);

        String clientId = getString(R.string.client_id);
        String clientSecret = getString(R.string.client_secret);
        String apiUrl = "https://api.foursquare.com/v2/venues/search/?"
                + "ll=" + Double.toString(_lat)
                + "," + Double.toString(_long)
                + "&categoryId=4bf58dd8d48988d163941735"
                + "&client_id=" + clientId
                + "&client_secret=" + clientSecret
                + "&v=20180111";

        if (isConnected()) {
            asyncTask.execute(apiUrl);
        }
    }

    // VenueTaskCallbacks
    @Override
    public void taskStart() {
        Log.i(tag, "taskStart");
    }

    @Override
    public void taskFinish(ArrayList<Venue> venues) {
        Log.i(tag, "taskFinish");
        mVenues = venues;

        for (Venue v : venues) {
            Log.i(tag, v.toString());
        }

        //Load map fragment
        ParkMapFragment fragment = ParkMapFragment.newInstance(mLatitude, mLongitude, mVenues);
        getFragmentManager().beginTransaction().replace(R.id.frag_container, fragment, ParkMapFragment.tag).commit();
    }

    @Override
    public void parkSelected(Venue venue) {
        Intent intent = new Intent(this, VenueActivity.class);
        intent.putExtra(EXTRA_PARK, venue);
        startActivity(intent);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == RC_SIGN_IN) {
            IdpResponse response = IdpResponse.fromResultIntent(data);

            if (resultCode == RESULT_OK) {
                mUser = FirebaseAuth.getInstance().getCurrentUser();
                invalidateOptionsMenu();
            }
        }
    }
}
