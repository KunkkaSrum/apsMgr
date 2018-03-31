package com.apsmgr.bo;

public class BomBo {
    private Long id;

    private String bomNo;

    private String items;

    private String procedureNumber;

    private String procedureCode;

    private String resources;

    private String resourcePriority;

    private String frontSet;

    private String produce;

    private String backSet;

    private String continueMethod;

    private String necessaryResources;

    private String moveTimeMin;

    private String moveTimeMax;

    private String wasteNumber;

    private String yield;

    private String produceEffic;

    private String instructionType;

    private String instructionCode;

    private String instructionUseful;

    private String workingBatchMin;

    private String workingBatchMax;

    private String workingBatchUnit;

    public BomBo(Long id, String bomNo, String items, String procedureNumber, String procedureCode, String resources, String resourcePriority, String frontSet, String produce, String backSet, String continueMethod, String necessaryResources, String moveTimeMin, String moveTimeMax, String wasteNumber, String yield, String produceEffic, String instructionType, String instructionCode, String instructionUseful, String workingBatchMin, String workingBatchMax, String workingBatchUnit) {
        this.id = id;
        this.bomNo = bomNo;
        this.items = items;
        this.procedureNumber = procedureNumber;
        this.procedureCode = procedureCode;
        this.resources = resources;
        this.resourcePriority = resourcePriority;
        this.frontSet = frontSet;
        this.produce = produce;
        this.backSet = backSet;
        this.continueMethod = continueMethod;
        this.necessaryResources = necessaryResources;
        this.moveTimeMin = moveTimeMin;
        this.moveTimeMax = moveTimeMax;
        this.wasteNumber = wasteNumber;
        this.yield = yield;
        this.produceEffic = produceEffic;
        this.instructionType = instructionType;
        this.instructionCode = instructionCode;
        this.instructionUseful = instructionUseful;
        this.workingBatchMin = workingBatchMin;
        this.workingBatchMax = workingBatchMax;
        this.workingBatchUnit = workingBatchUnit;
    }

    public BomBo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBomNo() {
        return bomNo;
    }

    public void setBomNo(String bomNo) {
        this.bomNo = bomNo == null ? null : bomNo.trim();
    }

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items == null ? null : items.trim();
    }

    public String getProcedureNumber() {
        return procedureNumber;
    }

    public void setProcedureNumber(String procedureNumber) {
        this.procedureNumber = procedureNumber == null ? null : procedureNumber.trim();
    }

    public String getProcedureCode() {
        return procedureCode;
    }

    public void setProcedureCode(String procedureCode) {
        this.procedureCode = procedureCode == null ? null : procedureCode.trim();
    }

    public String getResources() {
        return resources;
    }

    public void setResources(String resources) {
        this.resources = resources == null ? null : resources.trim();
    }

    public String getResourcePriority() {
        return resourcePriority;
    }

    public void setResourcePriority(String resourcePriority) {
        this.resourcePriority = resourcePriority == null ? null : resourcePriority.trim();
    }

    public String getFrontSet() {
        return frontSet;
    }

    public void setFrontSet(String frontSet) {
        this.frontSet = frontSet == null ? null : frontSet.trim();
    }

    public String getProduce() {
        return produce;
    }

    public void setProduce(String produce) {
        this.produce = produce == null ? null : produce.trim();
    }

    public String getBackSet() {
        return backSet;
    }

    public void setBackSet(String backSet) {
        this.backSet = backSet == null ? null : backSet.trim();
    }

    public String getContinueMethod() {
        return continueMethod;
    }

    public void setContinueMethod(String continueMethod) {
        this.continueMethod = continueMethod == null ? null : continueMethod.trim();
    }

    public String getNecessaryResources() {
        return necessaryResources;
    }

    public void setNecessaryResources(String necessaryResources) {
        this.necessaryResources = necessaryResources == null ? null : necessaryResources.trim();
    }

    public String getMoveTimeMin() {
        return moveTimeMin;
    }

    public void setMoveTimeMin(String moveTimeMin) {
        this.moveTimeMin = moveTimeMin == null ? null : moveTimeMin.trim();
    }

    public String getMoveTimeMax() {
        return moveTimeMax;
    }

    public void setMoveTimeMax(String moveTimeMax) {
        this.moveTimeMax = moveTimeMax == null ? null : moveTimeMax.trim();
    }

    public String getWasteNumber() {
        return wasteNumber;
    }

    public void setWasteNumber(String wasteNumber) {
        this.wasteNumber = wasteNumber == null ? null : wasteNumber.trim();
    }

    public String getYield() {
        return yield;
    }

    public void setYield(String yield) {
        this.yield = yield == null ? null : yield.trim();
    }

    public String getProduceEffic() {
        return produceEffic;
    }

    public void setProduceEffic(String produceEffic) {
        this.produceEffic = produceEffic == null ? null : produceEffic.trim();
    }

    public String getInstructionType() {
        return instructionType;
    }

    public void setInstructionType(String instructionType) {
        this.instructionType = instructionType == null ? null : instructionType.trim();
    }

    public String getInstructionCode() {
        return instructionCode;
    }

    public void setInstructionCode(String instructionCode) {
        this.instructionCode = instructionCode == null ? null : instructionCode.trim();
    }

    public String getInstructionUseful() {
        return instructionUseful;
    }

    public void setInstructionUseful(String instructionUseful) {
        this.instructionUseful = instructionUseful == null ? null : instructionUseful.trim();
    }

    public String getWorkingBatchMin() {
        return workingBatchMin;
    }

    public void setWorkingBatchMin(String workingBatchMin) {
        this.workingBatchMin = workingBatchMin == null ? null : workingBatchMin.trim();
    }

    public String getWorkingBatchMax() {
        return workingBatchMax;
    }

    public void setWorkingBatchMax(String workingBatchMax) {
        this.workingBatchMax = workingBatchMax == null ? null : workingBatchMax.trim();
    }

    public String getWorkingBatchUnit() {
        return workingBatchUnit;
    }

    public void setWorkingBatchUnit(String workingBatchUnit) {
        this.workingBatchUnit = workingBatchUnit == null ? null : workingBatchUnit.trim();
    }
}