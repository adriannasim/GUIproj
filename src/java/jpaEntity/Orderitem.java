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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author adria
 */
@Entity
@Table(name = "orderitem")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Orderitem.findAll", query = "SELECT o FROM Orderitem o"),
    @NamedQuery(name = "Orderitem.findByOrderid", query = "SELECT o FROM Orderitem o WHERE o.orderitemPK.orderid = :orderid"),
    @NamedQuery(name = "Orderitem.findByProductid", query = "SELECT o FROM Orderitem o WHERE o.orderitemPK.productid = :productid"),
    @NamedQuery(name = "Orderitem.findByItemqty", query = "SELECT o FROM Orderitem o WHERE o.itemqty = :itemqty")
})
public class Orderitem implements Serializable
{

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderitemPK orderitemPK;
    @Column(name = "itemqty")
    private Integer itemqty;

    public Orderitem()
    {
    }

    public Orderitem(OrderitemPK orderitemPK)
    {
        this.orderitemPK = orderitemPK;
    }

    public Orderitem(String orderid, String productid)
    {
        this.orderitemPK = new OrderitemPK(orderid, productid);
    }

    public OrderitemPK getOrderitemPK()
    {
        return orderitemPK;
    }

    public void setOrderitemPK(OrderitemPK orderitemPK)
    {
        this.orderitemPK = orderitemPK;
    }

    public Integer getItemqty()
    {
        return itemqty;
    }

    public void setItemqty(Integer itemqty)
    {
        this.itemqty = itemqty;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (orderitemPK != null ? orderitemPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderitem))
        {
            return false;
        }
        Orderitem other = (Orderitem) object;
        if ((this.orderitemPK == null && other.orderitemPK != null) || (this.orderitemPK != null && !this.orderitemPK.equals(other.orderitemPK)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "jpaEntity.Orderitem[ orderitemPK=" + orderitemPK + " ]";
    }
    
}
