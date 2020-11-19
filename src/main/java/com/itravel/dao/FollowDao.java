package com.itravel.dao;

import com.itravel.model.Address;
import com.itravel.model.Follow;
import com.itravel.model.Location;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FollowDao {



    public Follow getFollow(String followerId)  {

        String sql = "select * from itravel.follow where follower_id=? ";
        try (Connection con = ConnectionManager.getConnection()) {


            PreparedStatement ps = con.prepareStatement(sql) ;
            ps.setString(1, followerId);
            ResultSet resultSet = ps.executeQuery();
            String follower_Id = null,followeeId = null;
            if(resultSet.next()){
                follower_Id = resultSet.getString("follower_id");
                followeeId = resultSet.getString("followee_id");
            }
            return new Follow(follower_Id,followeeId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public boolean addFollow(Follow follow)  {

//        follower_id	followee_id

        String sql = "insert into follow(follower_id, followee_id) values(?,?)";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setString(1, follow.getFollower());
            st.setString(2, follow.getFollowee());

            st.executeUpdate();

            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }


}
