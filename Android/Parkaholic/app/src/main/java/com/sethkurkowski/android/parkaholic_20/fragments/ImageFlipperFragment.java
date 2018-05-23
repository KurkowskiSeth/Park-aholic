package com.sethkurkowski.android.parkaholic_20.fragments;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.StackView;

import com.sethkurkowski.android.parkaholic_20.HomeActivity;
import com.sethkurkowski.android.parkaholic_20.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.List;

// Seth Kurkowski
// May 22, 2018
// .java

public class ImageFlipperFragment extends Fragment {

    public static final String ARGS_IMAGE_URLS = "ARGS_IMAGE_URLS";

    Context mContext;

    public static ImageFlipperFragment newInstance(ArrayList<String> imageUrls) {

        Bundle args = new Bundle();

        args.putStringArrayList(ARGS_IMAGE_URLS, imageUrls);

        ImageFlipperFragment fragment = new ImageFlipperFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        mContext = context;

    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.frag_venue_images_stack_view, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        if (getArguments() != null && getArguments().containsKey(ARGS_IMAGE_URLS)) {
            ArrayList<String> imageUrls = getArguments().getStringArrayList(ARGS_IMAGE_URLS);
            if (imageUrls != null) {
                StackView stackView = view.findViewById(R.id.image_stack);

                for (String s : imageUrls) {
                    ImageView imageView = new ImageView(mContext);
                    Picasso.with(mContext).load(s).into(imageView);
                    stackView.setAdapter(new StackViewAdapter(mContext, 0, 0, imageUrls));
                }
            }
        }

    }

    public static class StackViewAdapter extends ArrayAdapter<String> {

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
            ViewHolder vh = null;

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

}
