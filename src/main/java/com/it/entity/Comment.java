package com.it.entity;


import java.io.Serializable;

public class Comment implements Serializable {
    private int id;
    private String memberid;
    private String productid;
    private int pf;
    private String content;

    private Member member;
    private Product pt;


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

    public int getPf() {
        return pf;
    }

    public void setPf(int pf) {
        this.pf = pf;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Product getPt() {
        return pt;
    }

    public void setPt(Product pt) {
        this.pt = pt;
    }
}
