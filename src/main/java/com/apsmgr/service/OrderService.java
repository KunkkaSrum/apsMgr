package com.apsmgr.service;

import com.apsmgr.bo.OrderBo;

import java.util.List;

public interface OrderService {

    int insert(OrderBo orderBo);

    int deleteBatch(List<String> orderNoList);

    List<OrderBo> selectAllOrder();

    int update(OrderBo orderBo);

}
