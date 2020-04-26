package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.DbIdUtil;
import com.yxb.cms.dao.DbCompanyMapper;
import com.yxb.cms.dao.DbDepartmentMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbCompany;
import com.yxb.cms.domain.vo.DbDepartment;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 部门管理服务
 * @author YXB
 */
@Service
@Log4j2
public class DepartmentService {


    @Autowired
    private DbDepartmentMapper departmentMapper;

    @Autowired
    private DbCompanyMapper companyMapper;



    /**
     * 部门信息分页展示列表
     *
     * @return
     */
    public Map<String, Object> selectDepartmentListByPage(DbDepartment department) {

        Map<String, Object> map = new HashMap<String, Object>();
        try {

            List<DbDepartment> departmentList = departmentMapper.selectDepartmentListByPage(department);

            Long count = departmentMapper.selectDepartmentCount(department);

            map.put("code", 200);
            map.put("msg", "");
            map.put("count", count);
            map.put("data", departmentList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            map.put("code", 500);
            map.put("msg", "部门信息查询异常");
            throw e;
        }
        return map;
    }



    /**
     * 保存修改部门信息
     * @return
     */
    public BussinessMsg saveOrUpdateDepartment(DbDepartment department, String userId) {
        log.info("保存部门信息开始");
        long start = System.currentTimeMillis();

        try {

            //验证部门名称唯一性
            Long checkCompanyName = departmentMapper.selectDepartmentNameCheck(department.getDepartmentName(),department.getDepartmentId());
            if(checkCompanyName.intValue() > 0){
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.DEPARTMENT_NAME_EXIST);
            }
            //验证公司是否存在
            DbCompany company =companyMapper.selectByPrimaryKeyByStatus(department.getCompanyId());
            if(company == null){
                log.error("部门信息保存失败，公司信息为空");
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.DEPARTMENT_COMPANY_EXIST);
            }
            //保存部门信息
            if(StringUtils.isEmpty(department.getDepartmentId())){
                department.setDepartmentId(DbIdUtil.generate());
                department.setCompanyId(company.getCompanyId());
                department.setCompanyName(company.getCompanyName());
                department.setDepartmentStatus(BusinessConstants.STATUS_1.getCode());
                department.setCreaterUserId(userId);
                department.setCreaterTime(new Date());
                departmentMapper.insertSelective(department);

            }else{

                department.setCompanyId(company.getCompanyId());
                department.setCompanyName(company.getCompanyName());
                department.setModifierTime(new Date());
                department.setModifierUserId(userId);
                departmentMapper.updateByPrimaryKeySelective(department);
            }
        } catch (Exception e) {
            log.error("保存部门信息内部错误{}", e.getMessage(), e);
            throw e;
        } finally {
            log.info("保存部门信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);

    }

}
