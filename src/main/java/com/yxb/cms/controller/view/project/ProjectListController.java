package com.yxb.cms.controller.view.project;


import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 项目管理-项目列表
 *
 * @author YXB
 */
@Controller
@RequestMapping("project")
public class ProjectListController extends BaseController {


    @Autowired
    private ProjectService projectService;


    /**
     * 跳转到项目列表页面
     *
     * @return
     */
    @RequestMapping("/project_list_page.action")
    public String toProjectListPage() {
        return "project/project_list_page";
    }


}
