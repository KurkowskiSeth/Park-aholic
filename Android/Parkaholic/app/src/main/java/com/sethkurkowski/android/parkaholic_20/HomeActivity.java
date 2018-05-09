package com.sethkurkowski.android.parkaholic_20;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import com.sethkurkowski.android.parkaholic_20.VenueData.Venue;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueAsyncTask;

import java.util.ArrayList;

// Seth Kurkowski
// May 8, 2018
// HomeActivity.java

public class HomeActivity extends AppCompatActivity implements VenueAsyncTask.VenueTaskCallback {

    public static final String tag = "TAG";

    private static final int REQUEST_LOCATION_PERMISSIONS = 0x01001;

    private LocationManager mLocationManager;
    private Location mLastKnownLocation;
    private Double mLatitude;
    private Double mLongitude;

    ArrayList<Venue> mVenues;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
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
            VenueAsyncTask asyncTask = new VenueAsyncTask(this);

            String clientId = getString(R.string.client_id);
            String clientSecret = getString(R.string.client_secret);
            String apiUrl = "https://api.foursquare.com/v2/venues/search/?"
                    + "ll=" + Double.toString(mLatitude)
                    + "," + Double.toString(mLongitude)
                    + "&categoryId=4bf58dd8d48988d163941735"
                    + "&client_id=" + clientId
                    + "&client_secret=" + clientSecret
                    + "&v=20180111";

            if (isConnected()) {
                asyncTask.execute(apiUrl);
            }

        }

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

    // VenueTaskCallbacks
    @Override
    public void taskStart() {

    }

    @Override
    public void taskFinish(ArrayList<Venue> venues) {
        mVenues = venues;
    }
}
