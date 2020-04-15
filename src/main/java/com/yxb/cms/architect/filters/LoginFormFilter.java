package com.yxb.cms.architect.filters;

import lombok.extern.log4j.Log4j2;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自定义过滤器,过滤ajax请求session失效情况下返回状态码
 * @author YXB
 *
 *
 */
@Log4j2
public class LoginFormFilter extends FormAuthenticationFilter {

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest)request;
        HttpServletResponse httpServletResponse = (HttpServletResponse)response;
        if (isLoginRequest(request, response)) {
            if (isLoginSubmission(request, response)) {
                return executeLogin(request, response);
            } else {
                return true;
            }
        } else {

            //如果是Ajax请求，返回状态码401
            if (isAjax(httpServletRequest)){
                httpServletResponse.setStatus(401);

            } else {
                saveRequestAndRedirectToLogin(request, response);
            }
            return false;
        }
    }

    /**
     * 判断是否是ajax请求
     *
     * @param request
     * @return
     */
    boolean isAjax(HttpServletRequest request){
        return  (request.getHeader("X-Requested-With") != null  && "XMLHttpRequest".equals(request.getHeader("X-Requested-With"))   ) ;
    }
}
