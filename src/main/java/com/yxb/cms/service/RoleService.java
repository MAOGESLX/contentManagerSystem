package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.DbIdUtil;
import com.yxb.cms.dao.DbRoleMapper;
import com.yxb.cms.dao.DbRoleMenuMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbRole;
import com.yxb.cms.domain.vo.DbRoleMenu;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 角色管理服务
 *
 * @author yangxiaobing
 */
@Service
@Log4j2
public class RoleService {


    @Autowired
    private DbRoleMapper roleMapper;

    @Autowired
    private DbRoleMenuMapper roleMenuMapper;


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


    /**
     * 保存角色信息授权信息
     *
     * @param roleId  角色Id
     * @param menuIds 资源Id数组
     * @return
     */
    @Transactional
    public BussinessMsg saveOrUpdateRoleMenu(String roleId, String[] menuIds) {
        log.info("保存角色授权信息开始,参数,roleId:" + roleId + ",menuIds:" + Arrays.toString(menuIds));
        long start = System.currentTimeMillis();
        try {
            if (null != menuIds && menuIds.length > 0) {

                List<DbRoleMenu> roleNotMenus = roleMenuMapper.selectRoleMenuByRoleId(roleId);
                if (null != roleNotMenus && !roleNotMenus.isEmpty()) {
                    for (DbRoleMenu roleMenu : roleNotMenus) {
                        roleMenuMapper.deleteByPrimaryKey(roleMenu.getRoleMenuId());
                    }
                }
                for (String menuId : menuIds) {
                    //保存角色菜单信息
                    DbRoleMenu roleMenu = new DbRoleMenu();
                    roleMenu.setRoleMenuId(DbIdUtil.generate());
                    roleMenu.setFkRoleId(roleId);
                    roleMenu.setFkMenuInfoId(menuId);

                    roleMenuMapper.insertSelective(roleMenu);
                }

            } else {   //如果资源Id为空，则清空当前角色所有的菜单资源信息
                roleMenuMapper.deleteRoleMenuByRoleId(roleId);
            }

        } catch (Exception e) {
            log.error("保存角色信息授权信息方法内部错误{}", e.getMessage(), e);
            throw e;
        } finally {
            log.info("保存角色信息授权信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
    }


    /**
     * 根据roleId查询角色资源信息
     *
     * @param roleId 角色Id
     * @return
     */
    public String selectRoleMenuByRoleId(String roleId) {
        List<DbRoleMenu> roleMenus = roleMenuMapper.selectRoleMenuByRoleId(roleId);
        if (null != roleMenus && !roleMenus.isEmpty()) {
            return roleMenus.stream().map(DbRoleMenu::getFkMenuInfoId).collect(Collectors.joining(","));
        }
        return "";
    }
}
