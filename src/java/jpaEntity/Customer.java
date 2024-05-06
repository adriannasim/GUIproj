/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jpaEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author adria
 */
@Entity
@Table(name = "customer")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Customer.findAll", query = "SELECT c FROM Customer c"),
    @NamedQuery(name = "Customer.findByUsername", query = "SELECT c FROM Customer c WHERE c.customerPK.username = :username"),
    @NamedQuery(name = "Customer.findByUserpwd", query = "SELECT c FROM Customer c WHERE c.userpwd = :userpwd"),
    @NamedQuery(name = "Customer.findByEmail", query = "SELECT c FROM Customer c WHERE c.customerPK.email = :email"),
    @NamedQuery(name = "Customer.findByFirstname", query = "SELECT c FROM Customer c WHERE c.firstname = :firstname"),
    @NamedQuery(name = "Customer.findByLastname", query = "SELECT c FROM Customer c WHERE c.lastname = :lastname"),
    @NamedQuery(name = "Customer.findByContactno", query = "SELECT c FROM Customer c WHERE c.contactno = :contactno"),
    @NamedQuery(name = "Customer.findByDateofbirth", query = "SELECT c FROM Customer c WHERE c.dateofbirth = :dateofbirth"),
    @NamedQuery(name = "Customer.findByGender", query = "SELECT c FROM Customer c WHERE c.gender = :gender"),
    @NamedQuery(name = "Customer.findByAddress", query = "SELECT c FROM Customer c WHERE c.address = :address"),
    @NamedQuery(name = "Customer.findByCity", query = "SELECT c FROM Customer c WHERE c.city = :city"),
    @NamedQuery(name = "Customer.findByState", query = "SELECT c FROM Customer c WHERE c.state = :state"),
    @NamedQuery(name = "Customer.findByPostalcode", query = "SELECT c FROM Customer c WHERE c.postalcode = :postalcode"),
    @NamedQuery(name = "Customer.findByCountry", query = "SELECT c FROM Customer c WHERE c.country = :country")
})
public class Customer implements Serializable
{

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CustomerPK customerPK;
    @Size(max = 70)
    @Column(name = "userpwd")
    private String userpwd;
    @Size(max = 50)
    @Column(name = "firstname")
    private String firstname;
    @Size(max = 50)
    @Column(name = "lastname")
    private String lastname;
    @Size(max = 11)
    @Column(name = "contactno")
    private String contactno;
    @Column(name = "dateofbirth")
    @Temporal(TemporalType.DATE)
    private Date dateofbirth;
    @Size(max = 1)
    @Column(name = "gender")
    private String gender;
    @Size(max = 200)
    @Column(name = "address")
    private String address;
    @Size(max = 50)
    @Column(name = "city")
    private String city;
    @Size(max = 50)
    @Column(name = "state")
    private String state;
    @Size(max = 5)
    @Column(name = "postalcode")
    private String postalcode;
    @Size(max = 20)
    @Column(name = "country")
    private String country;

    public Customer()
    {
    }

    public Customer(CustomerPK customerPK)
    {
        this.customerPK = customerPK;
    }

    public Customer(String username, String email)
    {
        this.customerPK = new CustomerPK(username, email);
    }

    public CustomerPK getCustomerPK()
    {
        return customerPK;
    }

    public void setCustomerPK(CustomerPK customerPK)
    {
        this.customerPK = customerPK;
    }

    public String getUserpwd()
    {
        return userpwd;
    }

    public void setUserpwd(String userpwd)
    {
        this.userpwd = userpwd;
    }

    public String getFirstname()
    {
        return firstname;
    }

    public void setFirstname(String firstname)
    {
        this.firstname = firstname;
    }

    public String getLastname()
    {
        return lastname;
    }

    public void setLastname(String lastname)
    {
        this.lastname = lastname;
    }

    public String getContactno()
    {
        return contactno;
    }

    public void setContactno(String contactno)
    {
        this.contactno = contactno;
    }

    public Date getDateofbirth()
    {
        return dateofbirth;
    }

    public void setDateofbirth(Date dateofbirth)
    {
        this.dateofbirth = dateofbirth;
    }

    public String getGender()
    {
        return gender;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getState()
    {
        return state;
    }

    public void setState(String state)
    {
        this.state = state;
    }

    public String getPostalcode()
    {
        return postalcode;
    }

    public void setPostalcode(String postalcode)
    {
        this.postalcode = postalcode;
    }

    public String getCountry()
    {
        return country;
    }

    public void setCountry(String country)
    {
        this.country = country;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (customerPK != null ? customerPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customer))
        {
            return false;
        }
        Customer other = (Customer) object;
        if ((this.customerPK == null && other.customerPK != null) || (this.customerPK != null && !this.customerPK.equals(other.customerPK)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "jpaEntity.Customer[ customerPK=" + customerPK + " ]";
    }
    
}
