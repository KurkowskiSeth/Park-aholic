package com.sethkurkowski.android.parkaholic_20.VenueData;

// Seth Kurkowski
// May 8, 2018
// Venue.java

public class Venue {

    private String mID;
    private String mName;
    private String mCity;
    private String mUrl;
//    private String[] mImages;

    public Venue(String mID, String mName, String mCity, String mUrl) {
        this.mID = mID;
        this.mName = mName;
        this.mCity = mCity;
        this.mUrl = mUrl;
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

    @Override
    public String toString() {
//        String string = "------------------------------\n"
//                + "Id: " + mID + "\n"
//                + "Name: " + mName + "\n"
//                + "City: " + mCity + "\n";
//
//        for (int i = 0; i < mImages.length; i++) {
//            int count = i + 1;
//            String imageUrl = mImages[i];
//
//            string += "Image " + count + ": " + imageUrl;
//        }

        return "------------------------------\n"
                + "Id: " + mID + "\n"
                + "Name: " + mName + "\n"
                + "City: " + mCity + "\n"
                + "Url: " + mUrl + "\n";

    }
}
