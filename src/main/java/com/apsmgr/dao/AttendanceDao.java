package com.apsmgr.dao;

import com.apsmgr.bo.AttendanceBo;

import java.util.List;

public interface AttendanceDao {

    int deleteBatch(List<String> attendanceNoList);

    int insert(AttendanceBo attendanceBo);

    int updateByPrimaryKey(AttendanceBo attendanceBo);

    List<AttendanceBo> selectAllAttendance();

    int deleteByPrimaryKey(Long id);

    int insertSelective(AttendanceBo record);

    AttendanceBo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AttendanceBo record);

}