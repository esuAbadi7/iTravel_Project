package com.itravel.dao;

import java.sql.*;

public class ConnectionManager {

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/itravel","root","");
        return con;
    }
}
