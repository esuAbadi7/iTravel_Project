package com.itravel.model;

public class User {
    private String email;
    private String password;
    private boolean isActive;
    private Role role;
//    public enum Role {
//        user, admin;
//    }

    public User(String email, String password, boolean active, Role role) {
        this.email = email;
        this.password = password;
        this.isActive = active;
        this.role = role;
    }


    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public boolean isActive() {
        return isActive;
    }

    public Role getRole() {
        return role;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setActive(boolean active) {
        this.isActive = active;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", isActive=" + isActive +
                ", role=" + role +
                '}';
    }
}
