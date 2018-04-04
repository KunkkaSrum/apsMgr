package com.apsmgr.controller;

import com.alibaba.fastjson.JSON;
import com.apsmgr.bo.UserRoleBo;
import com.apsmgr.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class UserRoleCtrl extends BaseCtrl  {

    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
    public void selectAllUserRole(HttpServletResponse response) throws Exception {
        List<UserRoleBo> userRoleBos = userRoleService.selectUserRoleAll();
        Map<String, Object> objectMap = new HashMap<String, Object>(16);
        objectMap.put("code", 0);
        objectMap.put("msg", "用户集合");
        objectMap.put("count", userRoleBos.size());
        objectMap.put("data", userRoleBos);
        write(response, JSON.toJSONString(objectMap));
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(UserRoleBo userRoleBo) {
        int t= userRoleService.update(userRoleBo);
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insert(UserRoleBo userRoleBo) {
        int t= userRoleService.insert(userRoleBo);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(String userRoleNo) {
        int t=userRoleService.delete(userRoleNo);
    }
}
