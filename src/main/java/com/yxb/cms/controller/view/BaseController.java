package com.yxb.cms.controller.view;

import com.yxb.cms.domain.vo.DbUser;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Scope("prototype")
public class BaseController {


    protected  Logger log = LogManager.getLogger(getClass());


    /**
     * 登录用户名
     */
    public String getCurrentUserAccount() {
        Subject currentUser = SecurityUtils.getSubject();
        DbUser user = currentUser.getPrincipals().oneByType(DbUser.class);
        return user.getUserAccount();
    }

    /**
     * 登录用户id
     * @return
     */
    public String getCurrentUserId(){
        Subject currentUser = SecurityUtils.getSubject();
        DbUser user = currentUser.getPrincipals().oneByType(DbUser.class);
        return user.getUserId();
    }

    /**
     * 登录用户对象
     */
    public DbUser getCurrentUser() {
        Subject currentUser = SecurityUtils.getSubject();
        DbUser user = currentUser.getPrincipals().oneByType(DbUser.class);
        return user;
    }

    /**
     * 获取用户类型
     * @return
     */

    public Integer getUserType(){
        Subject currentUser = SecurityUtils.getSubject();
        DbUser user = currentUser.getPrincipals().oneByType(DbUser.class);
        return user.getUserType();
    }

}
