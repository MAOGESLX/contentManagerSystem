package com.yxb.cms.dao;

import com.yxb.cms.domain.vo.DbMenuInfo;

public interface DbMenuInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_menu_info
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    int deleteByPrimaryKey(String menuInfoId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_menu_info
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    int insert(DbMenuInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_menu_info
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    int insertSelective(DbMenuInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_menu_info
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    DbMenuInfo selectByPrimaryKey(String menuInfoId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_menu_info
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    int updateByPrimaryKeySelective(DbMenuInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_menu_info
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    int updateByPrimaryKey(DbMenuInfo record);
}