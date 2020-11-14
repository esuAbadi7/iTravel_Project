package com.itravel.dao;

import com.itravel.model.Address;
import com.itravel.model.Location;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LocationDao {

    public Location getLocation(int id)  {

        String sql = "select * from itravel.location where id=? ";
        try (Connection con = ConnectionManager.getConnection()) {


            PreparedStatement ps = con.prepareStatement(sql) ;
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            Double latitude =null, longitude = null;
            if(resultSet.next()){
                latitude = resultSet.getDouble("latitude");
                longitude = resultSet.getDouble("longitude");
            }
            return new Location(latitude,longitude);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public boolean addLocation(Location location)  {

        String sql = "insert into location(latitude, longitude) values(?,?)";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setDouble(1, location.getLatitude());
            st.setDouble(2, location.getLongitude());

            st.executeUpdate();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
}
