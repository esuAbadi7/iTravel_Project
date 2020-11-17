package com.itravel.dao;

import com.itravel.model.Address;
import com.itravel.model.Comment;
import com.itravel.model.Traveler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {

    public Comment getComment(int id)  {

        String sql = "select * from itravel.comment where id=? ";
        try (Connection con = ConnectionManager.getConnection()) {


            PreparedStatement ps = con.prepareStatement(sql) ;
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();

            return populateCommentList(resultSet).get(0);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<Comment> getPostComments(String postId)  {

        String sql = "select * from itravel.comment where post_id=? ";
        try (Connection con = ConnectionManager.getConnection()) {


            PreparedStatement ps = con.prepareStatement(sql) ;
            ps.setString(1, postId);
            ResultSet resultSet = ps.executeQuery();

            return populateCommentList(resultSet);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }


    public int addComment(Comment comment)  {

        //       id  post_id	user_id	comment_text	likes	dislikes
//        user_id	comment_text	likes	dislikes	post_id
        String sql = "insert into comment (user_id, comment_text, likes, dislikes, post_id ) values(?,?,?,?,?)";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setString(1, comment.getTraveler().getTravelerId());
            st.setString(2, comment.getText());
            st.setInt(3, comment.getLikes());
            st.setInt(4, comment.getDislikes());
            st.setString(5,comment.getPostId());

            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            int generatedKey = 0;
            if(rs.next()){
                generatedKey = rs.getInt(1);
            }

            return generatedKey;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return -1;
        }
    }




    private List<Comment> populateCommentList(ResultSet rs) throws SQLException {
        List<Comment> list = new ArrayList<>();
        String commentId;
        String text;
        int likes;
        int dislikes;
        String postId;
        String travelerId;
        TravelerDao travelerDao =  new TravelerDao();


//       id  post_id	user_id	comment_text	likes	dislikes

        while(rs.next()) {
            commentId = rs.getString("id");
            text = rs.getString("comment_text");
            likes = rs.getInt("likes");
            dislikes = rs.getInt("dislikes");
            travelerId = rs.getString("user_id");
            postId = rs.getString("post_id");
            Traveler traveler = travelerDao.getTraveler(travelerId);

            list.add(new Comment(text,traveler,commentId,likes,dislikes,postId));
        }
        return list;
    }
}
