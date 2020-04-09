package com.yxb.cms.domain.vo;

public class DbUserRole {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_user_role.user_role_id
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    private String userRoleId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_user_role.fk_user_id
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    private String fkUserId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_user_role.fk_role_id
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    private String fkRoleId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_user_role.user_role_id
     *
     * @return the value of db_user_role.user_role_id
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    public String getUserRoleId() {
        return userRoleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_user_role.user_role_id
     *
     * @param userRoleId the value for db_user_role.user_role_id
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    public void setUserRoleId(String userRoleId) {
        this.userRoleId = userRoleId == null ? null : userRoleId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_user_role.fk_user_id
     *
     * @return the value of db_user_role.fk_user_id
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    public String getFkUserId() {
        return fkUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_user_role.fk_user_id
     *
     * @param fkUserId the value for db_user_role.fk_user_id
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    public void setFkUserId(String fkUserId) {
        this.fkUserId = fkUserId == null ? null : fkUserId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_user_role.fk_role_id
     *
     * @return the value of db_user_role.fk_role_id
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    public String getFkRoleId() {
        return fkRoleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_user_role.fk_role_id
     *
     * @param fkRoleId the value for db_user_role.fk_role_id
     *
     * @mbggenerated Thu Apr 09 18:03:43 CST 2020
     */
    public void setFkRoleId(String fkRoleId) {
        this.fkRoleId = fkRoleId == null ? null : fkRoleId.trim();
    }
}