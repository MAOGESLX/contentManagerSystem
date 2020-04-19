package com.yxb.cms.service;

import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.constant.Constants;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.DbIdUtil;
import com.yxb.cms.architect.utils.KeyUtil;
import com.yxb.cms.dao.DbMenuInfoMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.dto.MenuTree;
import com.yxb.cms.domain.dto.Tree;
import com.yxb.cms.domain.vo.DbMenuInfo;
import com.yxb.cms.domain.vo.DbUser;
import com.yxb.cms.domain.vo.DbUserRole;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 菜单管理服务
 * @author yangbingbing
 **/
@Service
@Log4j2
public class MenuInfoService {

    @Autowired
    private DbMenuInfoMapper menuInfoMapper;


    /**
     * 菜单信息分页展示列表
     *
     * @param menuInfo
     * @return
     */
    public Map<String, Object> selectMenuListByPage(DbMenuInfo menuInfo) {

        Map<String, Object> map = new HashMap<String, Object>();
        try {
            List<DbMenuInfo> menuInfoList = menuInfoMapper.selectMenuListByPage(menuInfo);
            Long count = menuInfoMapper.selectMenuCount(menuInfo);

            map.put("code", 200);
            map.put("msg", "");
            map.put("count", count);
            map.put("data", menuInfoList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            map.put("code", 500);
            map.put("msg", "菜单信息查询异常");
            throw e;
        }
        return map;
    }

    /**
     * 查询所有菜单信息用以角色赋权限的时候Tree菜单显示
     */
    public Map<String,Object> selectMenuAllTree() {

        Map<String,Object> result = new HashMap<>();


        try {
            List<Tree> treeList = new ArrayList<>();
            // 菜单资源集合
            List<DbMenuInfo> menuList = menuInfoMapper.selectMenuAllList();

            // tree 树形集合
            if (null != menuList && !menuList.isEmpty()) {
                for (DbMenuInfo r : menuList) {
                    Tree tree = new Tree();
                    tree.setId(r.getMenuInfoId());
                    if (StringUtils.isNotEmpty(r.getMenuParentId())) {
                        tree.setParentId(r.getMenuParentId());
                    }else{
                        tree.setParentId("0");
                    }
                    tree.setTitle(r.getMenuName());
                    treeList.add(tree);
                }

                result.put("code","200");
                result.put("msg","操作成功");
                result.put("data",treeList);
            }else{
                result.put("code","201");
                result.put("msg","暂无数据");
                result.put("data",treeList);
            }
        } catch (Exception e) {
           log.error("获取角色对应菜单异常{}",e.getMessage(),e);
            result.put("code","500");
            result.put("msg","获取角色对应菜单异常");

        }

        return result;

    }


    /**
     * 根据菜单类型、和菜单级别查询菜单信息
     * @param menuType   菜单类型
     * @param menuLevel  菜单级别
     * @param menuInfoId  菜单Id
     * @return
     */
    public List<DbMenuInfo> selectParentMenuListByMenuTypeAndMenuLevel(Integer menuType, Integer menuLevel, String menuInfoId){

        //1.菜单类型为0-菜单，菜单级别为1级菜单 父级菜单为空
        if(BusinessConstants.MENU_TYPE_0.getCode().equals(menuType) && BusinessConstants.MENU_LEVEL_1.getCode().equals(menuLevel)){
            return null;
        }
        //2.菜单类型为0-菜单，菜单级别为2级菜单 查询1级父级菜单
        if(BusinessConstants.MENU_TYPE_0.getCode().equals(menuType)&& BusinessConstants.MENU_LEVEL_2.getCode().equals(menuLevel)){
            return  menuInfoMapper.selectParentMenuListByMenuTypeAndMenuLevel(BusinessConstants.MENU_TYPE_0.getCode(),BusinessConstants.MENU_LEVEL_1.getCode(),menuInfoId);
        }
        //6.菜单类型为1-按钮，菜单级别为2级菜单 查询3级菜单
        if(BusinessConstants.MENU_TYPE_1.getCode().equals(menuType) && BusinessConstants.MENU_LEVEL_2.getCode().equals(menuLevel)){
            return  menuInfoMapper.selectParentMenuListByMenuTypeAndMenuLevel(BusinessConstants.MENU_TYPE_0.getCode(),BusinessConstants.MENU_LEVEL_2.getCode(),menuInfoId);
        }
        return null;
    }



    /**
     * 新增或者修改资源信息
     * @param menuInfo 菜单对象
     * @return
     * @throws Exception
     */
    @Transactional
    public BussinessMsg saveOrUpdateMenu(DbMenuInfo menuInfo){
        log.info("保存菜单信息开始");
        long start = System.currentTimeMillis();
        try {
            //保存菜单信息
            if (StringUtils.isEmpty(menuInfo.getMenuInfoId())) {
                menuInfo.setMenuInfoId(DbIdUtil.generate());
                menuInfo.setMenuStatus(BusinessConstants.STATUS_1.getCode());
                menuInfo.setMenuCode(KeyUtil.randomResourceModeCode());
                menuInfoMapper.insertSelective(menuInfo);
            } else {
                //更新菜单信息
                menuInfoMapper.updateByPrimaryKeySelective(menuInfo);
            }
        } catch (Exception e) {
            log.error("保存菜单信息方法内部错误{}",e.getMessage(),e);
            throw e;
        }finally {
            log.info("保存菜单信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
    }


    /**
     * 查询角色对应菜单
     * @return
     */
    public List<DbMenuInfo> getMenuShiroInfo(DbUser user, DbUserRole userRole){

        List<DbMenuInfo> menuInfoList = null;
        if (StringUtils.equals(user.getUserAccount(), Constants.SUPER_ADMIN)) {
            menuInfoList = menuInfoMapper.selectMenuUrlAllList();
        } else {
            if(userRole != null){
                menuInfoList = menuInfoMapper.selectMenuInfoByRoleId(userRole.getFkRoleId());
            }
        }
        return menuInfoList;
    }

    /**
     * 获取角色对应的菜单
     * @param user
     * @param userRole
     * @return
     */
    public List<MenuTree> getMenuInfo(DbUser user, DbUserRole userRole){
        List<DbMenuInfo> menuInfoList = null;
        if (StringUtils.equals(user.getUserAccount(), Constants.SUPER_ADMIN)) {
            menuInfoList = menuInfoMapper.selectMenuAllList();
        } else {
            if(userRole != null){
                menuInfoList = menuInfoMapper.selectMenuInfoByRoleId(userRole.getFkRoleId());

            }
        }

        List<MenuTree> menuTrees = new ArrayList<>();
        if(null != menuInfoList && !menuInfoList.isEmpty()){
            List<DbMenuInfo> parentMenuList = menuInfoList.stream()
                    .filter(o -> StringUtils.isEmpty(o.getMenuParentId()))
                    .sorted(Comparator.comparingInt(DbMenuInfo::getMenuOrderNo))
                    .collect(Collectors.toList());

            Map<String, List<DbMenuInfo>> childMenuList = menuInfoList.stream()
                    .filter(o -> StringUtils.isNotEmpty(o.getMenuParentId()))
                    .sorted(Comparator.comparingInt(DbMenuInfo::getMenuOrderNo))
                    .collect(Collectors.groupingBy(DbMenuInfo::getMenuParentId));


            for (DbMenuInfo menuInfo : parentMenuList) {
                List<DbMenuInfo> child = childMenuList.get(menuInfo.getMenuInfoId());

                MenuTree mt = new MenuTree();
                mt.setParentMenu(menuInfo);
                mt.setChildMenu(child);

                menuTrees.add(mt);
            }
        }


        return menuTrees;
    }





}
