package com.sethkurkowski.android.parkaholic_20.VenueData;

// Seth Kurkowski
// May 8, 2018
// Venue.java

import java.io.Serializable;

public class Venue implements Serializable {

    private String mID;
    private String mName;
    private String mCity;
    private String mUrl;
    private Double mLat;
    private Double mLong;
//    private String[] mImages;


    public Venue(String mID, String mName, String mCity, String mUrl, Double mLat, Double mLong) {
        this.mID = mID;
        this.mName = mName;
        this.mCity = mCity;
        this.mUrl = mUrl;
        this.mLat = mLat;
        this.mLong = mLong;
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

    @Override
    public String toString() {
        return "------------------------------\n"
                + "Id: " + mID + "\n"
                + "Name: " + mName + "\n"
                + "City: " + mCity + "\n"
                + "Url: " + mUrl + "\n"
                + "Lat: " + mLat + "\n"
                + "Lng: " + mLong + "\n";

    }
}
