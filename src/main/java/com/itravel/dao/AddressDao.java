package com.itravel.dao;

import com.itravel.model.Address;
import com.itravel.model.Role;
import com.itravel.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddressDao {

    public Address getAddress(int id)  {

        String sql = "select * from itravel.address where id=? ";
        try (Connection con = ConnectionManager.getConnection()) {


            PreparedStatement ps = con.prepareStatement(sql) ;
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();

            return populateAddressList(resultSet).get(0);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public boolean addAddress(Address address)  {

        String sql = "insert into address (city, state, street, zipcode) values(?,?,?,?)";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setString(1, address.getCity());
            st.setString(2, address.getState());
            st.setString(3, address.getStreet());
            st.setInt(4, address.getZipcode());

            st.executeUpdate();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }




    private List<Address> populateAddressList(ResultSet rs) throws SQLException {
        List<Address> list = new ArrayList<>();
        String state ;
        String city ;
        String street;
        int zipcode;

        while(rs.next()) {
            state = rs.getString("state");
            city = rs.getString("city");
            street = rs.getString("street");
            zipcode = rs.getInt("zipcode");
            list.add(new Address(state,city,street,zipcode));
        }
        return list;
    }
}
