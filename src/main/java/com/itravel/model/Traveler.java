package com.itravel.model;

import java.util.ArrayList;
import java.util.List;

import static com.itravel.model.Util.idGenerator;

public class Traveler extends User {

    private String firstName;
    private String middleName;
    private String lastName;
    private String gender;
    private int birthYear;
    private String profilePicUrl;
    private String thumbNail;
    private String travelerId;
    private List<Traveler> follows =new ArrayList<>();
    private Address address;
    private PostRecord record;


    public Traveler(String firstName, String middleName,
                     String lastName, String gender, int birthYear, String email, String password,
                     boolean isActive, Role role, Address address) {
        super(email, password,isActive,  role);

        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.gender = gender;
        this.birthYear = birthYear;
        this.travelerId = idGenerator();
        this.address = address;

    }

    public Traveler(String travelerId,String firstName, String middleName,
                    String lastName, String gender, int birthYear, String email, String password,
                    boolean isActive, Role role, Address address) {
        super(email, password,isActive,  role);

        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.gender = gender;
        this.birthYear = birthYear;
        this.travelerId = travelerId;
        this.address = address;

    }

    public void setProfilePicUrl(String profilefPicUrl) {
        this.profilePicUrl = profilefPicUrl;
    }

    public void setThumbNail(String thumbNail) {
        this.thumbNail = thumbNail;
    }

    public String getGender() {
        return gender;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public String getProfilePicUrl() {
        return profilePicUrl;
    }

    public String getThumbNail() {
        return thumbNail;
    }


    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getTravelerId() {
        return travelerId;
    }

    public void setFollows(List<Traveler> follows) {
        this.follows = follows;
    }

    public void addFollows(Traveler follows) {
        this.follows.add(follows);
    }

    public Address getAddress(){
        return this.address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public List<Traveler> getFollows() {
        return follows;
    }

    public PostRecord getRecord() {
        return record;
    }

    public void setRecord(PostRecord record) {
        this.record = record;
    }

    @Override
    public String toString() {
        return "Traveller{" +
                "firstName='" + firstName + '\'' +
                ", middleName='" + middleName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", gender='" + gender + '\'' +
                ", birthYear=" + birthYear +
                ", profilePicUrl='" + profilePicUrl + '\'' +
                ", thumbNail='" + thumbNail + '\'' +
                ", travelerId='" + travelerId + '\'' +
                ", follows=" + follows +
                ", record=" + record +
                '}';
    }
}