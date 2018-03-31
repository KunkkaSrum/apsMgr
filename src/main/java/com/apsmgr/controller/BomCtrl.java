package com.apsmgr.controller;

import com.alibaba.fastjson.JSON;
import com.apsmgr.bo.BomBo;
import com.apsmgr.service.BomService;
import com.sun.javafx.collections.MappingChange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author hyh
 */
@Controller
@RequestMapping("/bom")
public class BomCtrl extends BaseCtrl {

    @Autowired
    private BomService bomService;

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insertBom(BomBo bomBo) {
        bomService.insert(bomBo);
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public void selectAll(HttpServletResponse response) throws Exception {
        List<BomBo> boList;
        boList = bomService.selectAllBom();
        write(response, JSON.toJSONString(boList));
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateBom(BomBo bomBo, HttpServletResponse response) throws Exception {
        bomService.updateByPrimaryKey(bomBo);
        return;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public  void deleteBatch(@RequestParam("list") List<String> bomNoList) {
        bomService.deleteBatch(bomNoList);
    }
}
