package com.yxb.cms.controller.view.system;


import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.dao.DbRoleMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbRole;
import com.yxb.cms.service.MenuInfoService;
import com.yxb.cms.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 系统管理-角色管理
 * @author yangxiaobing
 */
@Controller
@RequestMapping(value = "/system/role")
public class RoleController extends BaseController {


    @Autowired
    private RoleService roleService;

    @Autowired
    private DbRoleMapper roleMapper;

    @Autowired
    private MenuInfoService menuInfoService;

    /**
     * 跳转到角色信息页面
     * @return
     */
    @RequestMapping("/role_page.action")
    public String tRolePagePage() {
        return "system/role_page";
    }

    /**
     * 角色信息分页展示
     * @param role 角色信息对象
     * @return
     */
    @RequestMapping("/ajax_role_list.action")
    @ResponseBody
    public Map<String,Object> ajaxRoleList(DbRole role){
        return roleService.selectRoleListByPage(role);
    }


    /**
     * 跳转到角色信息新增页面
     * @return
     */
    @RequestMapping("/role_add.action")
    public String tRoleAddPage() {
        return "system/role_edit";
    }

    /**
     * 跳转到角色信息修改页面
     * @param roleId 角色id
     * @return
     */
    @RequestMapping("/role_update.action")
    public String tRoleUpdatePage(String roleId, Model model) {
        DbRole role =  roleMapper.selectByPrimaryKey(roleId);
        model.addAttribute("pageFlag","updatePage");
        model.addAttribute("role",role);
        return "system/role_edit";
    }

    /**
     * 角色授权页面
     * @param model
     * @param roleId 角色Id
     * @return
     */
    @RequestMapping("/role_grant.action")
    public String roleGrantPage(Model model, String roleId){
//        SkRole role = roleService.selectRoleMenuByRoleId(roleId);
//        model.addAttribute("role",role);
        return "system/role_grant";
    }


    /**
     * 保存角色菜单信息
     * @param role  角色对象
     * @return
     */
    @RequestMapping("/ajax_save_role.action")
    @ResponseBody
    public BussinessMsg ajaxSaveRole(DbRole role){
        try {
            return roleService.saveOrUpdateRole(role);
        } catch (Exception e) {
            log.error("保存角色信息方法内部错误{}",e.getMessage(),e);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.ROLE_SAVE_ERROR);
        }
    }
}
