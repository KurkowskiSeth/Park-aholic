package com.sethkurkowski.android.parkaholic_20;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

public class HomeActivity extends AppCompatActivity {

    public static final String tag = "HomeActivity.TAG";

    private static final int REQUEST_LOCATION_PERMISSIONS = 0x01001;

    private LocationManager mLocationManager;
    private Location mLastKnownLocation;
    private Double mLatitude;
    private Double mLongitude;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

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
}
