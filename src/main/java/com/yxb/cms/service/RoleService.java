package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.DbIdUtil;
import com.yxb.cms.dao.DbRoleMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbRole;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色管理服务
 * @author yangxiaobing
 */
@Service
@Log4j2
public class RoleService {




    @Autowired
    private DbRoleMapper roleMapper;


    /**
     * 角色信息分页展示列表
     *
     * @param role 角色信息对象
     * @return
     */
    public Map<String, Object> selectRoleListByPage(DbRole role) {

        Map<String, Object> map = new HashMap<String, Object>();
        try {
            List<DbRole> roleList = roleMapper.selectRoleListByPage(role);
            Long count = roleMapper.selectRoleCount(role);

            map.put("code", 200);
            map.put("msg", "");
            map.put("count", count);
            map.put("data", roleList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            map.put("code", 500);
            map.put("msg", "角色信息查询异常");
            throw e;
        }
        return map;

    }


    /**
     * 保存角色信息
     *
     * @param role 角色对象
     * @return
     */
    @Transactional
    public BussinessMsg saveOrUpdateRole(DbRole role) {
        log.info("保存用户角色开始");
        long start = System.currentTimeMillis();
        try {
            //验证角色名称唯一性
            Long checkRoleName = roleMapper.selectRoleNameCheck(role.getRoleName(), role.getRoleId());
            if (checkRoleName.intValue() > 0) {
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.ROLE_NAME_EXIST);
            }
            //保存角色信息
            if (StringUtils.isEmpty(role.getRoleId())) {
                role.setRoleId(DbIdUtil.generate());
                role.setRoleStatus(BusinessConstants.STATUS_1.getCode());
                Integer orderNo = roleMapper.selectRoleMaxOrderNo();
                if (null != orderNo) {
                    role.setOrderNo(orderNo + 1);
                } else {
                    role.setOrderNo(1);
                }
                roleMapper.insertSelective(role);
            } else {
                roleMapper.updateByPrimaryKeySelective(role);
            }
        } catch (Exception e) {
            log.error("保存角色方法内部错误{}", e.getMessage(), e);
            throw e;
        } finally {
            log.info("保存角色信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
    }
}
