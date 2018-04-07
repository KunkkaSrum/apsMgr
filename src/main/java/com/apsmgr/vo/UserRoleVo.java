package com.apsmgr.vo;


import java.util.List;

public class UserRoleVo {
    private String roleNo;

    private String roleName;

    private Integer roleStatus;

    private List<String> ResourceNoList;

    public String getRoleNo() {
        return roleNo;
    }

    public void setRoleNo(String roleNo) {
        this.roleNo = roleNo;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getRoleStatus() {
        return roleStatus;
    }

    public void setRoleStatus(Integer roleStatus) {
        this.roleStatus = roleStatus;
    }

    public List<String> getRoleResourceBoList() {
        return ResourceNoList;
    }

    public void setRoleResourceBoList(List<String> roleResourceBoList) {
        this.ResourceNoList = roleResourceBoList;
    }
}
