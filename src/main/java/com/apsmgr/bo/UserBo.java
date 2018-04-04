package com.apsmgr.bo;

import java.util.Date;

public class UserBo {
    private Long id;

    private String userNo;

    private String userName;

    private String password;

    private String realName;

    private String companyName;

    private String companyAddress;

    private String telephone;

    private String mail;

    private Date registerTime;

    private String roleNo;

    public UserBo(Long id, String userNo, String userName, String password, String realName, String companyName, String companyAddress, String telephone, String mail, Date registerTime, String roleNo) {
        this.id = id;
        this.userNo = userNo;
        this.userName = userName;
        this.password = password;
        this.realName = realName;
        this.companyName = companyName;
        this.companyAddress = companyAddress;
        this.telephone = telephone;
        this.mail = mail;
        this.registerTime = registerTime;
        this.roleNo = roleNo;
    }

    public UserBo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo == null ? null : userNo.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress == null ? null : companyAddress.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail == null ? null : mail.trim();
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getRoleNo() {
        return roleNo;
    }

    public void setRoleNo(String roleNo) {
        this.roleNo = roleNo == null ? null : roleNo.trim();
    }
}