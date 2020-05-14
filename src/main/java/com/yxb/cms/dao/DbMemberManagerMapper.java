package com.yxb.cms.dao;

import com.yxb.cms.domain.vo.DbMemberManager;

import java.util.List;

public interface DbMemberManagerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_member_manager
     *
     * @mbggenerated Thu May 14 17:18:28 CST 2020
     */
    int deleteByPrimaryKey(String memberId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_member_manager
     *
     * @mbggenerated Thu May 14 17:18:28 CST 2020
     */
    int insert(DbMemberManager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_member_manager
     *
     * @mbggenerated Thu May 14 17:18:28 CST 2020
     */
    int insertSelective(DbMemberManager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_member_manager
     *
     * @mbggenerated Thu May 14 17:18:28 CST 2020
     */
    DbMemberManager selectByPrimaryKey(String memberId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_member_manager
     *
     * @mbggenerated Thu May 14 17:18:28 CST 2020
     */
    int updateByPrimaryKeySelective(DbMemberManager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_member_manager
     *
     * @mbggenerated Thu May 14 17:18:28 CST 2020
     */
    int updateByPrimaryKey(DbMemberManager record);

    /**
     * 查询项目成员总记录数
     * @return
     */
    Long selectMemberManagerCount(DbMemberManager memberManager);

    /**
     * 项目成员信息分页展示
     * @return
     */
    List<DbMemberManager> selectMemberManagerListByPage(DbMemberManager memberManager);



}