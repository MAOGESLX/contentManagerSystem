package com.yxb.cms.controller.view.basics;


import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.dao.DbCompanyMapper;
import com.yxb.cms.dao.DbDepartmentMapper;
import com.yxb.cms.dao.DbEmployeeMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbCompany;
import com.yxb.cms.domain.vo.DbDepartment;
import com.yxb.cms.domain.vo.DbEmployee;
import com.yxb.cms.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 基础数据-员工管理
 *
 * @author YXB
 */
@Controller
@RequestMapping("employee")
public class EmployeeController extends BaseController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DbEmployeeMapper employeeMapper;

    @Autowired
    private DbCompanyMapper companyMapper;

    @Autowired
    private DbDepartmentMapper departmentMapper;




    /**
     * 跳转到员工管理页面
     *
     * @return
     */
    @RequestMapping("/employee_page.action")
    public String toEmployeePagePage() {
        return "basics/employee_page";
    }

    /**
     * 员工管理信息分页展示
     *
     * @return
     */
    @RequestMapping("/ajax_employee_list.action")
    @ResponseBody
    public Map<String, Object> ajaxEmployeeList(DbEmployee employee) {

        return employeeService.selectEmployeeListByPage(employee);
    }

    /**
     * 跳转到员工新增页面
     *
     * @return
     */
    @RequestMapping("/employee_add.action")
    public String employeeAddPage(Model model) {
        model.addAttribute("pageFlag", "addPage");
        return "basics/employee_edit";
    }
    /**
     * 跳转到员工编辑页面
     *
     * @return
     */
    @RequestMapping("/employee_update.action")
    public String employeeUpdatePage(Model model,String employeeId) {
        model.addAttribute("pageFlag", "updatePage");
        DbEmployee employee = employeeMapper.selectByPrimaryKey(employeeId);
        model.addAttribute("employee",employee);

        if(employee != null){
            //查询公司列表信息
            List<DbCompany> companyList = companyMapper.selectByPrimaryKeyList();
            model.addAttribute("companyList",companyList);

            //查询公司所属部门信息
            List<DbDepartment> departmentList = departmentMapper.selectByPrimaryKeyList(employee.getCompanyId());
            model.addAttribute("departmentList",departmentList);


        }

        return "basics/employee_edit";
    }


    /**
     * 保存员工信息
     * @return
     */
    @RequestMapping(value="/ajax_save_employee.action")
    @ResponseBody
    public BussinessMsg ajaxSaveEmployee(DbEmployee employee){
        try {
           return employeeService.saveOrUpdateEmployee(employee,this.getCurrentUserId());
        } catch (Exception e) {
            log.error("保存员工信息内部错误{}", e.getMessage(), e);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.DEPARTMENT_SAVE_ERROR);
        }

    }

}
