package com.sethkurkowski.android.parkaholic_20.VenueData;

// Seth Kurkowski
// May 22, 2018
// VenueImageAsyncTask.java

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Environment;
import android.util.Log;

import com.squareup.picasso.Picasso;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;

public class VenueImageAsyncTask extends AsyncTask<String, Void, ArrayList<String>> {

    public static final String tag = "Parkaholic.TAG";

    Context mContext;

    public final VenueImageTaskCallback venueImageTaskCallback;
    public interface VenueImageTaskCallback {
        void taskStart();
        void taskFinish(ArrayList<String> imageUris);
    }

    public VenueImageAsyncTask(VenueImageTaskCallback venueImageTaskCallback, Context context) {
        this.venueImageTaskCallback = venueImageTaskCallback;
        mContext = context;
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();

        venueImageTaskCallback.taskStart();
    }

    @Override
    protected ArrayList<String> doInBackground(String... strings) {
        Log.i(tag, "image doInBackground");
        if (strings[0] == null) {
            return null;
        }

        // Create array of each image item to get suffix and prefix for image urls
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
                    connection.disconnect();
                }
            }
        }

        ArrayList<String> imageUrls = new ArrayList<>();
        if (results != null) {
            try {
                JSONObject rootObj = new JSONObject(results);

                JSONObject responseObj = rootObj.getJSONObject("response");

                JSONObject photosObj = responseObj.getJSONObject("photos");

                JSONArray photoArray = photosObj.getJSONArray("items");

                // Loop through array and add image urls to list
                for (int i = 0; i < photoArray.length(); i++) {
                    JSONObject photo = photoArray.getJSONObject(i);

                    String prefix = photo.getString("prefix");

                    String suffix = photo.getString("suffix");

                    String photoUrl = prefix + "300x300" + suffix;
                    Log.i(tag, "photoUrl: " + photoUrl);
                    imageUrls.add(photoUrl);
                }

            } catch (Exception e) {
                Log.i(tag, e.getLocalizedMessage());
                e.printStackTrace();
            }
        }
        return imageUrls;
    }

    @Override
    protected void onPostExecute(ArrayList<String> strings) {
        super.onPostExecute(strings);
        venueImageTaskCallback.taskFinish(strings);
    }
}
