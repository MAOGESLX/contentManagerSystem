package com.yxb.cms.architect.realm;


import com.yxb.cms.domain.vo.DbMenuInfo;
import com.yxb.cms.domain.vo.DbUser;
import com.yxb.cms.service.MenuInfoService;
import com.yxb.cms.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;


/**
 * 自定义Realm 实现Shiro权限验证
 * @author yangxiaobing
 */
@Component
public class ShiroDbRealm extends AuthorizingRealm {

    private Logger log = LogManager.getLogger(ShiroDbRealm.class);

    @Autowired
    @Lazy
    private UserService userService;
    @Autowired
    @Lazy
    private MenuInfoService menuInfoService;

    /**
     * 获取认证信息
     *
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken userToken = (UsernamePasswordToken) token;
        String username = userToken.getUsername();
        if (StringUtils.isEmpty(username)) {
            log.error("获取认证信息失败，原因:用户名为空");
            throw new AccountException("用户名为空");
        }
        // 根据登录用户名查询用户信息
        DbUser user = userService.selectUserByUserAccount(username);
        if (user == null) {
            throw new AccountException("用户信息为空");
        }

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getLoginPwd(), getName());
        if (null != info) {
            return info;
        }
        return null;
    }


    /**
     * 获取授权信息
     *
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        if (principals == null) {
            throw new AuthorizationException("Principal对象不能为空");
        }

        DbUser user = (DbUser) getAvailablePrincipal(principals);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        List<DbMenuInfo> menuInfo = menuInfoService.getMenuShiroInfo(user,user.getUserRole());
        if(null != menuInfo && !menuInfo.isEmpty()){
            for (DbMenuInfo menu : menuInfo) {
                info.addStringPermission(menu.getMenuCode());
            }
        }

        return info;
    }


}
