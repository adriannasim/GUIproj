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
@Table(name = "paymentinfo")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Paymentinfo.findAll", query = "SELECT p FROM Paymentinfo p"),
    @NamedQuery(name = "Paymentinfo.findByPaymentid", query = "SELECT p FROM Paymentinfo p WHERE p.paymentid = :paymentid"),
    @NamedQuery(name = "Paymentinfo.findByOrderid", query = "SELECT p FROM Paymentinfo p WHERE p.orderid = :orderid"),
    @NamedQuery(name = "Paymentinfo.findByusername", query = "SELECT p FROM Paymentinfo p WHERE p.username = :username"),
    @NamedQuery(name = "Paymentinfo.findByPaymenttype", query = "SELECT p FROM Paymentinfo p WHERE p.paymenttype = :paymenttype"),
    @NamedQuery(name = "Paymentinfo.findByPaymentdate", query = "SELECT p FROM Paymentinfo p WHERE p.paymentdate = :paymentdate"),
    @NamedQuery(name = "Paymentinfo.findByPaymentamount", query = "SELECT p FROM Paymentinfo p WHERE p.paymentamount = :paymentamount")
})
public class Paymentinfo implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "paymentid")
    private String paymentid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "orderid")
    private String orderid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "paymenttype")
    private String paymenttype;
    @Column(name = "paymentdate")
    @Temporal(TemporalType.DATE)
    private Date paymentdate;
    @Column(name = "paymentamount")
    private double paymentamount;
    @Column(name = "shippingfee")
    private double shippingfee;
    @Column(name = "salestax")
    private double salestax;
    @Column(name = "charges")
    private double charges;

    public Paymentinfo()
    {
    }

    public Paymentinfo(String paymentid)
    {
        this.paymentid = paymentid;
    }

    public Paymentinfo(String paymentid, String orderid, String username, String paymenttype)
    {
        this.paymentid = paymentid;
        this.orderid = orderid;
        this.username = username;
        this.paymenttype = paymenttype;
    }

    public String getPaymentid()
    {
        return paymentid;
    }

    public void setPaymentid(String paymentid)
    {
        this.paymentid = paymentid;
    }

    public String getOrderid()
    {
        return orderid;
    }

    public void setOrderid(String orderid)
    {
        this.orderid = orderid;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPaymenttype()
    {
        return paymenttype;
    }

    public void setPaymenttype(String paymenttype)
    {
        this.paymenttype = paymenttype;
    }

    public Date getPaymentdate()
    {
        return paymentdate;
    }

    public void setPaymentdate(Date paymentdate)
    {
        this.paymentdate = paymentdate;
    }

    public double getPaymentamount()
    {
        return paymentamount;
    }

    public void setPaymentamount(double paymentamount)
    {
        this.paymentamount = paymentamount;
    }
    
    public double getShippingfee()
    {
        return shippingfee;
    }

    public void setShippingfee(double shippingfee)
    {
        this.shippingfee = shippingfee;
    }
    
    public double getSalestax()
    {
        return salestax;
    }

    public void setSalestax(double salestax)
    {
        this.salestax = salestax;
    }
    
    public double getCharges()
    {
        return charges;
    }

    public void setCharges(double charges)
    {
        this.charges = charges;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (paymentid != null ? paymentid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Paymentinfo))
        {
            return false;
        }
        Paymentinfo other = (Paymentinfo) object;
        if ((this.paymentid == null && other.paymentid != null) || (this.paymentid != null && !this.paymentid.equals(other.paymentid)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "jpaEntity.Paymentinfo[ paymentid=" + paymentid + " ]";
    }
    
}
