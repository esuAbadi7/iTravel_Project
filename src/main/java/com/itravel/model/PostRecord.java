package com.itravel.model;

import java.util.ArrayList;
import java.util.List;

public class PostRecord {

    List<Post> posts = new ArrayList<>();

    public List<Post> getRec() {
        return posts;
    }

    public void addPost(Post post) {
        posts.add(post);
    }


}
