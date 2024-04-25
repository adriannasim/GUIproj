package da;

import java.util.*;

public class Customer {
    private String firstName;
    private String lastName;
    private String custId;
    private int contactNo;
    private Date dateOfBirth;
    private String gender;
    private Address custAdd;
    private User user;
    
    public Customer(){

    }

    public Customer(String firstName, String lastName, String custId, int contactNo, Date dateOfBirth, String gender, Address custAdd, User user) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.custId = custId;
        this.contactNo = contactNo;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.custAdd = custAdd;
        this.user = user;
    }

    // Getter methods
    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getCustId() {
        return custId;
    }

    public int getContactNo() {
        return contactNo;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public Address getCustAdd() {
        return custAdd;
    }

    public User getUser() {
        return user;
    }

    // Setter methods
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public void setContactNo(int contactNo) {
        this.contactNo = contactNo;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setCustAdd(Address custAdd) {
        this.custAdd = custAdd;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
