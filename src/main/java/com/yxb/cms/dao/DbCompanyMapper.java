package com.yxb.cms.dao;

import com.yxb.cms.domain.vo.DbCompany;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DbCompanyMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_company
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    int deleteByPrimaryKey(String companyId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_company
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    int insert(DbCompany record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_company
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    int insertSelective(DbCompany record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_company
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    DbCompany selectByPrimaryKey(String companyId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_company
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    int updateByPrimaryKeySelective(DbCompany record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table db_company
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    int updateByPrimaryKey(DbCompany record);


    /**
     * 查询公司总记录数
     * @param company 用户对象
     * @return
     */
    Long selectCompanyCount(DbCompany company);

    /**
     * 公司信息分页展示
     * @param company
     * @return
     */
    List<DbCompany> selectCompanyListByPage(DbCompany company);


    /**
     * 验证公司名称唯一性
     * @return
     */
    Long selectCompanyNameCheck(@Param("companyName") String companyName, @Param("companyId") String companyId);




}