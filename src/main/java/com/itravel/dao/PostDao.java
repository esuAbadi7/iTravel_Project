package com.itravel.dao;

import com.itravel.model.*;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PostDao {

    LocationDao locationDao = new LocationDao();
    CommentDao commentDao = new CommentDao();
    TravelerDao travelerDao = new TravelerDao();

    public Post getPost(String postId) {
        String sql = "select * from post where id= ?";

        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, postId);
            ResultSet resultSet = st.executeQuery();

            return populatePostList(resultSet).get(0);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<Post> getUnhealthyPosts() {
        String sql = "select * from post where type= ?";

        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setBoolean(1, false);
            ResultSet resultSet = st.executeQuery();

            return populatePostList(resultSet);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public boolean addPost(Post post) {

//        id	user_id	post_time	type	post_text	image_url	likes	dislikes	visibility	location_id
//        id	user_id	post_time	type	post_text	image_url	likes	dislikes	visibility	location_id

        Location postLocation = post.getLocation();
        int locationId = locationDao.addLocation(postLocation);
        if(locationId == -1){
            return false;
        }

        String sql = "insert into post (id,user_id,post_time,post_text,type,image_url, likes, dislikes,visibility,location_id) " +
                "values(?,?,?,?,?,?,?,?,?,?)";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setString(1, post.getPostId());
            st.setString(2, post.getTraveler().getTravelerId());
            st.setTimestamp(3, Timestamp.valueOf(post.getPostDate()));
            st.setString(4, post.getPostText());
            st.setBoolean(5, post.getHealthyType());
            st.setString(6, post.getImageUrl());
            st.setInt(7, post.getLikes());
            st.setInt(8, post.getDislikes());
            st.setBoolean(9,post.isVisible());
            st.setInt(10, locationId);



            st.executeUpdate();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }

    public boolean deletePost(String postId) {
        String sql = "delete from post where id= ?";


        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, postId);
            ResultSet resultSet = st.executeQuery();

            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }



    private List<Post> populatePostList(ResultSet rs) throws SQLException {
        List<Post> list = new ArrayList<>();


        String postId;
        LocalDateTime date;
        String postText;
        String imageUrl;
        Boolean Healthytype;
        int likes;
        int dislikes;
        boolean isVisible;
        Location location;
        int locationId;
        String travelerId;
        List<Comment> comments;
        Traveler traveler;

        while (rs.next()) {
//            id	user_id	post_time	type	post_text	image_url	likes	dislikes	visibility	location_id

            postId = rs.getString("id");
            date = Util.localDateFromTimestamp( rs.getTimestamp("post_time"));
            postText = rs.getString("post_text");
            Healthytype = rs.getBoolean("type");
            imageUrl = rs.getString("image_url");
            likes = rs.getInt("likes");
            dislikes = rs.getInt("dislikes");;
            isVisible = rs.getBoolean("visibility");
            locationId = rs.getInt("location_id");
            travelerId = rs.getString("user_id");

            location = locationDao.getLocation(locationId);
            comments = commentDao.getPostComments(postId);
            traveler = travelerDao.getTraveler(travelerId);

            list.add(new Post(postId, postText, date, imageUrl, Healthytype, likes, dislikes, isVisible, location,comments,traveler));
        }
        return list;
    }

}
