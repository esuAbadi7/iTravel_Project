package com.itravel.controller;



import com.itravel.dao.TravelerDao;
import com.itravel.model.Traveler;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import static java.lang.Integer.parseInt;


public class UserProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        HttpSession session =request.getSession();
        Traveler travel;

        travel= (Traveler) session.getAttribute("traveler");

        TravelerDao travelerDao = new TravelerDao();



        if(session.getAttribute("traveler") != null ){

            String firstname = request.getParameter("firstname");
            String middlename = request.getParameter("middlename");
            String lastname = request.getParameter("lastename");
            String gender = request.getParameter("gender");


            String state = request.getParameter("state");
            String city = request.getParameter("city");
            String street = request.getParameter("street");
            Integer zipcode = parseInt(request.getParameter("zipcode"));

            travel.setFirstName(firstname);
            travel.setMiddleName(middlename);
            travel.setLastName(lastname);
            travel.setGender(gender);
            travel.getAddress().setState(state);
            travel.getAddress().setCity(city);
            travel.getAddress().setStreet(street);
            travel.getAddress().setZipcode(zipcode);

            travelerDao.updateTravelerDetails(travel.getTravelerId(), travel);

            System.out.println(travelerDao.getTraveler(travel.getTravelerId()));

            RequestDispatcher rd = request.getRequestDispatcher("userProfile.jsp");
            rd.forward(request,response);



        }
//      }
//        if(request.getParameter("btn1") !=null){
//            if(session.getAttribute("traveler") != null ){
//               if(request.getParameter("attachmentName") !=null){
//                travel.setProfilePicUrl(request.getParameter("attachmentName"));
//                   }
//                }
//            }
//
//        if(request.getParameter("btn3") !=null){
//            if(session.getAttribute("traveler") != null ){
//
//                String password = request.getParameter("password");
//                travel.setPassword(password);
//            }
//
//        }

    }

    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

    }
}

