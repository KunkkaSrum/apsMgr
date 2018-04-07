package com.apsmgr.controller;

import com.alibaba.fastjson.JSON;
import com.apsmgr.bo.UserResourceBo;
import com.apsmgr.service.UserResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userResource")
public class UserResourceCtrl extends BaseCtrl  {
    @Autowired
    private UserResourceService userResourceService;

//    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
//    public void selectAllUserResource(HttpServletResponse response) throws Exception {
//        List<UserResourceBo> userResourceBos = userResourceService.selectUserResourceAll();
//        Map<String, Object> objectMap = new HashMap<String, Object>(16);
//        objectMap.put("code", 0);
//        objectMap.put("msg", "用户集合");
//        objectMap.put("count", userResourceBos.size());
//        objectMap.put("data", userResourceBos);
//        write(response, JSON.toJSONString(objectMap));
//    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(UserResourceBo userResourceBo) {
        int t= userResourceService.update(userResourceBo);
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insert(UserResourceBo userResourceBo) {
        int t= userResourceService.insert(userResourceBo);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(String userResourceNo) {
        int t=userResourceService.delete(userResourceNo);
    }

    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
    public void selectUserRole(HttpServletResponse response) throws Exception {
        List<UserResourceBo> userResourceBos = userResourceService.selectUserResourceAll();
        Map<String, Object> objectMap = new HashMap<String, Object>(16);
        Map<String, Object> childrenData = new HashMap<String, Object>(16);
        for (UserResourceBo userResourceBo : userResourceBos
                ) {
            childrenData.put("name", userResourceBo.getResourceText());
            childrenData.put("resourceNo", userResourceBo.getResourceNo());
        }
        objectMap.put("name", "权限列表");
        objectMap.put("open", true);
        objectMap.put("children", childrenData);
        write(response, JSON.toJSONString(userResourceBos));
    }
}
