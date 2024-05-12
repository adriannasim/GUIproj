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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
            @NamedQuery(name = "Orderitem.findByprodid", query = "SELECT o FROM Orderitem o WHERE o.orderitemPK.prodid = :prodid"),
            @NamedQuery(name = "Orderitem.findByItemqty", query = "SELECT o FROM Orderitem o WHERE o.itemqty = :itemqty")
        })
public class Orderitem implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderitemPK orderitemPK;
    @Column(name = "itemqty")
    private Integer itemqty;

    @Column(name = "prodprice")
    private double prodprice;

    @Column(name = "prodname")
    private String prodname;

    @Column(name = "prodImg")
    private String prodimg;

    @ManyToOne
    @JoinColumn(name = "orderid", referencedColumnName = "orderid", insertable = false, updatable = false)
    private Custorder custorder;

    public Orderitem() {
    }

    public Orderitem(OrderitemPK orderitemPK) {
        this.orderitemPK = orderitemPK;
    }

    public Orderitem(String orderid, String prodid) {
        this.orderitemPK = new OrderitemPK(orderid, prodid);
    }

    public OrderitemPK getOrderitemPK() {
        return orderitemPK;
    }

    public void setOrderitemPK(OrderitemPK orderitemPK) {
        this.orderitemPK = orderitemPK;
    }

    public Integer getItemqty() {
        return itemqty;
    }

    public void setItemqty(Integer itemqty) {
        this.itemqty = itemqty;
    }

    public double getProdprice() {
        return prodprice;
    }

    public void setProdprice(double prodprice) {
        this.prodprice = prodprice;
    }

    public Custorder getCustorder() {
        return custorder;
    }

    public void setCustorder(Custorder custorder) {
        this.custorder = custorder;
    }

    public String getProdname() {
        return prodname;
    }

    public void setProdname(String prodname) {
        this.prodname = prodname;
    }

    public String getProdimg() {
        return prodimg;
    }

    public void setProdimg(String prodimg) {
        this.prodimg = prodimg;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderitemPK != null ? orderitemPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderitem)) {
            return false;
        }
        Orderitem other = (Orderitem) object;
        if ((this.orderitemPK == null && other.orderitemPK != null) || (this.orderitemPK != null && !this.orderitemPK.equals(other.orderitemPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpaEntity.Orderitem[ orderitemPK=" + orderitemPK + " ]";
    }

}
