package com.yxb.cms.domain.vo;

import java.util.Date;

public class DbMemberManager {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.member_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private String memberId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.project_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private String projectId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.project_name
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private String projectName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.employee_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private String employeeId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.employee_name
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private String employeeName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.member_role
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private Integer memberRole;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.member_status
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private Integer memberStatus;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.creater_user_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private String createrUserId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.creater_time
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private Date createrTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.modifier_user_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private String modifierUserId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_member_manager.modifier_time
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    private Date modifierTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.member_id
     *
     * @return the value of db_member_manager.member_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public String getMemberId() {
        return memberId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.member_id
     *
     * @param memberId the value for db_member_manager.member_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setMemberId(String memberId) {
        this.memberId = memberId == null ? null : memberId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.project_id
     *
     * @return the value of db_member_manager.project_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public String getProjectId() {
        return projectId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.project_id
     *
     * @param projectId the value for db_member_manager.project_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.project_name
     *
     * @return the value of db_member_manager.project_name
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public String getProjectName() {
        return projectName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.project_name
     *
     * @param projectName the value for db_member_manager.project_name
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.employee_id
     *
     * @return the value of db_member_manager.employee_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public String getEmployeeId() {
        return employeeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.employee_id
     *
     * @param employeeId the value for db_member_manager.employee_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId == null ? null : employeeId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.employee_name
     *
     * @return the value of db_member_manager.employee_name
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public String getEmployeeName() {
        return employeeName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.employee_name
     *
     * @param employeeName the value for db_member_manager.employee_name
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName == null ? null : employeeName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.member_role
     *
     * @return the value of db_member_manager.member_role
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public Integer getMemberRole() {
        return memberRole;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.member_role
     *
     * @param memberRole the value for db_member_manager.member_role
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setMemberRole(Integer memberRole) {
        this.memberRole = memberRole;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.member_status
     *
     * @return the value of db_member_manager.member_status
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public Integer getMemberStatus() {
        return memberStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.member_status
     *
     * @param memberStatus the value for db_member_manager.member_status
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setMemberStatus(Integer memberStatus) {
        this.memberStatus = memberStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.creater_user_id
     *
     * @return the value of db_member_manager.creater_user_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public String getCreaterUserId() {
        return createrUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.creater_user_id
     *
     * @param createrUserId the value for db_member_manager.creater_user_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setCreaterUserId(String createrUserId) {
        this.createrUserId = createrUserId == null ? null : createrUserId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.creater_time
     *
     * @return the value of db_member_manager.creater_time
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public Date getCreaterTime() {
        return createrTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.creater_time
     *
     * @param createrTime the value for db_member_manager.creater_time
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setCreaterTime(Date createrTime) {
        this.createrTime = createrTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.modifier_user_id
     *
     * @return the value of db_member_manager.modifier_user_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public String getModifierUserId() {
        return modifierUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.modifier_user_id
     *
     * @param modifierUserId the value for db_member_manager.modifier_user_id
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setModifierUserId(String modifierUserId) {
        this.modifierUserId = modifierUserId == null ? null : modifierUserId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_member_manager.modifier_time
     *
     * @return the value of db_member_manager.modifier_time
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public Date getModifierTime() {
        return modifierTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_member_manager.modifier_time
     *
     * @param modifierTime the value for db_member_manager.modifier_time
     *
     * @mbggenerated Wed May 06 18:04:32 CST 2020
     */
    public void setModifierTime(Date modifierTime) {
        this.modifierTime = modifierTime;
    }
}