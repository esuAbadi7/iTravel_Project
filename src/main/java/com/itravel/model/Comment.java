package com.itravel.model;

import static com.itravel.model.Util.idGenerator;

public class Comment {
    private String commentId;
    private String text;
    private int likes;
    private int dislikes;
    private Traveler traveler;
    private String postId;



    public Comment(String text, Traveler traveler, String postId) {
        this.text = text;
        this.likes =0;
        this.dislikes =0;
        this.commentId = idGenerator();
        this.traveler = traveler;
        this.postId = postId;

    }

    public Comment(String text, Traveler traveler, String commentId, int likes, int dislikes, String postId) {
        this.text = text;
        this.likes = likes;
        this.dislikes = dislikes;
        this.commentId = commentId;
        this.traveler = traveler;
        this.postId = postId;

    }

    public Traveler getTraveler() {
        return traveler;
    }

    public String getPostId() {
        return postId;
    }
    public String getCommentId() {
        return commentId;
    }

    public String getText() {
        return text;
    }
    public void addLike(){
        likes++;
    }
    public void addDislike(){
        dislikes++;
    }

    public int getLikes() {
        return likes;
    }

    public int getDislikes() {
        return dislikes;
    }

    @Override
    public String toString() {

        return "Comment{" +
                "commentId='" + commentId + '\'' +
                ", text='" + text + '\'' +
                ", likes=" + likes +
                ", dislikes=" + dislikes +
                '}';
    }
}