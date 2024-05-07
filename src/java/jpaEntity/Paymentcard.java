/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jpaEntity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author adria
 */
@Entity
@Table(name = "paymentcard")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Paymentcard.findAll", query = "SELECT p FROM Paymentcard p"),
    @NamedQuery(name = "Paymentcard.findByCardname", query = "SELECT p FROM Paymentcard p WHERE p.paymentcardPK.cardname = :cardname"),
    @NamedQuery(name = "Paymentcard.findByDatemonth", query = "SELECT p FROM Paymentcard p WHERE p.datemonth = :datemonth"),
    @NamedQuery(name = "Paymentcard.findByDateyear", query = "SELECT p FROM Paymentcard p WHERE p.dateyear = :dateyear"),
    @NamedQuery(name = "Paymentcard.findByCardnumber", query = "SELECT p FROM Paymentcard p WHERE p.paymentcardPK.cardnumber = :cardnumber"),
    @NamedQuery(name = "Paymentcard.findByCvv", query = "SELECT p FROM Paymentcard p WHERE p.cvv = :cvv"),
    @NamedQuery(name = "Paymentcard.findByUsername", query = "SELECT p FROM Paymentcard p WHERE p.username = :username")
})
public class Paymentcard implements Serializable
{

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PaymentcardPK paymentcardPK;
    @Column(name = "datemonth")
    private Integer datemonth;
    @Column(name = "dateyear")
    private Integer dateyear;
    @Size(max = 4)
    @Column(name = "cvv")
    private String cvv;
    @Size(max = 15)
    @Column(name = "username")
    private String username;

    public Paymentcard()
    {
    }

    public Paymentcard(PaymentcardPK paymentcardPK)
    {
        this.paymentcardPK = paymentcardPK;
    }

    public Paymentcard(String cardname, String cardnumber)
    {
        this.paymentcardPK = new PaymentcardPK(cardname, cardnumber);
    }

    public PaymentcardPK getPaymentcardPK()
    {
        return paymentcardPK;
    }

    public void setPaymentcardPK(PaymentcardPK paymentcardPK)
    {
        this.paymentcardPK = paymentcardPK;
    }

    public Integer getDatemonth()
    {
        return datemonth;
    }

    public void setDatemonth(Integer datemonth)
    {
        this.datemonth = datemonth;
    }

    public Integer getDateyear()
    {
        return dateyear;
    }

    public void setDateyear(Integer dateyear)
    {
        this.dateyear = dateyear;
    }

    public String getCvv()
    {
        return cvv;
    }

    public void setCvv(String cvv)
    {
        this.cvv = cvv;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (paymentcardPK != null ? paymentcardPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Paymentcard))
        {
            return false;
        }
        Paymentcard other = (Paymentcard) object;
        if ((this.paymentcardPK == null && other.paymentcardPK != null) || (this.paymentcardPK != null && !this.paymentcardPK.equals(other.paymentcardPK)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "jpaEntity.Paymentcard[ paymentcardPK=" + paymentcardPK + " ]";
    }
    
}
