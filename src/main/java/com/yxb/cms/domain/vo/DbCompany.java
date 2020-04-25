package com.yxb.cms.domain.vo;

import com.yxb.cms.domain.dto.PageDto;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

public class DbCompany extends PageDto implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.company_id
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private String companyId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.company_name
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private String companyName;


    @Getter @Setter
    private String companyEnglish;

    @Getter @Setter
    private String companyUrl;


    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.company_status
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private Integer companyStatus;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.company_nature
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private Integer companyNature;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.company_principal
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private String companyPrincipal;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.company_tel
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private String companyTel;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.company_mail
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private String companyMail;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.established_time
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private String establishedTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.company_address
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private String companyAddress;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.company_remark
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private String companyRemark;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.creater_user_id
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private String createrUserId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.creater_time
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private Date createrTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.modifier_user_id
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private String modifierUserId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column db_company.modifier_time
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    private Date modifierTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.company_id
     *
     * @return the value of db_company.company_id
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public String getCompanyId() {
        return companyId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.company_id
     *
     * @param companyId the value for db_company.company_id
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCompanyId(String companyId) {
        this.companyId = companyId == null ? null : companyId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.company_name
     *
     * @return the value of db_company.company_name
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public String getCompanyName() {
        return companyName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.company_name
     *
     * @param companyName the value for db_company.company_name
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.company_status
     *
     * @return the value of db_company.company_status
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public Integer getCompanyStatus() {
        return companyStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.company_status
     *
     * @param companyStatus the value for db_company.company_status
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCompanyStatus(Integer companyStatus) {
        this.companyStatus = companyStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.company_nature
     *
     * @return the value of db_company.company_nature
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public Integer getCompanyNature() {
        return companyNature;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.company_nature
     *
     * @param companyNature the value for db_company.company_nature
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCompanyNature(Integer companyNature) {
        this.companyNature = companyNature;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.company_principal
     *
     * @return the value of db_company.company_principal
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public String getCompanyPrincipal() {
        return companyPrincipal;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.company_principal
     *
     * @param companyPrincipal the value for db_company.company_principal
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCompanyPrincipal(String companyPrincipal) {
        this.companyPrincipal = companyPrincipal == null ? null : companyPrincipal.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.company_tel
     *
     * @return the value of db_company.company_tel
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public String getCompanyTel() {
        return companyTel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.company_tel
     *
     * @param companyTel the value for db_company.company_tel
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCompanyTel(String companyTel) {
        this.companyTel = companyTel == null ? null : companyTel.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.company_mail
     *
     * @return the value of db_company.company_mail
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public String getCompanyMail() {
        return companyMail;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.company_mail
     *
     * @param companyMail the value for db_company.company_mail
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCompanyMail(String companyMail) {
        this.companyMail = companyMail == null ? null : companyMail.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.established_time
     *
     * @return the value of db_company.established_time
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public String getEstablishedTime() {
        return establishedTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.established_time
     *
     * @param establishedTime the value for db_company.established_time
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setEstablishedTime(String establishedTime) {
        this.establishedTime = establishedTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.company_address
     *
     * @return the value of db_company.company_address
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public String getCompanyAddress() {
        return companyAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.company_address
     *
     * @param companyAddress the value for db_company.company_address
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress == null ? null : companyAddress.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.company_remark
     *
     * @return the value of db_company.company_remark
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public String getCompanyRemark() {
        return companyRemark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.company_remark
     *
     * @param companyRemark the value for db_company.company_remark
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCompanyRemark(String companyRemark) {
        this.companyRemark = companyRemark == null ? null : companyRemark.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.creater_user_id
     *
     * @return the value of db_company.creater_user_id
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public String getCreaterUserId() {
        return createrUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.creater_user_id
     *
     * @param createrUserId the value for db_company.creater_user_id
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCreaterUserId(String createrUserId) {
        this.createrUserId = createrUserId == null ? null : createrUserId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.creater_time
     *
     * @return the value of db_company.creater_time
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public Date getCreaterTime() {
        return createrTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.creater_time
     *
     * @param createrTime the value for db_company.creater_time
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setCreaterTime(Date createrTime) {
        this.createrTime = createrTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.modifier_user_id
     *
     * @return the value of db_company.modifier_user_id
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public String getModifierUserId() {
        return modifierUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.modifier_user_id
     *
     * @param modifierUserId the value for db_company.modifier_user_id
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setModifierUserId(String modifierUserId) {
        this.modifierUserId = modifierUserId == null ? null : modifierUserId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column db_company.modifier_time
     *
     * @return the value of db_company.modifier_time
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public Date getModifierTime() {
        return modifierTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column db_company.modifier_time
     *
     * @param modifierTime the value for db_company.modifier_time
     *
     * @mbggenerated Fri Apr 24 22:46:48 CST 2020
     */
    public void setModifierTime(Date modifierTime) {
        this.modifierTime = modifierTime;
    }


    public String getCompanyNatureLable(){
        if(this.getCompanyNature() != null){
            if(this.getCompanyNature() == 1){
                return "国有企业";
            }else if(this.getCompanyNature() == 2) {
                return "集体企业";
            }else if(this.getCompanyNature() == 3) {
                return "联营企业";
            }else if(this.getCompanyNature() == 4) {
                return "股份合作制企业";
            }else if(this.getCompanyNature() == 5) {
                return "私营企业";
            }else if(this.getCompanyNature() == 6) {
                return "个体户";
            }else if(this.getCompanyNature() == 7) {
                return "合伙企业";
            }else if(this.getCompanyNature() == 8) {
                return "有限责任公司";
            }else if(this.getCompanyNature() == 9) {
                return "股份有限公司";
            }else {
                return "";
            }
        }else{
            return "";
        }

    }
}