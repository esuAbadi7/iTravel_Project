package com.itravel.controller;

import com.itravel.dao.TravelerDao;
import com.itravel.dao.UserDao;
import com.itravel.model.Address;
import com.itravel.model.Role;
import com.itravel.model.Traveler;
import com.itravel.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static java.lang.Integer.parseInt;

public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDao userDao= new UserDao();

        String firstname = request.getParameter("firstname");
        String middlename = request.getParameter("middlename");
        String lastname = request.getParameter("lastname");
        String gender = request.getParameter("gender");
        Integer birthyear = parseInt(request.getParameter("birthyear"));


        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String street = request.getParameter("street");
        Integer zipcode = parseInt(request.getParameter("zipcode"));
        String email= request.getParameter("email");
        String password = request.getParameter("password");


        if(userDao.emailAlreadyExists(email)){
            String EmailerrMsg = "Email already exists!";
            request.setAttribute("EmailerrMsg",EmailerrMsg);
            RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp");
            rd.forward(request,response);
        }
        else{
            boolean travelerCreated;

            TravelerDao traveldao = new TravelerDao();
            Address address = new Address(state,city,street,zipcode);
            Traveler traveler = new Traveler(firstname,middlename,lastname,gender,birthyear,email,password,true, Role.USER,address);
            travelerCreated = traveldao.addTraveler(traveler);
            System.out.println("Travler sent"+traveler+travelerCreated);

            if(travelerCreated == false) {
                String EmailerrMsg = "Error while creating account!";
                request.setAttribute("EmailerrMsg",EmailerrMsg);
                RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp");
                rd.forward(request,response);
            }else {

                request.setAttribute("traveler",traveler);
                RequestDispatcher rd = request.getRequestDispatcher("travelerHomePage.jsp");
                rd.forward(request,response);
            }


        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
