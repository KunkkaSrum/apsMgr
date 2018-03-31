package com.apsmgr.controller;


import com.alibaba.fastjson.JSON;
import com.apsmgr.bo.OrderBo;
import com.apsmgr.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderCtrl extends BaseCtrl {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insertOrder(OrderBo orderBo) {
        List<OrderBo> orderBos = new ArrayList<OrderBo>();
        orderBos.add(orderBo);
        orderService.insert(orderBo);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void deleteBatchOrder(@RequestParam("list")List<String> orderNoList) {
        int result = orderService.deleteBatch(orderNoList);
        return;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateOrder(OrderBo orderBo, HttpServletResponse response) throws Exception {
        orderService.update(orderBo);
        return;
    }

    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
    public void selectAllOrder(HttpServletResponse response) throws Exception {
        List<OrderBo> orderBoList = orderService.selectAllOrder();
        write(response, JSON.toJSONString(orderBoList));
    }
}
