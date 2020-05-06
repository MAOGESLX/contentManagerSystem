package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.DbIdUtil;
import com.yxb.cms.dao.DbCompanyMapper;
import com.yxb.cms.dao.DbDepartmentMapper;
import com.yxb.cms.dao.DbProjectMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbCompany;
import com.yxb.cms.domain.vo.DbDepartment;
import com.yxb.cms.domain.vo.DbProject;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目管理服务
 * @author YXB
 */
@Service
@Log4j2
public class ProjectService {


    @Autowired
    private DbProjectMapper projectMapper;

    @Autowired
    private DbCompanyMapper companyMapper;

    @Autowired
    private DbDepartmentMapper dbDepartmentMapper;

    /**
     * 项目信息分页展示列表
     *
     * @return
     */
    public Map<String, Object> selectProjectListByPage(DbProject project) {

        Map<String, Object> map = new HashMap<>();
        try {

            List<DbProject> projectList = projectMapper.selectProjectListByPage(project);

            Long count = projectMapper.selectProjectCount(project);
            map.put("code", 200);
            map.put("msg", "获取信息成功");
            map.put("count", count);
            map.put("data", projectList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            map.put("code", 500);
            map.put("msg", "项目信息查询异常");
        }
        return map;
    }



    /**
     * 保存修改项目信息
     * @return
     */
    public BussinessMsg saveOrUpdateProject(DbProject project, String userId) {
        log.info("保存项目信息开始");
        long start = System.currentTimeMillis();
        try {

            //TODO 判断项目名称不能重复

            //验证公司是否存在
            DbCompany company =companyMapper.selectByPrimaryKeyByStatus(project.getCompanyId());
            if(company == null){
                log.error("项目信息保存失败，公司信息为空");
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.COMPANY_IS_NULL);
            }
            //验证部门是否存在
            DbDepartment dbDepartment = dbDepartmentMapper.selectByPrimaryKeyByStatus(project.getDepartmentId());
            if(dbDepartment == null){
                log.error("项目信息保存失败，部门信息为空");
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.DEPARTMENT_IS_NULL);
            }


            //保存项目信息
            if(StringUtils.isEmpty(project.getProjectId())){

                project.setProjectId(DbIdUtil.generate());
                //公司信息
                project.setCompanyId(company.getCompanyId());
                project.setCompanyName(company.getCompanyName());

                //部门信息
                project.setDepartmentId(dbDepartment.getDepartmentId());
                project.setDepartmentName(dbDepartment.getDepartmentName());

                project.setProjectStatus(BusinessConstants.PROJECT_STATUS_1.getCode());
                project.setCreaterUserId(userId);
                project.setCreaterTime(new Date());
                projectMapper.insertSelective(project);

            }else{

                //公司信息
                project.setCompanyId(company.getCompanyId());
                project.setCompanyName(company.getCompanyName());

                //部门信息
                project.setDepartmentId(dbDepartment.getDepartmentId());
                project.setDepartmentName(dbDepartment.getDepartmentName());

                project.setModifierTime(new Date());
                project.setModifierUserId(userId);
                projectMapper.updateByPrimaryKeySelective(project);
            }
        } catch (Exception e) {
            log.error("保存项目信息内部错误{}", e.getMessage(), e);
            throw e;
        } finally {
            log.info("保存项目信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);

    }







}
