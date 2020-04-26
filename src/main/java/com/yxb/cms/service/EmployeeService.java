package com.yxb.cms.service;


import com.yxb.cms.dao.DbEmployeeMapper;
import com.yxb.cms.domain.vo.DbEmployee;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
//    public BussinessMsg saveOrUpdateDepartment(DbDepartment department, String userId) {
//        log.info("保存部门信息开始");
//        long start = System.currentTimeMillis();
//
//        try {
//
//
//            //验证公司是否存在
//            DbCompany company =companyMapper.selectByPrimaryKeyByStatus(department.getCompanyId());
//            if(company == null){
//                log.error("部门信息保存失败，公司信息为空");
//                return BussinessMsgUtil.returnCodeMessage(BussinessCode.DEPARTMENT_COMPANY_EXIST);
//            }
//            //保存部门信息
//            if(StringUtils.isEmpty(department.getDepartmentId())){
//                department.setDepartmentId(DbIdUtil.generate());
//                department.setCompanyId(company.getCompanyId());
//                department.setCompanyName(company.getCompanyName());
//                department.setDepartmentStatus(BusinessConstants.STATUS_1.getCode());
//                department.setCreaterUserId(userId);
//                department.setCreaterTime(new Date());
//                departmentMapper.insertSelective(department);
//
//            }else{
//
//                department.setCompanyId(company.getCompanyId());
//                department.setCompanyName(company.getCompanyName());
//                department.setModifierTime(new Date());
//                department.setModifierUserId(userId);
//                departmentMapper.updateByPrimaryKeySelective(department);
//            }
//        } catch (Exception e) {
//            log.error("保存部门信息内部错误{}", e.getMessage(), e);
//            throw e;
//        } finally {
//            log.info("保存部门信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
//        }
//        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
//
//    }

}
