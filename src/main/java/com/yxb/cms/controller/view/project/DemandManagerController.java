package com.yxb.cms.controller.view.project;


import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.domain.vo.DbDemandManager;
import com.yxb.cms.service.DemandManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 项目管理-需求管理
 *
 * @author YXB
 */
@Controller
@RequestMapping("project")
public class DemandManagerController extends BaseController {



    @Autowired
    private DemandManagerService demandManagerService;



    /**
     * 跳转到需求管理列表
     *
     * @return
     */
        @RequestMapping("/demand_manager_page.action")
    public String toDemandManagerPage() {
        return "project/demand_manager_page";
    }


    /**
     * 需求信息分页展示
     **/
    @RequestMapping("/ajax_demand_list.action")
    @ResponseBody
    public Map<String, Object> ajaxDemandList(DbDemandManager demandManager) {

        return demandManagerService.selectMemberListByPage(demandManager);
    }



    /**
     * 跳转到项目新增页面
     *
     * @return
     */
//    @RequestMapping("/project_list_add.action")
//    public String projectListAddPage(Model model) {
//        model.addAttribute("pageFlag", "addPage");
//        return "project/demand_manager_edit";
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
