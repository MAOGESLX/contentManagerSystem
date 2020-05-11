package com.yxb.cms.controller.view.project;


import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.dao.DbCompanyMapper;
import com.yxb.cms.dao.DbDepartmentMapper;
import com.yxb.cms.dao.DbProjectMapper;
import com.yxb.cms.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 项目管理-任务管理
 *
 * @author YXB
 */
@Controller
@RequestMapping("project")
public class TaskManagerController extends BaseController {


    @Autowired
    private ProjectService projectService;

    @Autowired
    private DbProjectMapper projectMapper;

    @Autowired
    private DbCompanyMapper companyMapper;
    @Autowired
    private DbDepartmentMapper departmentMapper;



    /**
     * 跳转到需求管理列表
     *
     * @return
     */
    @RequestMapping("/task_manager_page.action")
    public String toMemberManagerPage() {
        return "project/task_manager_page";
    }

//
//    /**
//     * 项目管理信息分页展示
//     *
//     * @param project 项目管理对象
//     * @return
//     */
//    @RequestMapping("/ajax_project_list.action")
//    @ResponseBody
//    public Map<String, Object> ajaxProjectList(DbProject project) {
//
//        return projectService.selectProjectListByPage(project);
//    }
//
//    /**
//     * 跳转到项目新增页面
//     *
//     * @return
//     */
//    @RequestMapping("/project_list_add.action")
//    public String projectListAddPage(Model model) {
//        model.addAttribute("pageFlag", "addPage");
//        return "project/project_list_edit";
//    }
//    /**
//     * 跳转到项目编辑页面
//     *
//     * @return
//     */
//    @RequestMapping("/project_update.action")
//    public String projectUpdatePage(Model model,String projectId) {
//        model.addAttribute("pageFlag", "updatePage");
//        DbProject project = projectMapper.selectByPrimaryKey(projectId);
//        model.addAttribute("project",project);
//
//        if(project != null){
//            //查询公司列表信息
//            List<DbCompany> companyList = companyMapper.selectByPrimaryKeyList();
//            model.addAttribute("companyList",companyList);
//
//            //查询公司所属部门信息
//            List<DbDepartment> departmentList = departmentMapper.selectByPrimaryKeyList(project.getCompanyId());
//            model.addAttribute("departmentList",departmentList);
//        }
//
//        return "project/project_list_edit";
//    }
//
//    /**
//     * 保存项目信息
//     * @return
//     */
//    @RequestMapping(value="/ajax_save_project.action")
//    @ResponseBody
//    public BussinessMsg ajaxSaveProject(DbProject project){
//        try {
//            return projectService.saveOrUpdateProject(project,this.getCurrentUserId());
//        } catch (Exception e) {
//            log.error("保存项目信息内部错误{}", e.getMessage(), e);
//            return BussinessMsgUtil.returnCodeMessage(BussinessCode.PROJECT_SAVE_ERROR);
//        }
//
//    }



}
