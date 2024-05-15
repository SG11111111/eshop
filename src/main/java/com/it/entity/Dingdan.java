package com.it.entity;


import java.io.Serializable;

public class Dingdan implements Serializable {
    private int id;
    private String ddno;
    private String memberid;
    private double total;
    private String savetime;
    private String fkfs;
    private String shrname;
    private String zffs;
    private String shraddr;
    private String fkstatus;
    private String fhstatus;

    private Product product;
    private Member member;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDdno() {
        return ddno;
    }

    public void setDdno(String ddno) {
        this.ddno = ddno;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }


    public String getSavetime() {
        return savetime;
    }

    public void setSavetime(String savetime) {
        this.savetime = savetime;
    }

    public String getFkfs() {
        return fkfs;
    }

    public void setFkfs(String fkfs) {
        this.fkfs = fkfs;
    }

    public String getShrname() {
        return shrname;
    }

    public void setShrname(String shrname) {
        this.shrname = shrname;
    }

    public String getZffs() {
        return zffs;
    }

    public void setZffs(String zffs) {
        this.zffs = zffs;
    }

    public String getShraddr() {
        return shraddr;
    }

    public void setShraddr(String shraddr) {
        this.shraddr = shraddr;
    }


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public String getFkstatus() {
        return fkstatus;
    }

    public void setFkstatus(String fkstatus) {
        this.fkstatus = fkstatus;
    }

    public String getFhstatus() {
        return fhstatus;
    }

    public void setFhstatus(String fhstatus) {
        this.fhstatus = fhstatus;
    }
}
