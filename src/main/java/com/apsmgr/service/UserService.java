package com.apsmgr.service;

import com.apsmgr.bo.UserBo;

import java.util.List;

/**
 * @author hyh
 */
public interface UserService {

    List<UserBo> selectUserAll();

    int insert(UserBo userBo);

    int update(UserBo userBo);

    int delete(String userNo);

}
