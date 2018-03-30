package com.apsmgr.controller;



import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.SocketException;

/**
 * 类名称：BaseCtrl
 * 类描述：
 * 修改备注：
 * @author hyh
 */
public class BaseCtrl {

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

}
