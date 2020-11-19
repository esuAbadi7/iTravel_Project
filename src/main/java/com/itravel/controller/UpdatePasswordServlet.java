package com.itravel.controller;



import com.itravel.dao.TravelerDao;
import com.itravel.dao.UserDao;
import com.itravel.model.Traveler;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


public class UpdatePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        Traveler travel;

        travel= (Traveler) session.getAttribute("traveler");

        TravelerDao travelerDao = new TravelerDao();

        UserDao dao = new UserDao();



        if(session.getAttribute("traveler") != null ){
            String password = request.getParameter("password");

            travel.setPassword(password);

            travelerDao.updateTravelerDetails(travel.getTravelerId(),travel);

            dao.updatePassword(travel.getEmail(),password);

            RequestDispatcher rd = request.getRequestDispatcher("userProfile.jsp");
            rd.forward(request,response);



        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

