package com.apsmgr.bo;

public class UserResourceBo {
    private Long id;

    private String resourceNo;

    private String resourceText;

    private String resourceIcon;

    private String resourceHref;

    private String fatherText;

    public String getFatherText() {
        return fatherText;
    }

    public void setFatherText(String fatherText) {
        this.fatherText = fatherText;
    }

    public UserResourceBo(Long id, String resourceNo, String resourceText, String resourceIcon, String resourceHref, String fatherText) {
        this.id = id;
        this.resourceNo = resourceNo;
        this.resourceText = resourceText;
        this.resourceIcon = resourceIcon;
        this.resourceHref = resourceHref;
        this.fatherText = fatherText;
    }

    public UserResourceBo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getResourceNo() {
        return resourceNo;
    }

    public void setResourceNo(String resourceNo) {
        this.resourceNo = resourceNo == null ? null : resourceNo.trim();
    }

    public String getResourceText() {
        return resourceText;
    }

    public void setResourceText(String resourceText) {
        this.resourceText = resourceText == null ? null : resourceText.trim();
    }

    public String getResourceIcon() {
        return resourceIcon;
    }

    public void setResourceIcon(String resourceIcon) {
        this.resourceIcon = resourceIcon == null ? null : resourceIcon.trim();
    }

    public String getResourceHref() {
        return resourceHref;
    }

    public void setResourceHref(String resourceHref) {
        this.resourceHref = resourceHref == null ? null : resourceHref.trim();
    }
}