package com.apsmgr.bo;

public class UserRoleBo {
    private Long id;

    private String roleNo;

    private String roleName;

    private Integer roleStatus;

    public UserRoleBo(Long id, String roleNo, String roleName, Integer roleStatus) {
        this.id = id;
        this.roleNo = roleNo;
        this.roleName = roleName;
        this.roleStatus = roleStatus;
    }

    public UserRoleBo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleNo() {
        return roleNo;
    }

    public void setRoleNo(String roleNo) {
        this.roleNo = roleNo == null ? null : roleNo.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public Integer getRoleStatus() {
        return roleStatus;
    }

    public void setRoleStatus(Integer roleStatus) {
        this.roleStatus = roleStatus;
    }
}