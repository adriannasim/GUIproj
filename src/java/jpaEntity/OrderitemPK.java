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
public class OrderitemPK implements Serializable
{

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "orderid")
    private String orderid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "prodid")
    private String prodid;

    public OrderitemPK()
    {
    }

    public OrderitemPK(String orderid, String prodid)
    {
        this.orderid = orderid;
        this.prodid = prodid;
    }

    public String getOrderid()
    {
        return orderid;
    }

    public void setOrderid(String orderid)
    {
        this.orderid = orderid;
    }

    public String getProdid()
    {
        return prodid;
    }

    public void setProdid(String prodid)
    {
        this.prodid = prodid;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        hash += (prodid != null ? prodid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderitemPK))
        {
            return false;
        }
        OrderitemPK other = (OrderitemPK) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid)))
        {
            return false;
        }
        if ((this.prodid == null && other.prodid != null) || (this.prodid != null && !this.prodid.equals(other.prodid)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "jpaEntity.OrderitemPK[ orderid=" + orderid + ", prodid=" + prodid + " ]";
    }
    
}
