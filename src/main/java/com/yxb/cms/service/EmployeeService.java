package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.DbIdUtil;
import com.yxb.cms.dao.DbCompanyMapper;
import com.yxb.cms.dao.DbDepartmentMapper;
import com.yxb.cms.dao.DbEmployeeMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbCompany;
import com.yxb.cms.domain.vo.DbDepartment;
import com.yxb.cms.domain.vo.DbEmployee;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 员工管理服务
 * @author YXB
 */
@Service
@Log4j2
public class EmployeeService {


    @Autowired
    private DbEmployeeMapper employeeMapper;

    @Autowired
    private DbCompanyMapper companyMapper;

    @Autowired
    private DbDepartmentMapper dbDepartmentMapper;


    /**
     * 员工信息分页展示列表
     *
     * @return
     */
    public Map<String, Object> selectEmployeeListByPage(DbEmployee employee) {

        Map<String, Object> map = new HashMap<String, Object>();
        try {

            List<DbEmployee> employeeList = employeeMapper.selectEmployeeListByPage(employee);

            Long count = employeeMapper.selectEmployeeCount(employee);

            map.put("code", 200);
            map.put("msg", "");
            map.put("count", count);
            map.put("data", employeeList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            map.put("code", 500);
            map.put("msg", "员工信息查询异常");
            throw e;
        }
        return map;
    }


    /**
     * 保存修改员工信息
     * @return
     */
    public BussinessMsg saveOrUpdateEmployee(DbEmployee employee, String userId) {
        log.info("保存员工信息开始");
        long start = System.currentTimeMillis();

        try {


            //验证公司是否存在
            DbCompany company =companyMapper.selectByPrimaryKeyByStatus(employee.getCompanyId());
            if(company == null){
                log.error("员工信息保存失败，公司信息为空");
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.COMPANY_IS_NULL);
            }
            //验证部门是否存在
            DbDepartment dbDepartment = dbDepartmentMapper.selectByPrimaryKeyByStatus(employee.getDepartmentId());
            if(dbDepartment == null){
                log.error("员工信息保存失败，部门信息为空");
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.DEPARTMENT_IS_NULL);
            }


            //保存员工信息
            if(StringUtils.isEmpty(employee.getEmployeeId())){
                employee.setEmployeeId(DbIdUtil.generate());
                //公司信息
                employee.setCompanyId(company.getCompanyId());
                employee.setCompanyName(company.getCompanyName());

                //部门信息
                employee.setDepartmentId(dbDepartment.getDepartmentId());
                employee.setDepartmentName(dbDepartment.getDepartmentName());

                employee.setEmployeeStatus(BusinessConstants.STATUS_1.getCode());
                employee.setCreaterUserId(userId);
                employee.setCreaterTime(new Date());
                employeeMapper.insertSelective(employee);

            }else{

                //公司信息
                employee.setCompanyId(company.getCompanyId());
                employee.setCompanyName(company.getCompanyName());

                //部门信息
                employee.setDepartmentId(dbDepartment.getDepartmentId());
                employee.setDepartmentName(dbDepartment.getDepartmentName());

                employee.setModifierTime(new Date());
                employee.setModifierUserId(userId);
                employeeMapper.updateByPrimaryKeySelective(employee);
            }
        } catch (Exception e) {
            log.error("保存员工信息内部错误{}", e.getMessage(), e);
            throw e;
        } finally {
            log.info("保存员工信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);

    }

}
