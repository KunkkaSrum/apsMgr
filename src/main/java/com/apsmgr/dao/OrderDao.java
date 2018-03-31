package com.apsmgr.dao;

import com.apsmgr.bo.OrderBo;

import java.util.List;

public interface OrderDao {

    int deleteBatch(List<String> orderNoList);

    int insert(OrderBo orderBo);

    int updateByPrimaryKey(OrderBo orderBo);

    List<OrderBo> selectAllOrder();

    int deleteByPrimaryKey(Long id);

    int insertSelective(OrderBo record);

    OrderBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrderBo record);

}