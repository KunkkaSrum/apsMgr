package com.apsmgr.controller;


import com.alibaba.fastjson.JSON;
import com.apsmgr.bo.ResourceBo;
import com.apsmgr.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/resource")
public class ResourceCtrl extends BaseCtrl {

    @Autowired
    private ResourceService resourceService;

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insertResource(ResourceBo resourceBo) {
        resourceService.insert(resourceBo);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void deleteBatchResource(@RequestParam("list")List<String> resourceNoList) {
        int result = resourceService.deleteBatch(resourceNoList);
        return;
    }

    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
    public void selectAllResource(HttpServletResponse response) throws Exception {
        List<ResourceBo> resourceBoList = resourceService.selectAllResource();
        write(response, JSON.toJSONString(resourceBoList));
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateResource(ResourceBo resourceBo, HttpServletResponse response) throws Exception {
        resourceService.update(resourceBo);
        return;
    }
}
