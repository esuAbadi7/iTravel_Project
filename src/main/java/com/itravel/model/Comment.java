package com.itravel.model;

import static com.itravel.model.Util.idGenerator;

public class Comment {
    private String commentId;
    private String text;
    private int likes;
    private int dislikes;

    public Comment(String text) {
        this.text = text;
        this.likes =0;
        this.dislikes =0;
        this.commentId = idGenerator();

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