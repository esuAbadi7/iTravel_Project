package com.itravel.dao;

import com.itravel.model.Address;
import com.itravel.model.Role;
import com.itravel.model.Traveler;
import com.itravel.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TravelerDao {

    UserDao userDao = new UserDao();
    AddressDao addressDao = new AddressDao();

    public Traveler getTraveler(String travelerId) {
        String sql = "select * from traveler where user_id= ?";
        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, travelerId);
            ResultSet resultSet = st.executeQuery();

            return populateTravelerList(resultSet).get(0);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public Traveler getAllTraveler() {
        String sql = "select * from traveler";
        try (Connection con = ConnectionManager.getConnection()) {

            Statement st = con.createStatement();
            ResultSet resultSet = st.executeQuery(sql);

            return populateTravelerList(resultSet).get(0);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
// TODO Creating addTraveler
//    public boolean addTraveler(Traveler traveler) {
//
//
//
//        String sql = "insert into traveler values(?,?,?,?)";
//        try (Connection con = ConnectionManager.getConnection()){
//            PreparedStatement st = con.prepareStatement(sql);
//
//
//            st.setString(1, user.getEmail());
//            st.setString(2, user.getPassword());
//            st.setBoolean(3, user.isActive());
//            st.setString(4, user.getRole().toString());
//
//            st.executeUpdate();
//            return true;
//
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//            return false;
//        }
//
//    }

    private List<Traveler> populateTravelerList(ResultSet rs) throws SQLException {
        List<Traveler> list = new ArrayList<>();
        String firstName, middleName, lastName, gender, email;
        int birthYear, addressId;
        String profilePicUrl, thumbNail, travelerId;
        User user;
        Address address;

        while (rs.next()) {
            firstName = rs.getString("firstname");
            middleName = rs.getString("middlename");
            lastName = rs.getString("lastname");
            travelerId = rs.getString("user_id");
            gender = rs.getString("gender");
            birthYear = rs.getInt("birth_year");
            profilePicUrl = rs.getString("profile_url");
            thumbNail = rs.getString("profile_url");
            addressId = rs.getInt("address_id");
            email = rs.getString("email");
            user = userDao.getUser(email);
            address = addressDao.getAddress(addressId);

            list.add(new Traveler(travelerId, firstName, middleName, lastName, gender, birthYear, email, user.getPassword(), user.isActive(), Role.USER, address));
        }
        return list;
    }
}
