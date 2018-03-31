package com.apsmgr.bo;

import java.util.Date;

public class ProduceBo {
    private Long id;

    private String produceNo;

    private String resource;

    private Date date;

    private String attendanceCode;

    private String priority;

    private String resAmout;

    private String remark;

    private String showName;

    private String otherName;

    private String commonRemark;

    private String object;

    private String objDefine;

    private String defaultMarker;

    private String reasonDefMarker;

    private String changeMarkerInside;

    private String changeMarkerOutside;

    private Date changeDate;

    private String parentObject;

    private String subObject;

    private String importedObject;

    private String rightInputObjId;

    private String leftAssociatedObjId;

    public ProduceBo(Long id, String produceNo, String resource, Date date, String attendanceCode, String priority, String resAmout, String remark, String showName, String otherName, String commonRemark, String object, String objDefine, String defaultMarker, String reasonDefMarker, String changeMarkerInside, String changeMarkerOutside, Date changeDate, String parentObject, String subObject, String importedObject, String rightInputObjId, String leftAssociatedObjId) {
        this.id = id;
        this.produceNo = produceNo;
        this.resource = resource;
        this.date = date;
        this.attendanceCode = attendanceCode;
        this.priority = priority;
        this.resAmout = resAmout;
        this.remark = remark;
        this.showName = showName;
        this.otherName = otherName;
        this.commonRemark = commonRemark;
        this.object = object;
        this.objDefine = objDefine;
        this.defaultMarker = defaultMarker;
        this.reasonDefMarker = reasonDefMarker;
        this.changeMarkerInside = changeMarkerInside;
        this.changeMarkerOutside = changeMarkerOutside;
        this.changeDate = changeDate;
        this.parentObject = parentObject;
        this.subObject = subObject;
        this.importedObject = importedObject;
        this.rightInputObjId = rightInputObjId;
        this.leftAssociatedObjId = leftAssociatedObjId;
    }

    public ProduceBo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProduceNo() {
        return produceNo;
    }

    public void setProduceNo(String produceNo) {
        this.produceNo = produceNo == null ? null : produceNo.trim();
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource == null ? null : resource.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAttendanceCode() {
        return attendanceCode;
    }

    public void setAttendanceCode(String attendanceCode) {
        this.attendanceCode = attendanceCode == null ? null : attendanceCode.trim();
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority == null ? null : priority.trim();
    }

    public String getResAmout() {
        return resAmout;
    }

    public void setResAmout(String resAmout) {
        this.resAmout = resAmout == null ? null : resAmout.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getShowName() {
        return showName;
    }

    public void setShowName(String showName) {
        this.showName = showName == null ? null : showName.trim();
    }

    public String getOtherName() {
        return otherName;
    }

    public void setOtherName(String otherName) {
        this.otherName = otherName == null ? null : otherName.trim();
    }

    public String getCommonRemark() {
        return commonRemark;
    }

    public void setCommonRemark(String commonRemark) {
        this.commonRemark = commonRemark == null ? null : commonRemark.trim();
    }

    public String getObject() {
        return object;
    }

    public void setObject(String object) {
        this.object = object == null ? null : object.trim();
    }

    public String getObjDefine() {
        return objDefine;
    }

    public void setObjDefine(String objDefine) {
        this.objDefine = objDefine == null ? null : objDefine.trim();
    }

    public String getDefaultMarker() {
        return defaultMarker;
    }

    public void setDefaultMarker(String defaultMarker) {
        this.defaultMarker = defaultMarker == null ? null : defaultMarker.trim();
    }

    public String getReasonDefMarker() {
        return reasonDefMarker;
    }

    public void setReasonDefMarker(String reasonDefMarker) {
        this.reasonDefMarker = reasonDefMarker == null ? null : reasonDefMarker.trim();
    }

    public String getChangeMarkerInside() {
        return changeMarkerInside;
    }

    public void setChangeMarkerInside(String changeMarkerInside) {
        this.changeMarkerInside = changeMarkerInside == null ? null : changeMarkerInside.trim();
    }

    public String getChangeMarkerOutside() {
        return changeMarkerOutside;
    }

    public void setChangeMarkerOutside(String changeMarkerOutside) {
        this.changeMarkerOutside = changeMarkerOutside == null ? null : changeMarkerOutside.trim();
    }

    public Date getChangeDate() {
        return changeDate;
    }

    public void setChangeDate(Date changeDate) {
        this.changeDate = changeDate;
    }

    public String getParentObject() {
        return parentObject;
    }

    public void setParentObject(String parentObject) {
        this.parentObject = parentObject == null ? null : parentObject.trim();
    }

    public String getSubObject() {
        return subObject;
    }

    public void setSubObject(String subObject) {
        this.subObject = subObject == null ? null : subObject.trim();
    }

    public String getImportedObject() {
        return importedObject;
    }

    public void setImportedObject(String importedObject) {
        this.importedObject = importedObject == null ? null : importedObject.trim();
    }

    public String getRightInputObjId() {
        return rightInputObjId;
    }

    public void setRightInputObjId(String rightInputObjId) {
        this.rightInputObjId = rightInputObjId == null ? null : rightInputObjId.trim();
    }

    public String getLeftAssociatedObjId() {
        return leftAssociatedObjId;
    }

    public void setLeftAssociatedObjId(String leftAssociatedObjId) {
        this.leftAssociatedObjId = leftAssociatedObjId == null ? null : leftAssociatedObjId.trim();
    }
}