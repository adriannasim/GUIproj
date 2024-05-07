/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jpaEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author adria
 */
@Entity
@Table(name = "custorder")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Custorder.findAll", query = "SELECT c FROM Custorder c"),
    @NamedQuery(name = "Custorder.findByOrderid", query = "SELECT c FROM Custorder c WHERE c.orderid = :orderid"),
    @NamedQuery(name = "Custorder.findByOrderdate", query = "SELECT c FROM Custorder c WHERE c.orderdate = :orderdate"),
    @NamedQuery(name = "Custorder.findByStatus", query = "SELECT c FROM Custorder c WHERE c.status = :status"),
    @NamedQuery(name = "Custorder.findByUsername", query = "SELECT c FROM Custorder c WHERE c.username = :username"),
    @NamedQuery(name = "Custorder.findByAddress", query = "SELECT c FROM Custorder c WHERE c.address = :address"),
    @NamedQuery(name = "Custorder.findByCity", query = "SELECT c FROM Custorder c WHERE c.city = :city"),
    @NamedQuery(name = "Custorder.findByState", query = "SELECT c FROM Custorder c WHERE c.state = :state"),
    @NamedQuery(name = "Custorder.findByPostalcode", query = "SELECT c FROM Custorder c WHERE c.postalcode = :postalcode"),
    @NamedQuery(name = "Custorder.findByCountry", query = "SELECT c FROM Custorder c WHERE c.country = :country"),
    @NamedQuery(name = "Custorder.findByPackaging", query = "SELECT c FROM Custorder c WHERE c.packaging = :packaging"),
    @NamedQuery(name = "Custorder.findByShipping", query = "SELECT c FROM Custorder c WHERE c.shipping = :shipping"),
    @NamedQuery(name = "Custorder.findByDelivery", query = "SELECT c FROM Custorder c WHERE c.delivery = :delivery")
})
public class Custorder implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "orderid")
    private String orderid;
    @Column(name = "orderdate")
    @Temporal(TemporalType.DATE)
    private Date orderdate;
    @Size(max = 15)
    @Column(name = "status")
    private String status;
    @Size(max = 50)
    @Column(name = "username")
    private String username;
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
    @Column(name = "packaging")
    //@Temporal(TemporalType.DATE)
    private Date packaging;
    @Column(name = "shipping")
    //@Temporal(TemporalType.DATE)
    private Date shipping;
    @Column(name = "delivery")
    //@Temporal(TemporalType.DATE)
    private Date delivery;
    @Size(max = 50)
    @Column(name = "name")
    private String name;
    @Size(max = 11)
    @Column(name = "contactno")
    private String contactno;
    @Size(max = 500)
    @Column(name = "remark")
    private String remark;

    public Custorder()
    {
    }

    public Custorder(String orderid)
    {
        this.orderid = orderid;
    }

    public String getOrderid()
    {
        return orderid;
    }

    public void setOrderid(String orderid)
    {
        this.orderid = orderid;
    }

    public Date getOrderdate()
    {
        return orderdate;
    }

    public void setOrderdate(Date orderdate)
    {
        this.orderdate = orderdate;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
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

    public Date getPackaging()
    {
        return packaging;
    }

    public void setPackaging(Date packaging)
    {
        this.packaging = packaging;
    }

    public Date getShipping()
    {
        return shipping;
    }

    public void setShipping(Date shipping)
    {
        this.shipping = shipping;
    }

    public Date getDelivery()
    {
        return delivery;
    }

    public void setDelivery(Date delivery)
    {
        this.delivery = delivery;
    }
    
    public String getName()
    {
        return name;
    }
    
    public void setName(String name)
    {
        this.name = name;
    }
    
    public String getContactno()
    {
        return contactno;
    }
    
    public void setContactno(String contactno)
    {
        this.contactno = contactno;
    }
    
    public String getRemark()
    {
        return remark;
    }
    
    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Custorder))
        {
            return false;
        }
        Custorder other = (Custorder) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "jpaEntity.Custorder[ orderid=" + orderid + " ]";
    }
    
}
