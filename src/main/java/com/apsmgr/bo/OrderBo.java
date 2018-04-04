package com.apsmgr.bo;



public class OrderBo {
    private Long id;

    private String orderNo;

    private String orderCode;

    private String orderType;

    private String orderDiffrence;

    private String items;

    private String orderTime;

    private String deliveryTime;

    private Integer orderQuantity;

    private String customer;

    private Integer priority;

    private Integer dispalyColor;

    private String remarks;

    private String startTime;

    private String endTime;

    private String earliestTime;

    private String latestTime;

    private String orderStatus;

    private Integer produceEffic;

    private String actualStart;

    private String actualEnd;

    private Integer actualQuantity;

    public OrderBo(Long id, String orderNo, String orderCode, String orderType, String orderDiffrence, String items, String orderTime, String deliveryTime, Integer orderQuantity, String customer, Integer priority, Integer dispalyColor, String remarks, String startTime, String endTime, String earliestTime, String latestTime, String orderStatus, Integer produceEffic, String actualStart, String actualEnd, Integer actualQuantity) {
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

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
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

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getEarliestTime() {
        return earliestTime;
    }

    public void setEarliestTime(String earliestTime) {
        this.earliestTime = earliestTime;
    }

    public String getLatestTime() {
        return latestTime;
    }

    public void setLatestTime(String latestTime) {
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

    public String getActualStart() {
        return actualStart;
    }

    public void setActualStart(String actualStart) {
        this.actualStart = actualStart;
    }

    public String getActualEnd() {
        return actualEnd;
    }

    public void setActualEnd(String actualEnd) {
        this.actualEnd = actualEnd;
    }

    public Integer getActualQuantity() {
        return actualQuantity;
    }

    public void setActualQuantity(Integer actualQuantity) {
        this.actualQuantity = actualQuantity;
    }
}