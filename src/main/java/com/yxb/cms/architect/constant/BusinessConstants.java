/**
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
 * <p>
 * Copyright 2017 © yangxiaobing, 873559947@qq.com
 * <p>
 * This file is part of contentManagerSystem.
 * contentManagerSystem is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * <p>
 * contentManagerSystem is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * <p>
 * You should have received a copy of the GNU Lesser General Public License
 * along with contentManagerSystem.  If not, see <http://www.gnu.org/licenses/>.
 * <p>
 * 这个文件是contentManagerSystem的一部分。
 * 您可以单独使用或分发这个文件，但请不要移除这个头部声明信息.
 * contentManagerSystem是一个自由软件，您可以自由分发、修改其中的源代码或者重新发布它，
 * 新的任何修改后的重新发布版必须同样在遵守GPL3或更后续的版本协议下发布.
 * 关于GPL协议的细则请参考COPYING文件，
 * 您可以在contentManagerSystem的相关目录中获得GPL协议的副本，
 * 如果没有找到，请连接到 http://www.gnu.org/licenses/ 查看。
 * <p>
 * - Author: yangxiaobing
 * - Contact: 873559947@qq.com
 * - License: GNU Lesser General Public License (GPL)
 * - source code availability: http://git.oschina.net/yangxiaobing_175/contentManagerSystem
 */
package com.yxb.cms.architect.constant;


/**
 * 系统管理平台业务常量定义
 *
 * @author yangxiaobing
 */
public enum BusinessConstants {


    /**
     * 状态
     */
    STATUS_0(0, "无效"),
    STATUS_1(1, "有效"),


    MENU_TYPE_0(0, "菜单"),
    MENU_TYPE_1(1, "按钮"),


    /**
     * 菜单级别
     */
    MENU_LEVEL_1(1, "一级菜单"),
    MENU_LEVEL_2(2, "二级菜单"),
    MENU_LEVEL_3(3, "三级菜单"),

    /**
     * 用户角色类型
     */
    USER_ROLE_TYPE_1(1, "系统管理员"),
    USER_ROLE_TYPE_2(2, "资源管理员"),
    USER_ROLE_TYPE_SUP(-1, "超级管理员"),


    /**
     * 公司性质
     */
    COMPANY_NATURE_1(1, "国有企业"),
    COMPANY_NATURE_2(2, "集体企业"),
    COMPANY_NATURE_3(3, "联营企业"),
    COMPANY_NATURE_4(4, "股份合作制企业"),
    COMPANY_NATURE_5(5, "私营企业"),
    COMPANY_NATURE_6(6, "个体户"),
    COMPANY_NATURE_7(7, "合伙企业"),
    COMPANY_NATURE_8(8, "有限责任公司"),
    COMPANY_NATURE_9(9, "股份有限公司"),

    /**
     * 职位
     */
    EMPLOYEE_POSITION_1(1, "总经理"),
    EMPLOYEE_POSITION_2(2, "副总经理"),
    EMPLOYEE_POSITION_3(3, "部门经理"),
    EMPLOYEE_POSITION_4(4, "职员"),

    /**
     * 性别
     */
    SEX_1(1, "男"),
    SEX_2(2, "女"),

    /**项目类型*/
    PROJECT_TYPE_1(1, "运营类"),
    PROJECT_TYPE_2(2, "项目类"),

    /**项目状态*/
    PROJECT_STATUS_1(1, "新建"),
    PROJECT_STATUS_2(2, "已立项"),
    PROJECT_STATUS_3(3, "设计中"),
    PROJECT_STATUS_4(4, "开发中"),
    PROJECT_STATUS_5(5, "已上线"),
    PROJECT_STATUS_6(6, "已下线"),
    PROJECT_STATUS_0(0, "已删除"),


    ;


    BusinessConstants(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private Integer code;

    private String msg;


    public String toJson() {

        return "{\"code\":\"" + code + "\",\"msg\":\"" + msg + "!\"}";

    }


    public BusinessConstants getByCode(Integer code) {
        for (BusinessConstants mc : values()) {
            if (mc.getCode().equals(code)) {
                return mc;
            }
        }
        return null;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public static void main(String[] args) {
        for (BusinessConstants msg : values()) {
            System.out.println(msg.getCode() + "\t" + msg.getMsg());
        }
    }
}
