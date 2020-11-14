package com.itravel.dao;

import com.itravel.model.Role;
import com.itravel.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {


    public List<User> getAllUser()  {

        try (Connection con = ConnectionManager.getConnection();
             Statement st = con.createStatement()
        ) {


            ResultSet resultSet = st.executeQuery("select * from itravel.user ");

            return populateUserList(resultSet);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public User getUser(String email) {
        String sql = "select * from user where email= ?";
        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);
            ResultSet resultSet = st.executeQuery();

            return populateUserList(resultSet).get(0);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public List<User> getActiveUsers() {
        String sql = "select * from user where active= ?";
        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setBoolean(1, true);
            ResultSet resultSet = st.executeQuery();

            return populateUserList(resultSet);

        } catch (SQLException throwables) {

            throwables.printStackTrace();
            return null;
        }
    }

    public User login(String email, String password){
        String sql = "select * from user where email= ? and password =?";
        try (Connection con = ConnectionManager.getConnection()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2,password);
            ResultSet resultSet = st.executeQuery();

            User user;
            if(resultSet.next()){

                String roleSt = resultSet.getString("Role");
                Role role = Role.valueOf(roleSt);
                boolean active = resultSet.getBoolean("active");

                return new User(email,password,active,role);
            }
            return null;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public boolean emailAlreadyExists(String email) {
        String sql = "select * from user";
        try (Connection con = ConnectionManager.getConnection()) {

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            for(User u: populateUserList(rs)){
                if(u.getEmail().equals(email)){
                    return true;
                }

            }
            return false;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }


    public boolean addUser(User user) {

        String sql = "insert into user values(?,?,?,?)";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setString(1, user.getEmail());
            st.setString(2, user.getPassword());
            st.setBoolean(3, user.isActive());
            st.setString(4, user.getRole().toString());

            st.executeUpdate();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }

    public boolean updatePassword(String email, String password) {

//        UPDATE table_name
//        SET column1 = value1, column2 = value2, ...
//        WHERE condition;
        String sql = "update user set password=? where email=? ";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setString(1, email);
            st.setString(2, password);

            st.executeUpdate();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }

    public void setActivation(String email, boolean activation) {

        String sql = "update user set active=? where email=? ";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, email);
            st.setBoolean(2, activation);
            st.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }



    private List<User> populateUserList(ResultSet rs) throws SQLException {
        List<User> list = new ArrayList<>();
        String email ;
        String password ;
        boolean active;
        Role role;
        while(rs.next()) {
                email = rs.getString("email");
                password = rs.getString("password");
                active = rs.getBoolean("active");
                String roleSt = rs.getString("role");
                role = Role.valueOf(roleSt);
                list.add(new User(email,password,active,role));
        }
        return list;
    }

}
