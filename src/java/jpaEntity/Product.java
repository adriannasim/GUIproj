/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jpaEntity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.persistence.FetchType;

/**
 *
 * @author adria
 */
@Entity
@Table(name = "product")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
    @NamedQuery(name = "Product.findByProdid", query = "SELECT p FROM Product p WHERE p.prodid = :prodid"),
    @NamedQuery(name = "Product.findByProdname", query = "SELECT p FROM Product p WHERE p.prodname = :prodname"),
    @NamedQuery(name = "Product.findByProddesc", query = "SELECT p FROM Product p WHERE p.proddesc = :proddesc"),
    @NamedQuery(name = "Product.findByProdprice", query = "SELECT p FROM Product p WHERE p.prodprice = :prodprice"),
    @NamedQuery(name = "Product.findByQtyavailable", query = "SELECT p FROM Product p WHERE p.qtyavailable = :qtyavailable"),
    @NamedQuery(name = "Product.findByProdimg", query = "SELECT p FROM Product p WHERE p.prodimg = :prodimg"),
    @NamedQuery(name = "Product.findByProdkeywords", query = "SELECT p FROM Product p WHERE p.prodkeywords = :prodkeywords"),
    @NamedQuery(name = "Product.findByProdaddeddate", query = "SELECT p FROM Product p WHERE p.prodaddeddate = :prodaddeddate"),
    @NamedQuery(name = "Product.findByMain", query = "SELECT p FROM Product p WHERE p.main = :main"),
    @NamedQuery(name = "Product.findByProdslug", query = "SELECT p FROM Product p WHERE p.prodslug = :prodslug")
})
public class Product implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "prodid")
    private String prodid;
    @Size(max = 1000)
    @Column(name = "prodname")
    private String prodname;
    @Size(max = 50000)
    @Column(name = "proddesc")
    private String proddesc;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "prodprice")
    private BigDecimal prodprice;
    @Column(name = "qtyavailable")
    private Integer qtyavailable;
    @Size(max = 1000)
    @Column(name = "prodimg")
    private String prodimg;
    @Size(max = 1000)
    @Column(name = "prodkeywords")
    private String prodkeywords;
    @Column(name = "prodaddeddate")
    @Temporal(TemporalType.DATE)
    private Date prodaddeddate;
    @Column(name = "main")
    private Character main;
    @Size(max = 255)
    @Column(name = "prodslug")
    private String prodslug;
   

    public Product()
    {
    }

    public Product(String prodid)
    {
        this.prodid = prodid;
    }

    public String getProdid()
    {
        return prodid;
    }

    public void setProdid(String prodid)
    {
        this.prodid = prodid;
    }

    public String getProdname()
    {
        return prodname;
    }

    public void setProdname(String prodname)
    {
        this.prodname = prodname;
    }

    public String getProddesc()
    {
        return proddesc;
    }

    public void setProddesc(String proddesc)
    {
        this.proddesc = proddesc;
    }

    public BigDecimal getProdprice()
    {
        return prodprice;
    }

    public void setProdprice(BigDecimal prodprice)
    {
        this.prodprice = prodprice;
    }

    public Integer getQtyavailable()
    {
        return qtyavailable;
    }

    public void setQtyavailable(Integer qtyavailable)
    {
        this.qtyavailable = qtyavailable;
    }

    public String getProdimg()
    {
        return prodimg;
    }

    public void setProdimg(String prodimg)
    {
        this.prodimg = prodimg;
    }

    public String getProdkeywords()
    {
        return prodkeywords;
    }

    public void setProdkeywords(String prodkeywords)
    {
        this.prodkeywords = prodkeywords;
    }

    public Date getProdaddeddate()
    {
        return prodaddeddate;
    }

    public void setProdaddeddate(Date prodaddeddate)
    {
        this.prodaddeddate = prodaddeddate;
    }

    public Character getMain()
    {
        return main;
    }

    public void setMain(Character main)
    {
        this.main = main;
    }

    public String getProdslug()
    {
        return prodslug;
    }

    public void setProdslug(String prodslug)
    {
        this.prodslug = prodslug;
    }
    

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (prodid != null ? prodid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product))
        {
            return false;
        }
        Product other = (Product) object;
        if ((this.prodid == null && other.prodid != null) || (this.prodid != null && !this.prodid.equals(other.prodid)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "jpaEntity.Product[ prodid=" + prodid + " ]";
    }
    
}
