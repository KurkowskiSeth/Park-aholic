package com.sethkurkowski.android.parkaholic_20.Helpers;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.print.PrinterId;

// Seth Kurkowski
// May 24, 2018
// DatabaseHelper.java

public class DatabaseHelper extends SQLiteOpenHelper {

    private static final String DATABASE_FILE = "parks.db";
    private static final int DATABASE_VERSION = 1;

    private static final String TABLE_NAME = "parks";
    public static final String PARK_ID = "_id";
    public static final String PARK_NAME = "_name";
    public static final String PARK_CITY = "_city";
    public static final String PARK_URL = "_url";
    public static final String PARK_LAT = "_lat";
    public static final String PARK_LONG = "_long";
    public static final String PARK_PHONE = "_phone";
    public static final String PARK_ADDRESS = "_address";
    public static final String QUALITY_RATING = "_qualityRating";
    public static final String EQUIPMENT_RATING = "_equipmentRating";
    public static final String NEIGHBORHOOD_RATING = "_neighborhoodRating";
    public static final String ENJOYMENT_RATING = "_enjoymentRating";
    public static final String RETURN_RATING = "_returnRating";

    private static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS " +
            TABLE_NAME + " (" +
            PARK_ID + " TEXT PRIMARY KEY, " +
            PARK_NAME + " TEXT, " +
            PARK_CITY + " TEXT, " +
            PARK_URL + " TEXT, " +
            PARK_LAT + " TEXT, " +
            PARK_LONG + " TEXT, " +
            PARK_PHONE + " TEXT, " +
            PARK_ADDRESS + " TEXT, " +
            QUALITY_RATING + " INTEGER, " +
            EQUIPMENT_RATING + " INTEGER, " +
            NEIGHBORHOOD_RATING + " INTEGER, " +
            ENJOYMENT_RATING + " INTEGER, " +
            RETURN_RATING + " INTEGER" +
            ") ";

    private SQLiteDatabase mDatabase;
    private static DatabaseHelper mInstance = null;

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(CREATE_TABLE);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    }

    public static DatabaseHelper getmInstance(Context context) {
        if (mInstance == null) {
            mInstance = new DatabaseHelper(context);
        }
        return mInstance;
    }

    private DatabaseHelper(Context context) {
        super(context, DATABASE_FILE, null, DATABASE_VERSION);
        mDatabase = getWritableDatabase();
    }

    public void insertPark(String id, String name, String city, String url, String lat, String lng, String phone, String address, int quality, int equipment, int neighborhood, int enjoyment, int likelinessToReturn) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(PARK_ID, id);
        contentValues.put(PARK_NAME, name);
        contentValues.put(PARK_CITY, city);
        contentValues.put(PARK_URL, url);
        contentValues.put(PARK_LAT, lat);
        contentValues.put(PARK_LONG, lng);
        contentValues.put(PARK_PHONE, phone);
        contentValues.put(PARK_ADDRESS, address);
        contentValues.put(QUALITY_RATING, quality);
        contentValues.put(EQUIPMENT_RATING, equipment);
        contentValues.put(NEIGHBORHOOD_RATING, neighborhood);
        contentValues.put(ENJOYMENT_RATING, enjoyment);
        contentValues.put(RETURN_RATING, likelinessToReturn);
        mDatabase.insert(TABLE_NAME, null, contentValues);
    }

    public Cursor getAllData() {
        return mDatabase.query(TABLE_NAME, null, null, null, null, null, null);
    }

    public void deletePark(String whereClause, String[] whereArgs) {
        mDatabase.delete(TABLE_NAME, whereClause, whereArgs);
    }

    public void updatePark(ContentValues contentValues, String whereClause, String[] whereArgs) {
        mDatabase.update(TABLE_NAME, contentValues, whereClause, whereArgs);
    }
}
