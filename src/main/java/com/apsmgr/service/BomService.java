package com.apsmgr.service;

import com.apsmgr.bo.BomBo;
import java.util.List;

/**
 * @author hyh
 */
public interface BomService {

    List<BomBo> selectAllBom();

    int updateByPrimaryKey(BomBo bomBo);

    int insert(BomBo bomBo);

    int deleteBatch(List<String> bomNolist);
}
