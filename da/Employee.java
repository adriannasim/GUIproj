package da;

public class Employee {
    private String empId;
    private String empRole; // "Manager" or "Staff"
    private String firstName;
    private String lastName;
    private int contactNo;
    private String gender;
    private User user;

    public Employee() {

    }

    public Employee(String empId, String empRole, String firstName, String lastName, int contactNo, String gender, User user) {
        this.empId = empId;
        this.empRole = empRole;
        this.firstName = firstName;
        this.lastName = lastName;
        this.contactNo = contactNo;
        this.gender = gender;
        this.user = user;
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

    public int getContactNo() {
        return contactNo;
    }

    public String getGender() {
        return gender;
    }

    public User getUser() {
        return user;
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

    public void setContactNo(int contactNo) {
        this.contactNo = contactNo;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

