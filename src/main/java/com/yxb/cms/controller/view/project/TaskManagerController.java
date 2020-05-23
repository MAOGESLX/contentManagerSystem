package com.yxb.cms.controller.view.project;


import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.domain.vo.DbTaskManager;
import com.yxb.cms.service.TaskManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 项目管理-任务管理
 *
 * @author YXB
 */
@Controller
@RequestMapping("project")
public class TaskManagerController extends BaseController {


    @Autowired
    private TaskManagerService taskManagerService;



    /**
     * 跳转到任务管理列表
     *
     * @return
     */
    @RequestMapping("/task_manager_page.action")
    public String toMemberManagerPage() {
        return "project/task_manager_page";
    }


    /**
     * 任务管理信息分页展示
     *
     * @return
     */
    @RequestMapping("/ajax_task_list.action")
    @ResponseBody
    public Map<String, Object> ajaxTaskList(DbTaskManager taskManager) {

        return taskManagerService.selectTaskListByPage(taskManager);
    }


}
