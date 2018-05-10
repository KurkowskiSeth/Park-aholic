package com.sethkurkowski.android.parkaholic_20;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

import com.sethkurkowski.android.parkaholic_20.VenueData.Venue;

public class VenueActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_venue);

        if (getIntent().getExtras() != null && getIntent().getExtras().containsKey(HomeActivity.EXTRA_PARK)) {
            Venue venue = (Venue) getIntent().getExtras().get(HomeActivity.EXTRA_PARK);

            if (venue != null) {
                ((TextView) findViewById(R.id.venue_name_tv)).setText(venue.getmName());
            }
        }
    }
}
