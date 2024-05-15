package com.it.entity;


import java.io.Serializable;

public class Cart implements Serializable {
    private int id;
    private String memberid;
    private String productid;
    private int num;
    private double xjtotal;
    private double total;
    private Product product;



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getXjtotal() {
        return xjtotal;
    }

    public void setXjtotal(double xjtotal) {
        this.xjtotal = xjtotal;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
