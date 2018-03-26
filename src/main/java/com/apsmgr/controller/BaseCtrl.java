package com.apsmgr.controller;



import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.SocketException;

/**
 * 类名称：BaseCtrl
 * 类描述：
 * 创建人：hyh
 * 修改备注：
 */
public class BaseCtrl {
//
//    @Autowired
//    private SystemLogOptService systemLogOptService;
//
//    @Autowired
//    private SystemPowerService systemPowerService;

    protected void write(HttpServletResponse response, String string)
            throws Exception {
        response.setHeader("Content-Type", "application/json;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");

        byte[] b = string.getBytes("utf-8");
        response.setContentLength(b.length);
        response.getOutputStream().write(b);
        response.flushBuffer();
    }

    protected void writeJsonP(HttpServletResponse response, String callback,
                              String content) throws Exception {
        if (callback != null && callback.trim().length() > 0) {
            content = callback + "&&" + callback + "(" + content + ");";
        }

        response.setHeader("Content-Type", "application/json;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");

        byte[] b = content.getBytes("utf-8");
        response.setContentLength(b.length);
        response.getOutputStream().write(b);
    }

    protected void log(HttpSession session, String menu_url) throws SocketException {
//        Object object = session.getAttribute(SessionKeyConst.USER_INFO);
//        SystemUserBo userBo = new SystemUserBo();
//        SystemLogOptBo logBo = new SystemLogOptBo();
//        SystemPowerBo powerBo = systemPowerService.selectByUrl(menu_url);
//        if (object != null) {
//            userBo = (SystemUserBo) object;
//        }
//        if (!CommonUtil.isEmpty(userBo.getUser_no())) {
//            logBo.setUser_no(userBo.getUser_no());
//        }
//        if (!CommonUtil.isEmpty(userBo.getUser_name())) {
//            logBo.setUser_name(userBo.getUser_name());
//        }
//        if (!CommonUtil.isEmpty(powerBo.getMenu_name())) {
//            logBo.setInfo(powerBo.getMenu_name());
//        }
//        logBo.setDevice_no(CommonUtil.getLocalIp());
//        systemLogOptService.insert(logBo);
    }
}
