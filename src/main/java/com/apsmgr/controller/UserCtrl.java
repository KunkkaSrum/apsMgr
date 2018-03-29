package com.apsmgr.controller;

import com.alibaba.fastjson.JSON;
import com.apsmgr.service.UserService;
import com.apsmgr.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author hyh
 */
@Controller
public class UserCtrl extends BaseCtrl {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/update", method = RequestMethod.GET)
    public String updateUser()  {
        String a = "a";
        ModelAndView mo = new ModelAndView();
        mo.addObject("asd", a);
        return "table/bom";
    }
}
