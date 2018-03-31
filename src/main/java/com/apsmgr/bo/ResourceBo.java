package com.apsmgr.bo;

public class ResourceBo {
    private Long id;

    private String resourceNo;

    private String resourceCode;

    private String resourceName;

    private Integer resourceBatch;

    private Integer resourceDifference;

    private Integer resourceType;

    private Integer resourceConstraint;

    private Integer typeOfCost;

    private String remarks;

    private Integer displayColor;

    private Integer bottleneckResource;

    private Integer invaildResource;

    private Integer produceEffic;

    public ResourceBo(Long id, String resourceNo, String resourceCode, String resourceName, Integer resourceBatch, Integer resourceDifference, Integer resourceType, Integer resourceConstraint, Integer typeOfCost, String remarks, Integer displayColor, Integer bottleneckResource, Integer invaildResource, Integer produceEffic) {
        this.id = id;
        this.resourceNo = resourceNo;
        this.resourceCode = resourceCode;
        this.resourceName = resourceName;
        this.resourceBatch = resourceBatch;
        this.resourceDifference = resourceDifference;
        this.resourceType = resourceType;
        this.resourceConstraint = resourceConstraint;
        this.typeOfCost = typeOfCost;
        this.remarks = remarks;
        this.displayColor = displayColor;
        this.bottleneckResource = bottleneckResource;
        this.invaildResource = invaildResource;
        this.produceEffic = produceEffic;
    }

    public ResourceBo() {
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

    public String getResourceCode() {
        return resourceCode;
    }

    public void setResourceCode(String resourceCode) {
        this.resourceCode = resourceCode == null ? null : resourceCode.trim();
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName == null ? null : resourceName.trim();
    }

    public Integer getResourceBatch() {
        return resourceBatch;
    }

    public void setResourceBatch(Integer resourceBatch) {
        this.resourceBatch = resourceBatch;
    }

    public Integer getResourceDifference() {
        return resourceDifference;
    }

    public void setResourceDifference(Integer resourceDifference) {
        this.resourceDifference = resourceDifference;
    }

    public Integer getResourceType() {
        return resourceType;
    }

    public void setResourceType(Integer resourceType) {
        this.resourceType = resourceType;
    }

    public Integer getResourceConstraint() {
        return resourceConstraint;
    }

    public void setResourceConstraint(Integer resourceConstraint) {
        this.resourceConstraint = resourceConstraint;
    }

    public Integer getTypeOfCost() {
        return typeOfCost;
    }

    public void setTypeOfCost(Integer typeOfCost) {
        this.typeOfCost = typeOfCost;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Integer getDisplayColor() {
        return displayColor;
    }

    public void setDisplayColor(Integer displayColor) {
        this.displayColor = displayColor;
    }

    public Integer getBottleneckResource() {
        return bottleneckResource;
    }

    public void setBottleneckResource(Integer bottleneckResource) {
        this.bottleneckResource = bottleneckResource;
    }

    public Integer getInvaildResource() {
        return invaildResource;
    }

    public void setInvaildResource(Integer invaildResource) {
        this.invaildResource = invaildResource;
    }

    public Integer getProduceEffic() {
        return produceEffic;
    }

    public void setProduceEffic(Integer produceEffic) {
        this.produceEffic = produceEffic;
    }
}