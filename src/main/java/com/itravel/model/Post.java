package com.itravel.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static com.itravel.model.Util.idGenerator;

public class Post {
    private String postId;
    private LocalDateTime postDate;
    private String postText;
    private String imageUrl;
    private boolean healthyType;
    private int likes;
    private int dislikes;
    private boolean isVisible;
    private Location location;
    private List<Comment> comments;
    private Traveler traveler;



    public Post(String postText, LocalDateTime date, String postImage, boolean healthyType, Traveler traveler, Location location ) {

        this.postId = idGenerator(); //needs to be unique
        this.postDate = date;
        this.postText = postText;
        this.imageUrl = postImage;
        this.healthyType = healthyType;
        this.traveler = traveler;
        likes=0;
        dislikes=0;
        isVisible=true;
        comments= new ArrayList<>();
        this.location = location;
    }

    public Post(String id, String postText, LocalDateTime date, String postImage, boolean healthyType, int likes, int dislikes, boolean isVisible, Location location, List<Comment> comments, Traveler traveler) {

        this.postId = id;
        this.postDate = date;
        this.postText = postText;
        this.imageUrl = postImage;
        this.healthyType = healthyType;
        this.likes=likes;
        this.dislikes=dislikes;
        this.isVisible= isVisible;
        this.location = location;
        this.comments= comments ;
        this.traveler = traveler;
    }




    public void addComments(Comment comment){
        comments.add(comment);
    }

    public List<Comment> getComments() {
        return comments;
    }

    public Traveler getTraveler() {
        return traveler;
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

    public LocalDateTime getPostDate() {
        return postDate;
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

    public Boolean getHealthyType() {
        return healthyType;
    }

    public void setHealthyType(Boolean type) {
        this.healthyType = type;
    }

    @Override
    public String toString() {
        return "Post{" +
                "postId='" + postId + '\'' +
                ", date=" + postDate +
                ", postText='" + postText + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", likes=" + likes +
                ", dislikes=" + dislikes +
                ", isVisible=" + isVisible +
                ", location=" + location +
                '}';
    }
}