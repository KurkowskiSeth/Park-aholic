package com.sethkurkowski.android.parkaholic_20.VenueData;

// Seth Kurkowski
// May 8, 2018
// Venue.java

import android.util.Log;

import com.sethkurkowski.android.parkaholic_20.VenueActivity;

import java.io.Serializable;

public class Venue implements Serializable {

    private String mID;
    private String mName;
    private String mCity;
    private String mUrl;
    private Double mLat;
    private Double mLong;
    private String phoneNumber;
    private String address;
    private VenueRatings ratings = null;


    public Venue(String mID, String mName, String mCity, String mUrl, Double mLat, Double mLong, String phoneNumber, String address) {
        this.mID = mID;
        this.mName = mName;
        this.mCity = mCity;
        this.mUrl = mUrl;
        this.mLat = mLat;
        this.mLong = mLong;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public Venue(String mID, String mName, String mCity, String mUrl, Double mLat, Double mLong, String phoneNumber, String address, VenueRatings ratings) {
        this.mID = mID;
        this.mName = mName;
        this.mCity = mCity;
        this.mUrl = mUrl;
        this.mLat = mLat;
        this.mLong = mLong;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.ratings = ratings;
    }

    public String getmID() {
        return mID;
    }

    public String getmName() {
        return mName;
    }

    public String getmCity() {
        return mCity;
    }

    public String getmUrl() {
        return mUrl;
    }

    public Double getmLat() {
        return mLat;
    }

    public Double getmLong() {
        return mLong;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public VenueRatings getRatings() {
        return ratings;
    }

    @Override
    public String toString() {
        return "------------------------------\n"
                + "Id: " + mID + "\n"
                + "Name: " + mName + "\n"
                + "City: " + mCity + "\n"
                + "Url: " + mUrl + "\n"
                + "Lat: " + mLat + "\n"
                + "Lng: " + mLong + "\n"
                + "Phone: " + phoneNumber + "\n"
                + "Address: " + address + "\n";

    }
}
