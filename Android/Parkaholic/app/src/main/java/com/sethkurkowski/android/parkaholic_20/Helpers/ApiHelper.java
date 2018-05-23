package com.sethkurkowski.android.parkaholic_20.Helpers;

// Seth Kurkowski
// May 10, 2018
// ApiHelper.java

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.widget.Toast;

import com.google.android.gms.maps.model.LatLng;
import com.sethkurkowski.android.parkaholic_20.HomeActivity;
import com.sethkurkowski.android.parkaholic_20.R;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueAsyncTask;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueImageAsyncTask;

public class ApiHelper {

    private static final int REQUEST_LOCATION_PERMISSIONS = 0x01001;

    public static Double mUserLatitude;
    public static Double mUserLongitude;

    private static ApiHelperCallback apiHelperCallback;
    public interface ApiHelperCallback {
        void setCurrentLocation(LatLng latLng);
    }

    public static void checkLocationPermissions(Context _context, Activity _activity) {
        Log.i(HomeActivity.tag, "checkLocationPermissions");

        if (_context instanceof ApiHelperCallback) {
            apiHelperCallback = (ApiHelperCallback) _context;

            // Check if user has granted location permissions
            if (ContextCompat.checkSelfPermission(_context, android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                // Request for user to give app location permissions.
                ActivityCompat.requestPermissions(_activity, new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, REQUEST_LOCATION_PERMISSIONS);
                // Check one more time to see if user has granted permission if not then return so the user isn't spammed with request.
                if (ContextCompat.checkSelfPermission(_context, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                    return;
                }
            }
            // If user has given permission to use location then gather user's location.
            getUserLocation(_context);
        }
    }

    public static void getUserLocation(Context _context) {
        Log.i(HomeActivity.tag, "getUserLocation");
        // Check for permission to use location.
        if (ContextCompat.checkSelfPermission(_context, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
            // Pull user's location
            LocationManager mgr = (LocationManager) _context.getSystemService(Context.LOCATION_SERVICE);
            if (mgr != null) {
                Location lastKnown;
                if (isConnected(_context)) {
                    Log.i(HomeActivity.tag, String.valueOf(isConnected(_context)));
                    // User network if user is connected to the internet.
                    lastKnown = mgr.getLastKnownLocation(LocationManager.NETWORK_PROVIDER);
                } else {
                    // User the device's gps because there is no internet connection.
                    lastKnown = mgr.getLastKnownLocation(LocationManager.GPS_PROVIDER);
                }
                Log.i(HomeActivity.tag, "before null check");
                if (lastKnown != null) {
                    Log.i(HomeActivity.tag, "null check");
                    mUserLatitude = lastKnown.getLatitude();
                    mUserLongitude = lastKnown.getLongitude();
                }

                if (mUserLatitude != null && mUserLongitude != null) {
                    Log.i(HomeActivity.tag, "another null check");
                    LatLng latLng = new LatLng(mUserLatitude, mUserLongitude);
                    // Take user location and construct an api url.
                    makeCallToApi(latLng, _context, false);
                }
                Log.i(HomeActivity.tag, "after null check");
            }
        } else {
            // Alert user that they don't have the ability to access location.
            Toast.makeText(_context, "User Location Permission Denied", Toast.LENGTH_SHORT).show();
        }
    }

    public static void makeCallToApi(LatLng _latLng, Context _context, boolean _isSearching) {
        Log.i(HomeActivity.tag, "makeCallToApi");
        // Set current location of screen to home screen.
        if (_isSearching) {
            Log.i(HomeActivity.tag, _latLng.toString());
            apiHelperCallback.setCurrentLocation(_latLng);
        } else {
            Log.i(HomeActivity.tag, _latLng.toString());
            apiHelperCallback.setCurrentLocation(new LatLng(mUserLatitude, mUserLongitude));
        }

        if (_context instanceof VenueAsyncTask.VenueTaskCallback) {
            VenueAsyncTask asyncTask = new VenueAsyncTask((VenueAsyncTask.VenueTaskCallback) _context);

            String clientId = _context.getString(R.string.client_id);
            String clientSecret = _context.getString(R.string.client_secret);
            String apiUrl = "https://api.foursquare.com/v2/venues/search/?"
                    + "ll=" + Double.toString(_latLng.latitude)
                    + "," + Double.toString(_latLng.longitude)
                    + "&categoryId=4bf58dd8d48988d163941735"
                    + "&client_id=" + clientId
                    + "&client_secret=" + clientSecret
                    + "&v=20180111";

            if (isConnected(_context)) {
                asyncTask.execute(apiUrl);
            }
        }
    }

    public static void pullParkImages(Context context, String id) {
        Log.i(HomeActivity.tag, "pullParkImages");

        if (context instanceof VenueImageAsyncTask.VenueImageTaskCallback) {
            VenueImageAsyncTask asyncTask = new VenueImageAsyncTask((VenueImageAsyncTask.VenueImageTaskCallback) context, context);

            // Construct api url
            String clientId = context.getString(R.string.client_id);
            String clientSecret = context.getString(R.string.client_secret);
            String imageApiUrl = "https://api.foursquare.com/v2/venues/"
                    + id
                    + "/photos?&client_id=" + clientId
                    + "&client_secret=" + clientSecret
                    +"&v=20180111";

            if (isConnected(context)) {
                asyncTask.execute(imageApiUrl);
            }
        }
    }

    public static boolean isConnected(Context _context) {
        Log.i(HomeActivity.tag, "isConnected");
        // Get access to connectivity services
        ConnectivityManager mgr = (ConnectivityManager) _context.getSystemService(Context.CONNECTIVITY_SERVICE);
        if (mgr != null) {
            NetworkInfo info = mgr.getActiveNetworkInfo();
            if (info != null) {
                return info.isConnected();
            }
        }
        return false;
    }
}
