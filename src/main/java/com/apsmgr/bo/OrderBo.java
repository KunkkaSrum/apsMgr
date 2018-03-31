package com.apsmgr.bo;

import java.util.Date;

public class OrderBo {
    private Long id;

    private String orderNo;

    private String orderCode;

    private String orderType;

    private String orderDiffrence;

    private String items;

    private Date orderTime;

    private Date deliveryTime;

    private Integer orderQuantity;

    private String customer;

    private Integer priority;

    private Integer dispalyColor;

    private String remarks;

    private Date startTime;

    private Date endTime;

    private Date earliestTime;

    private Date latestTime;

    private String orderStatus;

    private Integer produceEffic;

    private Date actualStart;

    private Date actualEnd;

    private Integer actualQuantity;

    public OrderBo(Long id, String orderNo, String orderCode, String orderType, String orderDiffrence, String items, Date orderTime, Date deliveryTime, Integer orderQuantity, String customer, Integer priority, Integer dispalyColor, String remarks, Date startTime, Date endTime, Date earliestTime, Date latestTime, String orderStatus, Integer produceEffic, Date actualStart, Date actualEnd, Integer actualQuantity) {
        this.id = id;
        this.orderNo = orderNo;
        this.orderCode = orderCode;
        this.orderType = orderType;
        this.orderDiffrence = orderDiffrence;
        this.items = items;
        this.orderTime = orderTime;
        this.deliveryTime = deliveryTime;
        this.orderQuantity = orderQuantity;
        this.customer = customer;
        this.priority = priority;
        this.dispalyColor = dispalyColor;
        this.remarks = remarks;
        this.startTime = startTime;
        this.endTime = endTime;
        this.earliestTime = earliestTime;
        this.latestTime = latestTime;
        this.orderStatus = orderStatus;
        this.produceEffic = produceEffic;
        this.actualStart = actualStart;
        this.actualEnd = actualEnd;
        this.actualQuantity = actualQuantity;
    }

    public OrderBo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode == null ? null : orderCode.trim();
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType == null ? null : orderType.trim();
    }

    public String getOrderDiffrence() {
        return orderDiffrence;
    }

    public void setOrderDiffrence(String orderDiffrence) {
        this.orderDiffrence = orderDiffrence == null ? null : orderDiffrence.trim();
    }

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items == null ? null : items.trim();
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public Integer getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(Integer orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer == null ? null : customer.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Integer getDispalyColor() {
        return dispalyColor;
    }

    public void setDispalyColor(Integer dispalyColor) {
        this.dispalyColor = dispalyColor;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getEarliestTime() {
        return earliestTime;
    }

    public void setEarliestTime(Date earliestTime) {
        this.earliestTime = earliestTime;
    }

    public Date getLatestTime() {
        return latestTime;
    }

    public void setLatestTime(Date latestTime) {
        this.latestTime = latestTime;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus == null ? null : orderStatus.trim();
    }

    public Integer getProduceEffic() {
        return produceEffic;
    }

    public void setProduceEffic(Integer produceEffic) {
        this.produceEffic = produceEffic;
    }

    public Date getActualStart() {
        return actualStart;
    }

    public void setActualStart(Date actualStart) {
        this.actualStart = actualStart;
    }

    public Date getActualEnd() {
        return actualEnd;
    }

    public void setActualEnd(Date actualEnd) {
        this.actualEnd = actualEnd;
    }

    public Integer getActualQuantity() {
        return actualQuantity;
    }

    public void setActualQuantity(Integer actualQuantity) {
        this.actualQuantity = actualQuantity;
    }
}