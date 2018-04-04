package com.apsmgr.controller;

import com.alibaba.fastjson.JSON;
import com.apsmgr.bo.UserBo;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author hyh
 */
@Controller
@RequestMapping("/user")
public class UserCtrl extends BaseCtrl {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
    public void selectAllUser(HttpServletResponse response) throws Exception {
        List<UserBo> userBos = userService.selectUserAll();
        Map<String, Object> objectMap = new HashMap<String, Object>(16);
        objectMap.put("code", 0);
        objectMap.put("msg", "用户集合");
        objectMap.put("count", userBos.size());
        objectMap.put("data", userBos);
        write(response, JSON.toJSONString(objectMap));
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(UserBo userBo) {
        int t= userService.update(userBo);
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insert(UserBo userBo) {
        int t= userService.insert(userBo);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(String userNo) {
        int t=userService.delete(userNo);
    }
}
