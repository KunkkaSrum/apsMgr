package com.apsmgr.service;

import com.apsmgr.bo.UserResourceBo;

import java.util.List;

public interface UserResourceService {
    List<UserResourceBo> selectUserResourceAll();

    int insert(UserResourceBo userResourceBo);

    int update(UserResourceBo userResourceBo);

    int delete(String userResourceNo);
}
