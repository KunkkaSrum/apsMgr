package com.apsmgr.service.impl;

import com.apsmgr.bo.AttendanceBo;
import com.apsmgr.dao.AttendanceDao;
import com.apsmgr.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendanceServiceImpl implements AttendanceService {

    @Autowired
    private AttendanceDao attendanceDao;

    @Override
    public List<AttendanceBo> selectAllAttendance() {
        return attendanceDao.selectAllAttendance();
    }

    @Override
    public int updateByPrimaryKey(AttendanceBo attendanceBo) {
        return attendanceDao.updateByPrimaryKey(attendanceBo);
    }

    @Override
    public int insert(AttendanceBo attendanceBo) {
        return attendanceDao.insert(attendanceBo);
    }

    @Override
    public int deleteBatch(List<String> attendanceNoList) {
        return attendanceDao.deleteBatch(attendanceNoList);
    }
}
