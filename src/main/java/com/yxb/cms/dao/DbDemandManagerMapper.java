package com.yxb.cms.dao;

import com.yxb.cms.domain.vo.DbDemandManager;

public interface DbDemandManagerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_demand_manager
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    int deleteByPrimaryKey(String demandId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_demand_manager
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    int insert(DbDemandManager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_demand_manager
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    int insertSelective(DbDemandManager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_demand_manager
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    DbDemandManager selectByPrimaryKey(String demandId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_demand_manager
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    int updateByPrimaryKeySelective(DbDemandManager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_demand_manager
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    int updateByPrimaryKey(DbDemandManager record);
}