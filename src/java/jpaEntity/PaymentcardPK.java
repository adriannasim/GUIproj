/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jpaEntity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author adria
 */
@Embeddable
public class PaymentcardPK implements Serializable
{

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "cardname")
    private String cardname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "cardnumber")
    private String cardnumber;

    public PaymentcardPK()
    {
    }

    public PaymentcardPK(String cardname, String cardnumber)
    {
        this.cardname = cardname;
        this.cardnumber = cardnumber;
    }

    public String getCardname()
    {
        return cardname;
    }

    public void setCardname(String cardname)
    {
        this.cardname = cardname;
    }

    public String getCardnumber()
    {
        return cardnumber;
    }

    public void setCardnumber(String cardnumber)
    {
        this.cardnumber = cardnumber;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (cardname != null ? cardname.hashCode() : 0);
        hash += (cardnumber != null ? cardnumber.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PaymentcardPK))
        {
            return false;
        }
        PaymentcardPK other = (PaymentcardPK) object;
        if ((this.cardname == null && other.cardname != null) || (this.cardname != null && !this.cardname.equals(other.cardname)))
        {
            return false;
        }
        if ((this.cardnumber == null && other.cardnumber != null) || (this.cardnumber != null && !this.cardnumber.equals(other.cardnumber)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "jpaEntity.PaymentcardPK[ cardname=" + cardname + ", cardnumber=" + cardnumber + " ]";
    }
    
}
