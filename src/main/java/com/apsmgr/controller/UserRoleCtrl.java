package com.apsmgr.controller;

import com.alibaba.fastjson.JSON;
import com.apsmgr.bo.RoleResourceBo;
import com.apsmgr.bo.UserRoleBo;
import com.apsmgr.service.UserResourceService;
import com.apsmgr.service.UserRoleService;
import com.apsmgr.vo.UserRoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class UserRoleCtrl extends BaseCtrl {

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private UserResourceService userResourceService;

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
        int t = userRoleService.update(userRoleBo);
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insert( HttpServletRequest request) {
        String str = request.getParameter("resourceNoList");
        String[] list = str.split(",");
        UserRoleVo userRoleVo = new UserRoleVo();
        userRoleVo.setRoleNo(request.getParameter("roleNo"));
        userRoleVo.setRoleName(request.getParameter("roleName"));
        int t = userRoleService.insert(userRoleVo,list);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(HttpServletRequest request) {
        int t = userRoleService.delete(request.getParameter("roleNo"));
    }


    @RequestMapping(value = "/updateRoleResource", method = RequestMethod.POST)
    public void updateRoleResource(HttpServletRequest request) {
        RoleResourceBo roleResourceBo = new RoleResourceBo();
        String roleNo = request.getParameter("roleNo");
        String[] resourceNos = request.getParameter("resourceNoList").split(",");
        userRoleService.updateRoleResource(roleNo, resourceNos);
    }

}
