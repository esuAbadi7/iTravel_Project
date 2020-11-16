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

    public Traveler getTravelerUsingEmail(String email) {
        String sql = "select * from traveler where email= ?";
        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);
            ResultSet resultSet = st.executeQuery();

            return populateTravelerList(resultSet).get(0);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<Traveler> getAllTraveler() {
        String sql = "select * from traveler";
        try (Connection con = ConnectionManager.getConnection()) {

            Statement st = con.createStatement();
            ResultSet resultSet = st.executeQuery(sql);

            return populateTravelerList(resultSet);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public boolean updateTravelerDetails(String userId, Traveler traveler){

        String sql = "update traveler " +
                "set firstname=?, middlename=?, lastname= ?, gender=? "+
                "where user_id=?";

        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setString(1, traveler.getFirstName());
            st.setString(2, traveler.getMiddleName());
            st.setString(3, traveler.getLastName());
            st.setString(4, traveler.getGender());

            st.executeUpdate();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }


    public boolean addTraveler(Traveler traveler) {

        User travelerUser = new User(traveler.getEmail(),traveler.getPassword(),traveler.isActive(),traveler.getRole());
        Address travelerAddress = traveler.getAddress();

        UserDao userDao = new UserDao();
        boolean isSuccessful = userDao.addUser(travelerUser);
        AddressDao addressDao = new AddressDao();
        int addressId = addressDao.addAddress(travelerAddress);

        if(!isSuccessful || addressId == -1 ){
            return false;
        }


        String sql = "insert into traveler (email,user_id,firstname,middlename,lastname, gender, birth_year,profile_url,thumbnail_url,address_id) " +
                "values(?,?,?,?,?,?,?,?,?,?)";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setString(1, traveler.getEmail());
            st.setString(2, traveler.getTravelerId());
            st.setString(3, traveler.getFirstName());
            st.setString(4, traveler.getMiddleName());
            st.setString(5,traveler.getLastName());
            st.setString(6,traveler.getGender());
            st.setInt(7,traveler.getBirthYear());
            st.setString(8,traveler.getProfilePicUrl());
            st.setString(9,traveler.getThumbNail());
            st.setInt(10, addressId);


            st.executeUpdate();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }

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

            list.add(new Traveler(travelerId, firstName, middleName, lastName, gender, birthYear, email, user.getPassword(), user.isActive(), Role.USER, address, profilePicUrl, thumbNail));
        }
        return list;
    }
}
