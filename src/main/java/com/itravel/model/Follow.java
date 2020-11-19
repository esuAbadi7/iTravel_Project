package com.itravel.model;

public class Follow {

    private String followerId;
    private String followeeId;

    public Follow(String follower, String followee) {
        this.followerId = follower;
        this.followeeId = followee;
    }

    public String getFollower() {
        return followerId;
    }

    public void setFollower(String follower) {
        this.followerId = follower;
    }

    public String getFollowee() {
        return followeeId;
    }

    public void setFollowee(String followee) {
        this.followeeId = followee;
    }
}
