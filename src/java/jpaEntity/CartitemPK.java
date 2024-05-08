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
public class CartitemPK implements Serializable
{

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 37)
    @Column(name = "cartid")
    private String cartid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "prodid")
    private String prodid;

    public CartitemPK()
    {
    }

    public CartitemPK(String cartid, String prodid)
    {
        this.cartid = cartid;
        this.prodid = prodid;
    }

    public String getCartid()
    {
        return cartid;
    }

    public void setCartid(String cartid)
    {
        this.cartid = cartid;
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
        hash += (cartid != null ? cartid.hashCode() : 0);
        hash += (prodid != null ? prodid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CartitemPK))
        {
            return false;
        }
        CartitemPK other = (CartitemPK) object;
        if ((this.cartid == null && other.cartid != null) || (this.cartid != null && !this.cartid.equals(other.cartid)))
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
        return "jpaEntity.CartitemPK[ cartid=" + cartid + ", prodid=" + prodid + " ]";
    }
    
}
