package com.apsmgr.service.impl;

import com.apsmgr.bo.OrderBo;
import com.apsmgr.dao.OrderDao;
import com.apsmgr.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public int insert(OrderBo orderBo) {
        return orderDao.insert(orderBo);
    }

    @Override
    public int deleteBatch(List<String> orderNoList) {
        return orderDao.deleteBatch(orderNoList);
    }

    @Override
    public List<OrderBo> selectAllOrder() {
        return orderDao.selectAllOrder();
    }

    @Override
    public int update(OrderBo orderBo) {
        return orderDao.updateByPrimaryKey(orderBo);
    }
}
