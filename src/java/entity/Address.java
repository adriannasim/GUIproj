//package src.java.entity;
package entity;

public class Address {

    private String address;
    private String country;
    private String city;
    private String state;
    private String postalCode;

    public Address() {

    }

    public Address(String address, String city, String state, String postalCode, String country) {
        this.address = address;
        this.country = country;
        this.city = city;
        this.state = state;
        this.postalCode = postalCode;
    }

    // Getter methods
    public String getAddress() {
        return address;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getPostalCode() {
        return postalCode;
    }

    // Setter methods
    public void setAddress(String address) {
        this.address = address;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
}
