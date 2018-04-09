package com.apsmgr.controller;

import com.alibaba.fastjson.JSON;
import com.apsmgr.bo.UserBo;
import com.apsmgr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

@Controller
public class LoginCtrl  extends BaseCtrl{
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public void Login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> map = new HashMap<String,Object>(16);
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        UserBo userBo = userService.selectByName(userName);
        if(userBo == null) {
            map.put("code", 0);
            map.put("msg", "用户名不存在！");
        } else if(!password.equals(userBo.getPassword())){
            map.put("code", 0);
            map.put("msg", "密码错误！");
        } else {
            map.put("code", 1);
            map.put("msg", "登录成功！");
        }
        write(response, JSON.toJSONString(map));
    }
}
