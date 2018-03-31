package com.apsmgr.service;

import com.apsmgr.bo.AttendanceBo;
import java.util.List;

public interface AttendanceService {

    List<AttendanceBo> selectAllAttendance();

    int updateByPrimaryKey(AttendanceBo attendanceBo);

    int insert(AttendanceBo attendanceBo);

    int deleteBatch(List<String> attendanceNoList);
}
