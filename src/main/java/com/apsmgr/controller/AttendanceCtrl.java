package com.apsmgr.controller;


import com.alibaba.fastjson.JSON;
import com.apsmgr.bo.AttendanceBo;
import com.apsmgr.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/attendance")
public class AttendanceCtrl extends BaseCtrl {

    @Autowired
    private AttendanceService attendanceService;

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insertAttendance(AttendanceBo attendanceBo) {
        int result = attendanceService.insert(attendanceBo);
        return;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void deleteBatchAttendance(@RequestParam("list") List<String> attendanceNoList) {
        int result = attendanceService.deleteBatch(attendanceNoList);
        return;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void updateAttendace(AttendanceBo attendanceBo, HttpServletResponse response) throws Exception {
        attendanceService.updateByPrimaryKey(attendanceBo);
        return;
    }

    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
    public void selectAllAttendance(HttpServletResponse response) throws Exception {
        List<AttendanceBo> attendanceBoList = attendanceService.selectAllAttendance();
        write(response, JSON.toJSONString(attendanceBoList));
    }
}
