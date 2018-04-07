package com.apsmgr.service.impl;

import com.apsmgr.bo.RoleResourceBo;
import com.apsmgr.bo.UserRoleBo;
import com.apsmgr.dao.RoleResourceDao;
import com.apsmgr.dao.UserRoleDao;
import com.apsmgr.service.UserRoleService;
import com.apsmgr.vo.UserRoleVo;
import com.sun.org.apache.xpath.internal.SourceTree;
import org.apache.poi.util.SystemOutLogger;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleDao userRoleDao;

    @Autowired
    private RoleResourceDao roleResourceDao;

    @Override
    public List<UserRoleBo> selectUserRoleAll() {
        return userRoleDao.selectAll();
    }



    @Override
    public int insert(UserRoleVo userRoleVo, String[] roleResourceNoList) {
        UserRoleBo userRoleBo = new UserRoleBo();
        userRoleBo.setRoleName(userRoleVo.getRoleName());
        userRoleBo.setRoleNo(userRoleVo.getRoleNo());
        userRoleBo.setRoleStatus(1);
        userRoleDao.insert(userRoleBo);
        List<RoleResourceBo> roleResourceBoList =new ArrayList<RoleResourceBo>();
        for (int i = 0; i < roleResourceNoList.length; i++) {
            RoleResourceBo roleResourceBo = new RoleResourceBo();
            roleResourceBo.setResourceNo(roleResourceNoList[i]);
            System.out.print(roleResourceNoList[i]);
            roleResourceBo.setRoleNo(userRoleVo.getRoleNo());
            roleResourceBoList.add(roleResourceBo);
        }
        int t = roleResourceDao.insertList(roleResourceBoList);
        return t;
    }


    @Override
    public int update(UserRoleBo userRoleBo) {
        return userRoleDao.updateByPrimaryKeySelective(userRoleBo);

    }

    @Override
    public int delete(String userRoleNo) {
        return userRoleDao.deleteByPrimaryKey(userRoleNo);
    }

    @Override
    public int updateRoleResource(String roleNo, String[] resourceNos) {
        roleResourceDao.deleteBatch(roleNo);
        List<RoleResourceBo> roleResourceBos = new ArrayList<RoleResourceBo>();
        for (String resourceNo: resourceNos
             ) {
            RoleResourceBo roleResourceBo = new RoleResourceBo();
            roleResourceBo.setRoleNo(roleNo);
            roleResourceBo.setResourceNo(resourceNo);
            roleResourceBos.add(roleResourceBo);
        }
        return roleResourceDao.insertList(roleResourceBos);
    }


    @Override
    public List<RoleResourceBo> selectUserRole() {
        return roleResourceDao.selectAll();
    }


//    private void insertList(List<RoleResourceBo> roleResourceBos) {
//
//    }

}
