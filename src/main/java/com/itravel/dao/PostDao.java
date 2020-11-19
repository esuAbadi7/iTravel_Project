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

    public List<Post> getAllPostFeed(String travelerId) {
        String sql = "SELECT post.id, post.user_id, post.post_time, post.type, post.post_text, post.image_url, post.likes, post.dislikes, post.visibility, post.location_id from post\n" +
                "INNER JOIN traveler ON post.user_id = traveler.user_id\n" +
                "INNER JOIN user ON traveler.email = user.email\n" +
                "INNER JOIN follow ON traveler.user_id = follow.followee_id\n" +
                "where follower_id = ? and user.active=true and type=true\n" +
                "UNION\n" +
                "select * from post \n" +
                "where post.user_id = ? and type=true\n" +
                "ORDER by post_time DESC\n" +
                "LIMIT 10";

        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, travelerId);
            st.setString(2, travelerId);
            ResultSet resultSet = st.executeQuery();

            return populatePostList(resultSet);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<Post> searchPostbyUserOrPost(String travelerId, String searchText) {
        String sql = "SELECT post.id, post.user_id, post.post_time, post.type, post.post_text, post.image_url, post.likes, post.dislikes, post.visibility, post.location_id from post\n" +
                "INNER JOIN traveler ON post.user_id = traveler.user_id\n" +
                "INNER JOIN user ON traveler.email = user.email\n" +
                "INNER JOIN follow ON traveler.user_id = follow.followee_id\n" +
                "where follower_id = ? and user.active=true and type=true and (traveler.firstname LIKE ?  or post.post_text like ? )\n" +
                "ORDER by post_time DESC\n" +
                "LIMIT 10";

        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, travelerId);
            st.setString(2,"%" + searchText + "%");
            st.setString(3,"%" + searchText + "%");
            ResultSet resultSet = st.executeQuery();

            return populatePostList(resultSet);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public boolean updatePostLikes(String postId, int likes) {

        String sql = "update itravel.post set likes=? where id=? ";

        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setInt(1, likes);
            st.setString(2, postId);
            st.executeUpdate();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }
    public boolean updatePostDislikes(String postId, int dislikes) {

        String sql = "update post set dislikes=? where id=? ";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setInt(1, dislikes);
            st.setString(2, postId);
            st.executeUpdate();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }

    //    TODO check this
    public int getPostLikes(String postId) {

        String sql = "SELECT likes FROM `post` WHERE id=? ";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, postId);

            ResultSet resultSet = st.executeQuery();
            int likes=0;
            if(resultSet.next()){
                likes = resultSet.getInt("likes");
            }
            return likes;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return -1;
        }

    }

//    TODO check this
    public int getPostDislikes(String postId) {

        String sql = "select dislikes from post where id = ? ";

        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, postId);
            ResultSet resultSet = st.executeQuery();
            int dislikes=0;
            if(resultSet.next()){
                dislikes = resultSet.getInt("dislikes");
            }

            return dislikes;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return -1;
        }

    }


    public List<Post> getTravelerPosts(String travelerId) {
        String sql = "select * from post \n" +
                "where post.user_id = ? " +
                "ORDER by post_time DESC\n" +
                "LIMIT 10";

        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, travelerId);

            ResultSet resultSet = st.executeQuery();

            return populatePostList(resultSet);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }


    public List<Post> getAllPosts() {
        String sql = "select * from post";

        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
//            st.setBoolean(1, false);
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

        boolean result = deletePostComments(postId);
        String sql = "delete from post where id= ?";


        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, postId);
            st.executeUpdate();

            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    public boolean deletePostComments(String postId) {

//        delete from comment where post_id= 76038
        String sql = "delete from comment where post_id= ?";


        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, postId);
            st.executeUpdate();

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
            dislikes = rs.getInt("dislikes");
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
