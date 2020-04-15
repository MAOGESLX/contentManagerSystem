package com.yxb.cms.controller.view.system;


import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.dao.DbMenuInfoMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbMenuInfo;
import com.yxb.cms.service.MenuInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 系统管理-菜单管理
 * @author YXB
 */
@Controller
@RequestMapping(value = "/system/menu")
public class MenuInfoController extends BaseController {

    @Autowired
    private MenuInfoService menuInfoService;

    @Autowired
    private DbMenuInfoMapper menuInfoMapper;

    /**
     * 跳转到菜单信息页面
     * @return
     */
    @RequestMapping("/menu_page.action")
    public String toMenuPagePage() {
        return "system/menu_page";
    }

    /**
     * 菜单信息分页展示
     * @param menuInfo 菜单信息对象
     * @return
     */
    @RequestMapping("/ajax_menu_list.action")
    @ResponseBody
    public Map<String,Object> ajaxMenuList(DbMenuInfo menuInfo){
        return menuInfoService.selectMenuListByPage(menuInfo);
    }

    /**
     * 菜单添加页面
     * @return
     */
    @RequestMapping("/menu_edit.action")
    public String toMenuEditPage(Model model) {
        Long maxOrderNo = menuInfoMapper.selectMaxOrderNo();

        //新增页面标识
        model.addAttribute("pageFlag", "addPage");
        model.addAttribute("maxOrderNo", maxOrderNo);

        return "system/menu_edit";
    }

    /**
     * 菜单修改页面
     * @param menuInfoId 菜单Id
     * @return
     */
    @RequestMapping("/menu_update.action")
    public String userUpdatePage(Model model, String menuInfoId, String page){

        DbMenuInfo menu = menuInfoMapper.selectByPrimaryKey(menuInfoId);
        Long menuParentCount = menuInfoMapper.selectCountMenuParentByMenuId(menuInfoId);
        //修改页面标识
        model.addAttribute("pageFlag", "updatePage");
        model.addAttribute("menu", menu);
        model.addAttribute("menuParentCount", menuParentCount);
        model.addAttribute("page", page);

        return "system/menu_edit";
    }


    /**
     * 根据菜单类型和菜单级别查询菜单信息
     * @param menuType   菜单类型
     * @param menuLevel  菜单级别
     * @param menuInfoId 菜单Id
     * @return
     */
    @RequestMapping("ajax_menu_parent_menu.action")
    @ResponseBody
    public List<DbMenuInfo> ajaxResParentMenu(Integer menuType, Integer menuLevel, String menuInfoId){
        return menuInfoService.selectParentMenuListByMenuTypeAndMenuLevel(menuType,menuLevel,menuInfoId);
    }

    /**
     * 保存菜单信息
     * @param menuInfo 菜单实体
     * @return
     */
    @RequestMapping("/ajax_save_menu.action")
    @ResponseBody
    public BussinessMsg ajaxSaveMenu(DbMenuInfo menuInfo){
        try {
            return menuInfoService.saveOrUpdateMenu(menuInfo);
        } catch (Exception e) {
            log.error("保存菜单信息方法内部错误{}",e.getMessage(),e);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.RES_SAVE_ERROR);
        }
    }

}
