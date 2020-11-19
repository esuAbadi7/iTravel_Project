package com.itravel.dao;

import com.itravel.model.Location;
import com.itravel.model.Role;
import com.itravel.model.UnhealtyWord;
import com.itravel.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UnhealthyWordDao {

    public List<String> getAllUnhealthyWords()  {

        try (Connection con = ConnectionManager.getConnection();
             Statement st = con.createStatement()
        ) {
            String word;

            ResultSet resultSet = st.executeQuery("select * from badwords ");
            List<String> badWords = new ArrayList<>();
            while(resultSet.next()){
                word = resultSet.getString("word");
                badWords.add(word);
            }
            return badWords;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public boolean addUnhealthyWord(String word)  {

        String sql = "insert into badwords(word) values(?) ";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);


            st.setString(1, word);


            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();

            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
    public boolean deleteUnhealthyWord(String word)  {

        String sql = "delete from badwords where word=? ";
        try (Connection con = ConnectionManager.getConnection()){
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, word);
            st.executeUpdate();

            ResultSet rs = st.getGeneratedKeys();
            return true;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }





}
