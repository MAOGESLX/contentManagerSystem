package com.yxb.cms.domain.dto;


import com.yxb.cms.domain.vo.DbMenuInfo;

import java.util.List;

public class MenuTree {

    private DbMenuInfo parentMenu;

    private List<DbMenuInfo> childMenu;

    public DbMenuInfo getParentMenu() {
        return parentMenu;
    }

    public void setParentMenu(DbMenuInfo parentMenu) {
        this.parentMenu = parentMenu;
    }

    public List<DbMenuInfo> getChildMenu() {
        return childMenu;
    }

    public void setChildMenu(List<DbMenuInfo> childMenu) {
        this.childMenu = childMenu;
    }
}
