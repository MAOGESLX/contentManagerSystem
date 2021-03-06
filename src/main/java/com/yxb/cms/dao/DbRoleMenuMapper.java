package com.yxb.cms.dao;

import com.yxb.cms.domain.vo.DbRoleMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DbRoleMenuMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_role_menu
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    int deleteByPrimaryKey(String roleMenuId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_role_menu
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    int insert(DbRoleMenu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_role_menu
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    int insertSelective(DbRoleMenu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_role_menu
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    DbRoleMenu selectByPrimaryKey(String roleMenuId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_role_menu
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    int updateByPrimaryKeySelective(DbRoleMenu record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_role_menu
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    int updateByPrimaryKey(DbRoleMenu record);

    /**
     * 根据roleId查询角色菜单信息
     * @param roleId 角色Id
     * @return
     */
    List<DbRoleMenu> selectRoleMenuByRoleId(String roleId);

    /**
     * 根据角色Id删除角色资源信息
     * @param roleId 角色Id
     */
    void deleteRoleMenuByRoleId(@Param("roleId") String roleId);


}