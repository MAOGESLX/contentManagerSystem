package com.yxb.cms.controller.view.project;


import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.dao.DbEmployeeMapper;
import com.yxb.cms.dao.DbMemberManagerMapper;
import com.yxb.cms.dao.DbProjectMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbEmployee;
import com.yxb.cms.domain.vo.DbMemberManager;
import com.yxb.cms.domain.vo.DbProject;
import com.yxb.cms.service.MemberManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 项目管理-成员管理
 *
 * @author YXB
 */
@Controller
@RequestMapping("project")
public class MemberManagerController extends BaseController {

    @Autowired
    private DbMemberManagerMapper memberManagerMapper;

    @Autowired
    private MemberManagerService memberManagerService;


    @Autowired
    private DbProjectMapper projectMapper;

    @Autowired
    private DbEmployeeMapper employeeMapper;

    /**
     * 跳转到成员管理列表
     *
     * @return
     */
    @RequestMapping("/member_manager_page.action")
    public String toMemberManagerPage() {
        return "project/member_manager_page";
    }





    /**
     * 项目成员管理信息分页展示
     *
     * @return
     */
    @RequestMapping("/ajax_member_list.action")
    @ResponseBody
    public Map<String, Object> ajaxMemberList(DbMemberManager memberManager) {

        return memberManagerService.selectMemberListByPage(memberManager);
    }




    /**
     * 跳转到成员管理新增页面
     *
     * @return
     */
    @RequestMapping("/member_add.action")
    public String memberAdd(Model model) {
        model.addAttribute("pageFlag", "addPage");
        List<DbProject> projects =  projectMapper.selectProjectList();
        model.addAttribute("projects", projects);
        return "project/member_manager_edit";
    }
    /**
     * 跳转到成员管理编辑页面
     *
     * @return
     */
    @RequestMapping("/member_update.action")
    public String memberUpdatePage(Model model,String memberId) {
        model.addAttribute("pageFlag", "updatePage");

        DbMemberManager member = memberManagerMapper.selectByPrimaryKey(memberId);
        model.addAttribute("member",member);

        //项目列表
        List<DbProject> projects =  projectMapper.selectProjectList();
        model.addAttribute("projects", projects);


        if(member != null){
            List<DbEmployee> employeeList = employeeMapper.selectEmployeeListByProjectId(member.getProjectId(),memberId);
            model.addAttribute("employeeList", employeeList);

        }

        return "project/member_manager_edit";

    }





    /**
     * 保存项目成员信息
     * @return
     */
    @RequestMapping(value="/ajax_save_member.action")
    @ResponseBody
    public BussinessMsg ajaxSaveMember(DbMemberManager member){
        try {
            return memberManagerService.saveOrUpdateMember(member,this.getCurrentUserId());
        } catch (Exception e) {
            log.error("保存项目成员信息内部错误{}", e.getMessage(), e);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.PROJECT_SAVE_ERROR);
        }

    }



}
