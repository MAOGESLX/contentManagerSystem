package com.yxb.cms.dao;

import com.yxb.cms.domain.vo.DbTaskManager;

import java.util.List;

public interface DbTaskManagerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_task_manager
     *
     * @mbggenerated Thu May 07 11:47:20 CST 2020
     */
    int deleteByPrimaryKey(String taskId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_task_manager
     *
     * @mbggenerated Thu May 07 11:47:20 CST 2020
     */
    int insert(DbTaskManager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_task_manager
     *
     * @mbggenerated Thu May 07 11:47:20 CST 2020
     */
    int insertSelective(DbTaskManager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_task_manager
     *
     * @mbggenerated Thu May 07 11:47:20 CST 2020
     */
    DbTaskManager selectByPrimaryKey(String taskId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_task_manager
     *
     * @mbggenerated Thu May 07 11:47:20 CST 2020
     */
    int updateByPrimaryKeySelective(DbTaskManager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_task_manager
     *
     * @mbggenerated Thu May 07 11:47:20 CST 2020
     */
    int updateByPrimaryKey(DbTaskManager record);


    /**
     * 查询任务总记录数
     * @return
     */
    Long selectTaskManagerCount(DbTaskManager taskManager);

    /**
     * 任务信息分页展示
     * @return
     */
    List<DbTaskManager> selectTaskManagerListByPage(DbTaskManager taskManager);




}