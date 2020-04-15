package com.yxb.cms.controller.view.system;


import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.domain.vo.DbUser;
import com.yxb.cms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 系统管理-用户管理
 *
 * @author YXB
 * @date 2019/01/15
 */
@Controller
@RequestMapping(value = "/system/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 跳转到用户信息页面
     *
     * @return
     */
    @RequestMapping("/user_page.action")
    public String tUserPagePage() {
        return "system/user_page";
    }

    /**
     * 用户信息分页展示
     *
     * @param user 用户信息对象
     * @return
     */
    @RequestMapping("/ajax_user_list.action")
    @ResponseBody
    public Map<String, Object> ajaxUserList(DbUser user) {

        return userService.selectUserListByPage(user);
    }
}
