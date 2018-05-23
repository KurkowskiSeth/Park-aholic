package com.sethkurkowski.android.parkaholic_20.fragments;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.sethkurkowski.android.parkaholic_20.Helpers.FirebaseDatabaseHelper;
import com.sethkurkowski.android.parkaholic_20.R;
import com.sethkurkowski.android.parkaholic_20.VenueData.VenueRatings;

// Seth Kurkowski
// May 23, 2018
// ParkRatingsFragment.java
public class ParkRatingsFragment extends Fragment implements FirebaseDatabaseHelper.FirebaseDataCallback{

    public static final String ARG_PARK_ID = "ARG_PARK_ID";

    public static ParkRatingsFragment newInstance(String parkId) {

        Bundle args = new Bundle();

        args.putString(ARG_PARK_ID, parkId);

        ParkRatingsFragment fragment = new ParkRatingsFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.frag_venue_ratings, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        if (getArguments() != null && getArguments().containsKey(ARG_PARK_ID)) {
            String parkId = getArguments().getString(ARG_PARK_ID);
            if (parkId != null) {
                // Get venue ratings and update stars on screen
                FirebaseDatabaseHelper firebaseDatabaseHelper = FirebaseDatabaseHelper.getInstance();
                firebaseDatabaseHelper.setDataCallback(this);
                firebaseDatabaseHelper.getVenueRatings(parkId);
            }
        }
    }

    @Override
    public void onReceivedRatings(VenueRatings ratings) {
        if (ratings != null) {
            updateVenueStars(ratings);
        }
    }

    private void updateVenueStars(VenueRatings ratings) {
        updateQualityStars(ratings.getQuality());
        updateEquipmentStars(ratings.getEquipment());
        updateNeighborhoodStars(ratings.getNeighborhood());
        updateEnjoymentStars(ratings.getEnjoyment());
        updateReturnStars(ratings.getLikelinessToReturn());
    }

    private void updateQualityStars(int rating) {
        if (getView() != null) {
            ImageView star1 = getView().findViewById(R.id.qualityStar1);
            ImageView star2 = getView().findViewById(R.id.qualityStar2);
            ImageView star3 = getView().findViewById(R.id.qualityStar3);
            ImageView star4 = getView().findViewById(R.id.qualityStar4);
            ImageView star5 = getView().findViewById(R.id.qualityStar5);

            if (rating == 1) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 2) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 3) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 4) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 5) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star5.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            }
        }
    }

    private void updateEquipmentStars(int rating) {
        if (getView() != null) {
            ImageView star1 = getView().findViewById(R.id.equipmentStar1);
            ImageView star2 = getView().findViewById(R.id.equipmentStar2);
            ImageView star3 = getView().findViewById(R.id.equipmentStar3);
            ImageView star4 = getView().findViewById(R.id.equipmentStar4);
            ImageView star5 = getView().findViewById(R.id.equipmentStar5);

            if (rating == 1) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 2) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 3) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 4) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 5) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star5.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            }
        }
    }

    private void updateNeighborhoodStars(int rating) {
        if (getView() != null) {
            ImageView star1 = getView().findViewById(R.id.neighborhoodStar1);
            ImageView star2 = getView().findViewById(R.id.neighborhoodStar2);
            ImageView star3 = getView().findViewById(R.id.neighborhoodStar3);
            ImageView star4 = getView().findViewById(R.id.neighborhoodStar4);
            ImageView star5 = getView().findViewById(R.id.neighborhoodStar5);

            if (rating == 1) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 2) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 3) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 4) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 5) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star5.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            }
        }
    }

    private void updateEnjoymentStars(int rating) {
        if (getView() != null) {
            ImageView star1 = getView().findViewById(R.id.enjoymentStar1);
            ImageView star2 = getView().findViewById(R.id.enjoymentStar2);
            ImageView star3 = getView().findViewById(R.id.enjoymentStar3);
            ImageView star4 = getView().findViewById(R.id.enjoymentStar4);
            ImageView star5 = getView().findViewById(R.id.enjoymentStar5);

            if (rating == 1) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 2) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 3) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 4) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 5) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star5.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            }
        }
    }

    private void updateReturnStars(int rating) {
        if (getView() != null) {
            ImageView star1 = getView().findViewById(R.id.returnStar1);
            ImageView star2 = getView().findViewById(R.id.returnStar2);
            ImageView star3 = getView().findViewById(R.id.returnStar3);
            ImageView star4 = getView().findViewById(R.id.returnStar4);
            ImageView star5 = getView().findViewById(R.id.returnStar5);

            if (rating == 1) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 2) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 3) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 4) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            } else if (rating == 5) {
                star1.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star2.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star3.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star4.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
                star5.setImageDrawable(getResources().getDrawable(R.drawable.parkaholic_star_filled));
            }
        }
    }
}
