package com.yxb.cms.service;

import com.yxb.cms.architect.constant.Constants;
import com.yxb.cms.dao.DbMenuInfoMapper;
import com.yxb.cms.domain.dto.MenuTree;
import com.yxb.cms.domain.vo.DbMenuInfo;
import com.yxb.cms.domain.vo.DbUser;
import com.yxb.cms.domain.vo.DbUserRole;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
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
