//package src.java.entity;
package entity;

public class Employee extends User{
    private String empId;
    private String empRole; // "Manager" or "Staff"
    private String firstName;
    private String lastName;
    private String contactNo;
    private String gender;

    public Employee() {

    }

    public Employee(String username, String userPwd, String email, String empId, String firstName, 
            String lastName, String contactNo, String gender, String empRole) {
        //super(userId,username, userPwd, email);
        super(username, userPwd, email);
        this.empId = empId;
        this.empRole = empRole;
        this.firstName = firstName;
        this.lastName = lastName;
        this.contactNo = contactNo;
        this.gender = gender;
    }

    // Getter methods
    public String getEmpId() {
        return empId;
    }

    public String getEmpRole() {
        return empRole;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getContactNo() {
        return contactNo;
    }

    public String getGender() {
        return gender;
    }

    // Setter methods
    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public void setEmpRole(String empRole) {
        this.empRole = empRole;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}

