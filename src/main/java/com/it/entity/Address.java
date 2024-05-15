package com.it.entity;


public class Address {

  private long id;
  private String name;
  private String tel;
  private String addr;
  private String delstatus;
  private String memberid;

  public String getMemberid() {
    return memberid;
  }

  public void setMemberid(String memberid) {
    this.memberid = memberid;
  }

  public String getDelstatus() {
    return delstatus;
  }

  public void setDelstatus(String delstatus) {
    this.delstatus = delstatus;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }


  public String getAddr() {
    return addr;
  }

  public void setAddr(String addr) {
    this.addr = addr;
  }

}
