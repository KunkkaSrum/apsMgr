package com.apsmgr.bo;

import java.util.Date;

public class AttendanceBo {
    private Long id;

    private String attendanceNo;

    private String attendanceCode;

    private String attendanceMode;

    private Integer objectId;

    private String remarks;

    private String classDefine;

    private Date updateTime;

    private String produceResource;

    public AttendanceBo(Long id, String attendanceNo, String attendanceCode, String attendanceMode, Integer objectId, String remarks, String classDefine, Date updateTime, String produceResource) {
        this.id = id;
        this.attendanceNo = attendanceNo;
        this.attendanceCode = attendanceCode;
        this.attendanceMode = attendanceMode;
        this.objectId = objectId;
        this.remarks = remarks;
        this.classDefine = classDefine;
        this.updateTime = updateTime;
        this.produceResource = produceResource;
    }

    public AttendanceBo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAttendanceNo() {
        return attendanceNo;
    }

    public void setAttendanceNo(String attendanceNo) {
        this.attendanceNo = attendanceNo == null ? null : attendanceNo.trim();
    }

    public String getAttendanceCode() {
        return attendanceCode;
    }

    public void setAttendanceCode(String attendanceCode) {
        this.attendanceCode = attendanceCode == null ? null : attendanceCode.trim();
    }

    public String getAttendanceMode() {
        return attendanceMode;
    }

    public void setAttendanceMode(String attendanceMode) {
        this.attendanceMode = attendanceMode == null ? null : attendanceMode.trim();
    }

    public Integer getObjectId() {
        return objectId;
    }

    public void setObjectId(Integer objectId) {
        this.objectId = objectId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public String getClassDefine() {
        return classDefine;
    }

    public void setClassDefine(String classDefine) {
        this.classDefine = classDefine == null ? null : classDefine.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getProduceResource() {
        return produceResource;
    }

    public void setProduceResource(String produceResource) {
        this.produceResource = produceResource == null ? null : produceResource.trim();
    }
}