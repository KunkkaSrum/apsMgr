package com.apsmgr.bo;

public class RoleResourceBo {
    private Long id;

    private String roleNo;

    private String resourceNo;

    public RoleResourceBo(Long id, String roleNo, String resourceNo) {
        this.id = id;
        this.roleNo = roleNo;
        this.resourceNo = resourceNo;
    }

    public RoleResourceBo() {
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

    public String getResourceNo() {
        return resourceNo;
    }

    public void setResourceNo(String resourceNo) {
        this.resourceNo = resourceNo == null ? null : resourceNo.trim();
    }
}