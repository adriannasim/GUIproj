//package src.java.entity;
package entity;

public class User {
    private String username;
    private String userPwd;
    private String email;

    public User(){

    }

    public User(String username, String userPwd, String email) {
        this.username = username;
        this.userPwd = userPwd;
        this.email = email;
    }

    // Getter methods
    public String getUsername() {
        return username;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public String getEmail() {
        return email;
    }

    // Setter methods
    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
