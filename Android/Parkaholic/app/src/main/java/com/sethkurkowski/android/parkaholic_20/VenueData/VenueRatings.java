package com.sethkurkowski.android.parkaholic_20.VenueData;

// Seth Kurkowski
// May 23, 2018
// VenueRatings.java

import android.util.Log;

import com.sethkurkowski.android.parkaholic_20.HomeActivity;
import com.sethkurkowski.android.parkaholic_20.VenueActivity;

import java.io.Serializable;

public class VenueRatings implements Serializable {

    private double quality;
    private double equipment;
    private double neighborhood;
    private double enjoyment;
    private double likelinessToReturn;

    private int qualityInt = 0;
    private int equipmentInt = 0;
    private int neighborhoodInt = 0;
    private int enjoymentInt = 0;
    private int returnInt = 0;

    public VenueRatings(int totalQualityRatings, int totalQualityReviews,
                        int totalEquipmentRatings, int totalEquipmentReviews,
                        int totalNeighborhoodRatings, int totalNeighborhoodReviews,
                        int totalEnjoymentRatings, int totalEnjoymentReviews,
                        int totalReturnRatings, int totalReturnReviews) {
        if (totalQualityReviews == 0) {
            quality = 0;
        } else {
            quality = totalQualityRatings / totalQualityReviews;
        }
        if (totalEquipmentReviews == 0) {
            equipment = 0;
        } else {
            equipment = totalEquipmentRatings / totalEquipmentReviews;
        }
        if (totalNeighborhoodReviews == 0) {
            neighborhood = 0;
        } else {
            neighborhood = totalNeighborhoodRatings / totalNeighborhoodReviews;
        }
        if (totalEnjoymentReviews == 0) {
            enjoyment = 0;
        } else {
            enjoyment = totalEnjoymentRatings / totalEnjoymentReviews;
        }
        if (totalReturnReviews == 0) {
            likelinessToReturn = 0;
        } else {
            likelinessToReturn = totalReturnRatings / totalReturnReviews;
        }
    }

    public VenueRatings(int qualityInt, int equipmentInt, int neighborhoodInt, int enjoymentInt, int returnInt) {
        this.qualityInt = qualityInt;
        this.equipmentInt = equipmentInt;
        this.neighborhoodInt = neighborhoodInt;
        this.enjoymentInt = enjoymentInt;
        this.returnInt = returnInt;
    }

    public int getQualityInt() {
        return qualityInt;
    }

    public int getEquipmentInt() {
        return equipmentInt;
    }

    public int getNeighborhoodInt() {
        return neighborhoodInt;
    }

    public int getEnjoymentInt() {
        return enjoymentInt;
    }

    public int getReturnInt() {
        return returnInt;
    }

    public int getQuality() {
        if (quality > 0 && quality < 2) {
            return 1;
        } else if (quality >= 2 && quality < 4) {
            return 2;
        } else if (quality >= 4 && quality < 6) {
            return 3;
        } else if (quality >= 6 && quality < 8) {
            return 4;
        } else if (quality >= 8 && quality <= 10) {
            return 5;
        } else {
            return 0;
        }
    }

    public int getEquipment() {
        if (equipment > 0 && equipment < 2) {
            return 1;
        } else if (equipment >= 2 && equipment < 4) {
            return 2;
        } else if (equipment >= 4 && equipment < 6) {
            return 3;
        } else if (equipment >= 6 && equipment < 8) {
            return 4;
        } else if (equipment >= 8 && equipment <= 10) {
            return 5;
        } else {
            return 0;
        }
    }

    public int getNeighborhood() {
        if (neighborhood > 0 && neighborhood < 2) {
            return 1;
        } else if (neighborhood >= 2 && neighborhood < 4) {
            return 2;
        } else if (neighborhood >= 4 && neighborhood < 6) {
            return 3;
        } else if (neighborhood >= 6 && neighborhood < 8) {
            return 4;
        } else if (neighborhood >= 8 && neighborhood <= 10) {
            return 5;
        } else {
            return 0;
        }
    }

    public int getEnjoyment() {
        if (enjoyment > 0 && enjoyment < 2) {
            return 1;
        } else if (enjoyment >= 2 && enjoyment < 4) {
            return 2;
        } else if (enjoyment >= 4 && enjoyment < 6) {
            return 3;
        } else if (enjoyment >= 6 && enjoyment < 8) {
            return 4;
        } else if (enjoyment >= 8 && enjoyment <= 10) {
            return 5;
        } else {
            return 0;
        }
    }

    public int getLikelinessToReturn() {
        if (likelinessToReturn > 0 && likelinessToReturn < 2) {
            return 1;
        } else if (likelinessToReturn >= 2 && likelinessToReturn < 4) {
            return 2;
        } else if (likelinessToReturn >= 4 && likelinessToReturn < 6) {
            return 3;
        } else if (likelinessToReturn >= 6 && likelinessToReturn < 8) {
            return 4;
        } else if (likelinessToReturn >= 8 && likelinessToReturn <= 10) {
            return 5;
        } else {
            return 0;
        }
    }
}
