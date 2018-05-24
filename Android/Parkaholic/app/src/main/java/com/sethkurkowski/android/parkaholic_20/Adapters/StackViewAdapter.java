package com.sethkurkowski.android.parkaholic_20.Adapters;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;

import com.sethkurkowski.android.parkaholic_20.HomeActivity;
import com.sethkurkowski.android.parkaholic_20.R;
import com.squareup.picasso.Picasso;

import java.util.List;

// Seth Kurkowski
// May 24, 2018
// StackViewAdapter.java

public class StackViewAdapter extends ArrayAdapter<String> {

    private List<String> urls;
    private Context context;

    public StackViewAdapter(@NonNull Context context, int resource, int textViewResourceId, @NonNull List<String> objects) {
        super(context, resource, textViewResourceId, objects);
        this.context = context;
        this.urls = objects;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        ViewHolder vh;

        if (convertView == null) {
            convertView = LayoutInflater.from(context).inflate(R.layout.stack_view_layout, parent, false);

            vh = new ViewHolder(convertView);
            convertView.setTag(vh);
        } else {
            vh = (ViewHolder) convertView.getTag();
        }

        ImageView imageView = convertView.findViewById(R.id.imageView);

        String url = getItem(position);
        if (url != null) {
            try {
                Picasso.with(context).load(url).into(imageView);
            } catch (Exception e) {
                Log.i(HomeActivity.tag, e.getLocalizedMessage());
                e.printStackTrace();
            }
        }

        return convertView;
    }

    static class ViewHolder {
        ImageView imageView;

        public ViewHolder(View view) {
            imageView = view.findViewById(R.id.imageView);
        }
    }
}
