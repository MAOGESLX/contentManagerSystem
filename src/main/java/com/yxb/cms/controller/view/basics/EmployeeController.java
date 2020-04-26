package com.yxb.cms.controller.view.basics;


import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.dao.DbEmployeeMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbEmployee;
import com.yxb.cms.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
           // return departmentService.saveOrUpdateDepartment(department,this.getCurrentUserId());
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
        } catch (Exception e) {
            log.error("保存员工信息内部错误{}", e.getMessage(), e);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.DEPARTMENT_SAVE_ERROR);
        }

    }

}
