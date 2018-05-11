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
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.location.places.AutocompleteFilter;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.location.places.ui.PlaceAutocomplete;
import com.google.android.gms.maps.model.LatLng;
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

public class HomeActivity extends AppCompatActivity implements VenueAsyncTask.VenueTaskCallback, ParkMapFragment.MapFragCallback, ApiHelper.ApiHelperCallback {

    public static final String tag = "Parkaholic.TAG";

    public static final String EXTRA_PARK = "EXTRA_PARK";

    private static final int RC_SIGN_IN = 123;
    private static final int RC_GOOGLE_SEARCH = 321;

    List<AuthUI.IdpConfig> providers = Arrays.asList(
            new AuthUI.IdpConfig.EmailBuilder().build(),
            new AuthUI.IdpConfig.GoogleBuilder().build(),
            new AuthUI.IdpConfig.FacebookBuilder().build(),
            new AuthUI.IdpConfig.TwitterBuilder().build()
    );

    private FirebaseUser mUser;

    private Double mLatitude;
    private Double mLongitude;

    private boolean isSearching = false;

    ArrayList<Venue> mVenuesLocal;
    ArrayList<Venue> mVenuesSearch;
    ArrayList<Venue> mVenuesCurrent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Log.i(tag, "onCreate");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        // Check permissions and pull location
        ApiHelper.checkLocationPermissions(this, this);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        Log.i(HomeActivity.tag, "onCreateOptionsMenu");
        if (mUser != null) {
            if (isSearching) {
                getMenuInflater().inflate(R.menu.activity_home_signed_in_search, menu);
            } else {
                getMenuInflater().inflate(R.menu.activity_home_signed_in, menu);
            }
        } else {
            if (isSearching) {
                getMenuInflater().inflate(R.menu.activity_home_signed_out_search, menu);
            }else {
                getMenuInflater().inflate(R.menu.activity_home_signed_out, menu);
            }
        }
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        Log.i(HomeActivity.tag, "onOptionsItemSelected");
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
        } else if (item.getItemId() == R.id.search_parks) {
            // Launch Search fragment.
            try {
                AutocompleteFilter autocompleteFilter = new AutocompleteFilter.Builder()
                        .setTypeFilter(AutocompleteFilter.TYPE_FILTER_CITIES).build();

                Intent searchIntent = new PlaceAutocomplete.IntentBuilder(PlaceAutocomplete.MODE_OVERLAY)
                        .setFilter(autocompleteFilter).build(this);

                startActivityForResult(searchIntent, RC_GOOGLE_SEARCH);
            } catch (GooglePlayServicesRepairableException | GooglePlayServicesNotAvailableException e) {
                Log.i(tag, e.getLocalizedMessage());
                e.printStackTrace();
            }
        } else if (item.getItemId() == R.id.cancel_search_parks) {
            mVenuesCurrent = mVenuesLocal;
            isSearching = false;

            invalidateOptionsMenu();
            loadMap();
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        Log.i(HomeActivity.tag, "onRequestPermissionsResult");
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);

        if (!isSearching) {
            ApiHelper.getUserLocation(this);
        }
    }

    // VenueTaskCallbacks
    @Override
    public void taskStart() {
        Log.i(HomeActivity.tag, "taskStart");
    }

    @Override
    public void taskFinish(ArrayList<Venue> venues) {
        Log.i(HomeActivity.tag, "taskFinish");
        if (isSearching) {
            mVenuesSearch = venues;
        } else {
            mVenuesLocal = venues;
        }
        mVenuesCurrent = venues;

        //Load map fragment
        loadMap();
    }

    @Override
    public void parkSelected(Venue venue) {
        Log.i(HomeActivity.tag, "parkSelected");
        Intent intent = new Intent(this, VenueActivity.class);
        intent.putExtra(EXTRA_PARK, venue);
        startActivity(intent);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        Log.i(HomeActivity.tag, "onActivityResult");
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == RC_SIGN_IN) {
            if (resultCode == RESULT_OK) {
                mUser = FirebaseAuth.getInstance().getCurrentUser();
                invalidateOptionsMenu();
            }
        } else if (requestCode == RC_GOOGLE_SEARCH) {
            if (resultCode == RESULT_OK) {
                isSearching = true;
                invalidateOptionsMenu();

                // Get place object and call api
                Place place = PlaceAutocomplete.getPlace(this, data);
                ApiHelper.makeCallToApi(place.getLatLng(), this, true);
            }
        }
    }

    private void loadMap() {
        Log.i(HomeActivity.tag, "loadMap");

        if (!isSearching) {
            mLatitude = ApiHelper.mUserLatitude;
            mLongitude = ApiHelper.mUserLongitude;
        }

        ParkMapFragment fragment = ParkMapFragment.newInstance(mLatitude, mLongitude, mVenuesCurrent);
        getFragmentManager().beginTransaction().replace(R.id.frag_container, fragment, ParkMapFragment.tag).commit();
    }

    @Override
    public void setCurrentLocation(LatLng latLng) {
        Log.i(tag, "setCurrentLocation");
        mLatitude = latLng.latitude;
        mLongitude = latLng.longitude;
    }
}
