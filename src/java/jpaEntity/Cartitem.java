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
@Table(name = "cartitem")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Cartitem.findAll", query = "SELECT c FROM Cartitem c"),
    @NamedQuery(name = "Cartitem.findByCartid", query = "SELECT c FROM Cartitem c WHERE c.cartitemPK.cartid = :cartid"),
    @NamedQuery(name = "Cartitem.findByProdid", query = "SELECT c FROM Cartitem c WHERE c.cartitemPK.prodid = :prodid"),
    @NamedQuery(name = "Cartitem.findByItemqty", query = "SELECT c FROM Cartitem c WHERE c.itemqty = :itemqty")
})
public class Cartitem implements Serializable
{

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CartitemPK cartitemPK;
    @Column(name = "itemqty")
    private Integer itemqty;

    public Cartitem()
    {
    }

    public Cartitem(CartitemPK cartitemPK)
    {
        this.cartitemPK = cartitemPK;
    }

    public Cartitem(String cartid, String prodid)
    {
        this.cartitemPK = new CartitemPK(cartid, prodid);
    }

    public CartitemPK getCartitemPK()
    {
        return cartitemPK;
    }

    public void setCartitemPK(CartitemPK cartitemPK)
    {
        this.cartitemPK = cartitemPK;
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
        hash += (cartitemPK != null ? cartitemPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cartitem))
        {
            return false;
        }
        Cartitem other = (Cartitem) object;
        if ((this.cartitemPK == null && other.cartitemPK != null) || (this.cartitemPK != null && !this.cartitemPK.equals(other.cartitemPK)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "jpaEntity.Cartitem[ cartitemPK=" + cartitemPK + " ]";
    }
    
}
