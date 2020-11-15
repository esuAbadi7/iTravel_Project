package com.itravel.dao;

import com.itravel.model.*;

import java.util.List;

public class DBTest {

    public static void main(String[] args){
        UserDao userdao = new UserDao();
//        List<User> users = userdao.getAllUser();
//        for(User u: users){
//            System.out.println("Email:"+  u.getEmail());
//            System.out.println("Password:"+  u.getPassword());
//            System.out.println("Role:"+  u.getRole());
//            System.out.println("Active:"+  u.isActive());
//        }
//        User user1 =  userdao.getUser("edagnew@miu.edu");
//        System.out.println("edagnew@miu.edu is Active :"+ user1.isActive());
//        boolean result = userdao.addUser(new User("samuelbereka@gmail.com","sami1233",true, Role.ADMIN));
//        System.out.println(result);
//        for(User u: userdao.getActiveUsers()){
//           System.out.print("Email:"+  u.getEmail());
//           System.out.print("   Password:"+  u.getPassword());
//           System.out.print("   Role:"+  u.getRole());
//           System.out.print("   Active:"+  u.isActive()+"\n");
//        }
//
//        System.out.println("traveler@gmail.com exists in user :"+userdao.emailAlreadyExists("traveler@gmail.com"));
        LocationDao locationDao = new LocationDao();
        System.out.println(locationDao.getLocation(1));
        locationDao.addLocation(new Location(10.33,-4546.9866));
        System.out.println(locationDao.getLocation(3));

        User user = userdao.login("edagnew@miu.edu","esuAbadi");
        System.out.println(user);

        AddressDao addressDao = new AddressDao();
        Address address1= new Address("IA","Fair","1000 N 4th", 10020 );
//        int adId = addressDao.addAddress();
//        System.out.println("The Newly Inserted Address Id :"+ adId);


        Traveler traveler = new Traveler("Solomon","Kassa","Mekonnen","Male",1980,"solkassa@gmail.com","solkassa",true,Role.USER, address1);
        TravelerDao travelerDao = new TravelerDao();
        travelerDao.addTraveler(traveler);
        System.out.println(travelerDao.getAllTraveler());

        System.out.println("Logging in with traveler");
        User user1 = userdao.login("solkassa@gmail.com","esuAbadi");
        System.out.println(user1);
    }
}
