//package src.java.entity;
package entity;

import java.util.*;

public class Customer extends User{
    private String firstName;
    private String lastName;
//    private String custId;
    private String contactNo;
    private Date dateOfBirth;
    private String gender;
    private ArrayList<Address> custAdd;
    
    public Customer(){

    }
    
//    public Customer(String firstName, String lastName, int contactNo, Date dateOfBirth, 
//            String gender, Address custAdd) {
//        this.firstName = firstName;
//        this.lastName = lastName;
//        this.contactNo = contactNo;
//        this.dateOfBirth = dateOfBirth;
//        this.gender = gender;
//        this.custAdd.add(custAdd);
//    }

    public Customer(String username, String userPwd, String email, String firstName, 
            String lastName, String contactNo, Date dateOfBirth, String gender, Address custAdd) {
        //super(userId,username, userPwd, email);
        super(username, userPwd, email);
        this.firstName = firstName;
        this.lastName = lastName;
        this.contactNo = contactNo;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.custAdd.add(custAdd);
    }

    // Getter methods
    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

//    public String getCustId() {
//        return custId;
//    }

    public String getContactNo() {
        return contactNo;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public ArrayList<Address> getCustAdd() {
        return custAdd;
    }

    // Setter methods
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

//    public void setCustId(String custId) {
//        this.custId = custId;
//    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setCustAdd(ArrayList<Address> custAdd) {
        this.custAdd = custAdd;
    }
    
    public void addCustAdd(Address custAdd) {
        this.custAdd.add(custAdd);
    }
}
