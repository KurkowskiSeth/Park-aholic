package com.sethkurkowski.android.parkaholic_20.fragments;

// Seth Kurkowski
// May 23, 2018
// ParkInfoFragment.java

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.sethkurkowski.android.parkaholic_20.R;

public class ParkInfoFragment extends Fragment {

    public static final String ARG_ADDRESS_CITY = "ARG_ADDRESS_CITY";
    public static final String ARG_PHONE = "ARG_PHONE";
    public static final String ARG_URL = "ARG_URL";

    public static ParkInfoFragment newInstance(String city, String address, String phone, String url) {

        Bundle args = new Bundle();

        if (address!= null) {
            args.putString(ARG_ADDRESS_CITY, address);
        } else {
            args.putString(ARG_ADDRESS_CITY, city);
        }
        args.putString(ARG_PHONE, phone);
        args.putString(ARG_URL, url);

        ParkInfoFragment fragment = new ParkInfoFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.frag_venue_info, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        TextView addressTV = view.findViewById(R.id.address_city_tv);
        TextView phoneTV = view.findViewById(R.id.phone_number_tv);
        TextView urlTV = view.findViewById(R.id.park_url_tv);

        if (getArguments() != null && getArguments().containsKey(ARG_ADDRESS_CITY) && getArguments().containsKey(ARG_PHONE) && getArguments().containsKey(ARG_PHONE)) {
            String address_city = getArguments().getString(ARG_ADDRESS_CITY);
            String phone = getArguments().getString(ARG_PHONE);
            String url = getArguments().getString(ARG_URL);

            if (address_city != null) {
                addressTV.setText(address_city);
            } else {
                addressTV.setVisibility(View.GONE);
            }

            if (phone != null) {
                phoneTV.setText(phone);
            } else {
                phoneTV.setVisibility(View.GONE);
            }

            if (url != null) {
                urlTV.setText(url);
            } else {
                urlTV.setVisibility(View.GONE);
            }
        }

    }
}
