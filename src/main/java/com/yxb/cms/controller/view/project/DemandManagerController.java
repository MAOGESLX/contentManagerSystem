package com.yxb.cms.controller.view.project;


import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.dao.DbDemandManagerMapper;
import com.yxb.cms.dao.DbProjectMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbDemandManager;
import com.yxb.cms.domain.vo.DbProject;
import com.yxb.cms.service.DemandManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
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

    @Autowired
    private DbProjectMapper projectMapper;

    @Autowired
    private DbDemandManagerMapper demandManagerMapper;


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
     * 跳转到需求新增页面
     *
     * @return
     */
    @RequestMapping("/demand_add.action")
    public String demandAddPage(Model model) {
        model.addAttribute("pageFlag", "addPage");
        List<DbProject> projects =  projectMapper.selectProjectList();
        model.addAttribute("projects", projects);


        return "project/demand_manager_edit";
    }
    /**
     * 跳转到需求编辑页面
     *
     * @return
     */
    @RequestMapping("/demand_update.action")
    public String demandUpdatePage(Model model,String demandId) {
        model.addAttribute("pageFlag", "updatePage");

        DbDemandManager demand = demandManagerMapper.selectByPrimaryKey(demandId);
        model.addAttribute("demand", demand);

        //项目列表
        List<DbProject> projects =  projectMapper.selectProjectList();
        model.addAttribute("projects", projects);

        return "project/demand_manager_edit";
    }



    /**
     * 保存需求信息
     * @return
     */
    @RequestMapping(value="/ajax_save_demand.action")
    @ResponseBody
    public BussinessMsg ajaxSaveDemand(DbDemandManager demandManager){
        try {
            return demandManagerService.saveOrUpdateDemand(demandManager,this.getCurrentUserId());
        } catch (Exception e) {
            log.error("保存需求信息内部错误{}", e.getMessage(), e);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.PROJECT_SAVE_ERROR);
        }

    }



}
