package com.yxb.cms.controller.view.basics;


import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.dao.DbCompanyMapper;
import com.yxb.cms.dao.DbDepartmentMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbCompany;
import com.yxb.cms.domain.vo.DbDepartment;
import com.yxb.cms.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 基础数据-部门管理
 *
 * @author YXB
 */
@Controller
@RequestMapping("department")
public class DepartmentController extends BaseController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private DbDepartmentMapper departmentMapper;

    @Autowired
    private DbCompanyMapper companyMapper;


    /**
     * 跳转到部门管理页面
     *
     * @return
     */
    @RequestMapping("/department_page.action")
    public String toDepartmentPagePage() {
        return "basics/department_page";
    }

    /**
     * 部门管理信息分页展示
     *
     * @param department 部门管理对象
     * @return
     */
    @RequestMapping("/ajax_department_list.action")
    @ResponseBody
    public Map<String, Object> ajaxDepartmentList(DbDepartment department) {

        return departmentService.selectDepartmentListByPage(department);
    }

    /**
     * 跳转到部门新增页面
     *
     * @return
     */
    @RequestMapping("/department_add.action")
    public String departmentAddPage(Model model) {
        model.addAttribute("pageFlag", "addPage");
        return "basics/department_edit";
    }
    /**
     * 跳转到部门编辑页面
     *
     * @return
     */
    @RequestMapping("/department_update.action")
    public String departmentUpdatePage(Model model,String departmentId) {
        model.addAttribute("pageFlag", "updatePage");
        DbDepartment department = departmentMapper.selectByPrimaryKey(departmentId);
        model.addAttribute("department",department);
        //查询公司列表信息
        List<DbCompany> companyList = companyMapper.selectByPrimaryKeyList();

        model.addAttribute("companyList",companyList);
        return "basics/department_edit";
    }


    /**
     * 保存部门信息
     * @return
     */
    @RequestMapping(value="/ajax_save_department.action")
    @ResponseBody
    public BussinessMsg ajaxSaveDepartment(DbDepartment department){
        try {
            return departmentService.saveOrUpdateDepartment(department,this.getCurrentUserId());
        } catch (Exception e) {
            log.error("保存部门信息内部错误{}", e.getMessage(), e);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.DEPARTMENT_SAVE_ERROR);
        }

    }


    /**
     * 查询公司部门列表信息
     * @return
     */
    @RequestMapping(value="/ajax_query_department_list.action")
    @ResponseBody
    public BussinessMsg ajaxQueryDepartmentList(String companyId){
        try {
            List<DbDepartment> lists = departmentMapper.selectByPrimaryKeyList(companyId);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS,lists);
        } catch (Exception e) {
            log.error("查询公司部门列表方法内部错误{}", e.getMessage(), e);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_ERROR);
        }
    }



}
