/**
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
 *
 * Copyright 2017 © yangxiaobing, 873559947@qq.com
 *
 * This file is part of contentManagerSystem.
 * contentManagerSystem is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * contentManagerSystem is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with contentManagerSystem.  If not, see <http://www.gnu.org/licenses/>.
 *
 * 这个文件是contentManagerSystem的一部分。
 * 您可以单独使用或分发这个文件，但请不要移除这个头部声明信息.
 * contentManagerSystem是一个自由软件，您可以自由分发、修改其中的源代码或者重新发布它，
 * 新的任何修改后的重新发布版必须同样在遵守GPL3或更后续的版本协议下发布.
 * 关于GPL协议的细则请参考COPYING文件，
 * 您可以在contentManagerSystem的相关目录中获得GPL协议的副本，
 * 如果没有找到，请连接到 http://www.gnu.org/licenses/ 查看。
 *
 * - Author: yangxiaobing
 * - Contact: 873559947@qq.com
 * - License: GNU Lesser General Public License (GPL)
 * - source code availability: http://git.oschina.net/yangxiaobing_175/contentManagerSystem
 */
package com.yxb.cms.controller.view;

import com.yxb.cms.domain.dto.MenuTree;
import com.yxb.cms.service.MenuInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;


/**
 * 主页Controller
 *
 * @author yangxiaobing
 * @date 2017/7/6
 */
@Controller
@RequestMapping("main")
public class IndexController extends BaseController {

    @Resource
    private MenuInfoService menuInfoService;


    /**
     *跳转到主页
     * @return
     */
    @RequestMapping("/index.action")
    public String toIndexPage(Model model) {
        List<MenuTree> menuInfo = menuInfoService.getMenuInfo(this.getCurrentUser(), this.getCurrentUser().getUserRole());
        model.addAttribute("menuTree", menuInfo);
        return "main/index";
    }

    /**
     * 跳转到工作台
     *
     * @return
     */
    @RequestMapping("/workplace.action")
    public String toWorkplacePage(Model model) {
        return "main/workplace";
    }
    /**
     * 跳转到数据分析
     *
     * @return
     */
    @RequestMapping("/data_analysis.action")
    public String toDataAnalysisPage(Model model) {
        return "main/data_analysis";
    }




    /**
     * 跳转到权限不足页面
     * @return
     */
    @RequestMapping("/unauthorized.action")
    public String toUnauthorizedPage() {
        return "error/unauthorized";
    }



}
