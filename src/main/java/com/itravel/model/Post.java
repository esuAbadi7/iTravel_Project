package com.itravel.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static com.itravel.model.Util.idGenerator;

public class Post {
    private String postId;
    private Date date;
    private String postText;
    private String imageUrl;
    private int likes;
    private int dislikes;
    private boolean isVisible;
    private Location location;
    private List<Comment> comments;


    public Post(String id, Date date) {

        this.postId = idGenerator(); //needs to be unique
        this.date = date;
        likes=0;
        dislikes=0;
        isVisible=true;
        comments= new ArrayList<>();
    }

    public void addComments(Comment comment){
        comments.add(comment);
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setLocation(double longitude, double latitude) {
        this.location = new Location(longitude,latitude);
    }

    public Location getLocation() {
        return location;
    }

    public void setPostText(String postText) {
        this.postText = postText;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void likePost(){
        likes++;
    }

    public void dislikePost(){
        dislikes++;
    }

    public String getPostId() {
        return postId;
    }

    public Date getDate() {
        return date;
    }

    public String getPostText() {
        return postText;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public int getLikes() {
        return likes;
    }

    public int getDislikes() {
        return dislikes;
    }

    public boolean isVisible() {
        return isVisible;
    }

    public void setVisible(boolean visible) {
        isVisible = visible;
    }

    @Override
    public String toString() {
        return "Post{" +
                "postId='" + postId + '\'' +
                ", date=" + date +
                ", postText='" + postText + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", likes=" + likes +
                ", dislikes=" + dislikes +
                ", isVisible=" + isVisible +
                ", location=" + location +
                '}';
    }
}