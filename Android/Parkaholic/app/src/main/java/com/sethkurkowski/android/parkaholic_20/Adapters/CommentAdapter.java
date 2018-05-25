package com.sethkurkowski.android.parkaholic_20.Adapters;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.sethkurkowski.android.parkaholic_20.HomeActivity;
import com.sethkurkowski.android.parkaholic_20.R;
import com.sethkurkowski.android.parkaholic_20.VenueActivity;

import java.util.ArrayList;

// Seth Kurkowski
// May 24, 2018
// CommentAdapter.java

public class CommentAdapter extends BaseAdapter {

    Context context;
    ArrayList<String> comments;
    private static int BASE_ID = 0x01000;

    public CommentAdapter(Context context, ArrayList<String> comments) {
        this.context = context;
        this.comments = comments;
    }

    @Override
    public int getCount() {
        if (comments != null) {
            return comments.size();
        }
        return 0;
    }

    @Override
    public String getItem(int position) {
        if (comments != null && position < comments.size() && position >= 0) {
            return comments.get(position);
        }
        return null;
    }

    @Override
    public long getItemId(int position) {
        return BASE_ID + position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder vh;
        if (convertView == null) {
            convertView = LayoutInflater.from(context).inflate(R.layout.comments_list_layout, parent, false);
            vh = new ViewHolder(convertView);
            convertView.setTag(vh);
        } else {
            vh = (ViewHolder) convertView.getTag();
        }

        String comment = getItem(position);

        if (comment != null) {
            String[] usernameAndComment = comment.split("~");

            vh.username.setText(usernameAndComment[0]);
            vh.userComment.setText(usernameAndComment[1]);
        }

        return convertView;
    }

    static class ViewHolder {
        TextView username;
        TextView userComment;

        public ViewHolder(View view) {
            username = view.findViewById(R.id.username_tv);
            userComment = view.findViewById(R.id.user_comment_tv);
        }
    }
}
