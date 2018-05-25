package com.sethkurkowski.android.parkaholic_20.VenueData;

import android.os.AsyncTask;
import android.util.Log;

import com.sethkurkowski.android.parkaholic_20.VenueActivity;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;

// Seth Kurkowski
// May 8, 2018
// VenueAsyncTask.java

public class VenueAsyncTask extends AsyncTask<String, Void, ArrayList<Venue>> {

    public static final String tag = "Parkaholic.TAG";

    private final VenueTaskCallback venueTaskCallback;

    public interface VenueTaskCallback {
        void taskStart();
        void taskFinish(ArrayList<Venue> venues);
    }

    public VenueAsyncTask(VenueTaskCallback venueTaskCallback) {
        this.venueTaskCallback = venueTaskCallback;
    }

    @Override
    protected void onPreExecute() {
        venueTaskCallback.taskStart();
    }

    @Override
    protected ArrayList<Venue> doInBackground(String... strings) {
        if (strings[0] == null) {
            return null;
        }

        // Download Venues
        URL url;
        HttpURLConnection connection = null;
        InputStream inputStream = null;
        String results;

        try {
            url = new URL(strings[0]);
            connection = (HttpURLConnection) url.openConnection();
            connection.connect();
            inputStream = connection.getInputStream();
            results = IOUtils.toString(inputStream, Charset.defaultCharset());
        } catch (Exception e) {
            Log.i(tag, e.getLocalizedMessage());
            e.printStackTrace();
            return null;
        }
        finally {
            if (connection != null) {
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (Exception e) {
                        Log.i(tag, e.getLocalizedMessage());
                        e.printStackTrace();
                    }
                }
                connection.disconnect();
            }
        }

        // Parse raw data into array list of venue objects
        ArrayList<Venue> venueArrayList = new ArrayList<>();

        try {
            // Turn raw string into json object
            JSONObject parentObj = new JSONObject(results);

            // Get response data
            JSONObject response = parentObj.getJSONObject("response");

            // Get venues array
            JSONArray venues = response.getJSONArray("venues");

            // Loop through venues array
            for (int i = 0; i < venues.length(); i++) {
                // Get JSONObject for each venue
                JSONObject venue = venues.getJSONObject(i);

                // Get and save the id
                String id = venue.getString("id");

                // Get and save park name
                String name = venue.getString("name");

                // Get Phone number from contact object
                JSONObject contact = venue.getJSONObject("contact");
                String phone = null;
                if (contact.has("formattedPhone")) {
                    phone = contact.getString("formattedPhone");
                }

                // Get and save city url
                String cityUrl = "";
                if (venue.has("url")) {
                    cityUrl = venue.getString("url");
                }

                // Get data from location node
                JSONObject location = venue.getJSONObject("location");

                // Get and save park latitude value
                Double lat = location.getDouble("lat");

                // get and save park longitude value
                Double lng = location.getDouble("lng");

                // Get and save city name
                String city = location.getString("city");

                // Get formatted address
                String address = null;
                if (location.has("formattedAddress")) {
                    JSONArray formattedAddress = location.getJSONArray("formattedAddress");
                    StringBuilder addressBuilder = new StringBuilder();
                    for (int j = 0; j < formattedAddress.length(); j++) {
                        String s = formattedAddress.getString(j);
                        addressBuilder.append(s).append("\n");
                    }
                    address = addressBuilder.toString();
                }

                venueArrayList.add(new Venue(id, name, city, cityUrl, lat, lng, phone, address));
            }
        } catch (Exception e) {
            Log.i(tag, e.getLocalizedMessage());
            e.printStackTrace();
        }

        return venueArrayList;
    }

    @Override
    protected void onPostExecute(ArrayList<Venue> venues) {
        venueTaskCallback.taskFinish(venues);
    }
}
