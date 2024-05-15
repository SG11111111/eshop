package com.it.entity;


import java.io.Serializable;
import java.util.List;

public class Category implements Serializable {
    private int id;
    private String name;
    private String fatherid;
    private String delstatus;
    private List<Category> childlist;
    private List<Product> fproduct;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFatherid() {
        return fatherid;
    }

    public void setFatherid(String fatherid) {
        this.fatherid = fatherid;
    }

    public String getDelstatus() {
        return delstatus;
    }

    public void setDelstatus(String delstatus) {
        this.delstatus = delstatus;
    }

    public List<Category> getChildlist() {
        return childlist;
    }

    public void setChildlist(List<Category> childlist) {
        this.childlist = childlist;
    }

    public List<Product> getFproduct() {
        return fproduct;
    }

    public void setFproduct(List<Product> fproduct) {
        this.fproduct = fproduct;
    }
}
