package com.sethkurkowski.android.parkaholic_20.fragments;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;

import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapFragment;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.sethkurkowski.android.parkaholic_20.HomeActivity;
import com.sethkurkowski.android.parkaholic_20.R;
import com.sethkurkowski.android.parkaholic_20.VenueActivity;
import com.sethkurkowski.android.parkaholic_20.VenueData.Venue;

import java.util.ArrayList;

// Seth Kurkowski
// May 9, 2018
// ParkMapFragment.java

public class ParkMapFragment extends MapFragment implements OnMapReadyCallback, GoogleMap.InfoWindowAdapter, GoogleMap.OnInfoWindowClickListener {

    public static final String tag = "Parkaholic.TAG";
    private static final String ARGS_LAT = "ARGS_LAT";
    private static final String ARGS_LONG = "ARGS_LONG";
    private static final String ARGS_VENUES = "ARGS_VENUES";

    private GoogleMap mMap;
    private Context mContext;

    private MapFragCallback mapFragCallback;

    public interface MapFragCallback {
        void parkSelected(Venue venue);
    }

    public static ParkMapFragment newInstance(Double _lat, Double _long, ArrayList<Venue> _venues) {
        Bundle args = new Bundle();

        args.putDouble(ARGS_LAT, _lat);
        args.putDouble(ARGS_LONG, _long);
        args.putSerializable(ARGS_VENUES, _venues);

        ParkMapFragment fragment = new ParkMapFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);

        if (context instanceof MapFragCallback) {
            mContext = context;
            mapFragCallback = (MapFragCallback) context;
        }
    }

    @Override
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);

        getMapAsync(this);
    }

    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;
        mMap.setInfoWindowAdapter(this);
        mMap.setOnInfoWindowClickListener(this);

        // Set user's location with default current location marker.
        if (ActivityCompat.checkSelfPermission(mContext, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
            mMap.setMyLocationEnabled(true);
        }

        // Zoom map to current location
        zoomInMap();

        // Add parks to map
        addParkMarkers();
    }

    private void addParkMarkers() {
        if (mMap == null) {
            return;
        }

        if (getArguments() != null && getArguments().containsKey(ARGS_VENUES)) {
            ArrayList<Venue> venues = (ArrayList<Venue>) getArguments().getSerializable(ARGS_VENUES);

            if (venues != null) {
                for (Venue v : venues) {
                    MarkerOptions options = new MarkerOptions();
                    options.title(v.getmName());
                    options.snippet(v.getmCity());

                    LatLng venueLocation = new LatLng(v.getmLat(), v.getmLong());
                    options.position(venueLocation);

                    Marker marker = mMap.addMarker(options);
                    marker.setTag(v);
                }
            }
        }
    }

    private void zoomInMap() {
        if (mMap == null) {
            return;
        }

        if (getArguments() != null && getArguments().containsKey(ARGS_LAT) && getArguments().containsKey(ARGS_LONG)) {
            Double lat = getArguments().getDouble(ARGS_LAT);
            Double lng = getArguments().getDouble(ARGS_LONG);

            LatLng currentLocation = new LatLng(lat, lng);
            CameraUpdate cameraUpdate = CameraUpdateFactory.newLatLngZoom(currentLocation, 16);
            mMap.animateCamera(cameraUpdate);
        }
    }

    @Override
    public View getInfoWindow(Marker marker) {
        return null;
    }

    @Override
    public View getInfoContents(Marker marker) {
        View contents = LayoutInflater.from(mContext).inflate(R.layout.info_window, null);

        ((TextView) contents.findViewById(R.id.title)).setText(marker.getTitle());
        ((TextView) contents.findViewById(R.id.snippet)).setText(marker.getSnippet());

        return contents;
    }

    @Override
    public void onInfoWindowClick(Marker marker) {
        mapFragCallback.parkSelected((Venue) marker.getTag());
    }
}
