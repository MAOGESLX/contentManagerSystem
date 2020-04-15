package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.dao.DbUserMapper;
import com.yxb.cms.domain.vo.DbUser;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户管理服务
 * @author YXB
 */
@Service
@Log4j2
public class UserService {


    @Autowired
    private DbUserMapper userMapper;


    /**
     * 根据登录账号查询用户信息
     * @param userAccount 登录账号
     * @return
     */
    public DbUser selectUserByUserAccount(String userAccount){
        return userMapper.selectUserByUserAccountAndStatus(userAccount, BusinessConstants.STATUS_1.getCode());

    }


    /**
     * 用户信息分页展示列表
     *
     * @param user 用户信息对象
     * @return
     */
    public Map<String, Object> selectUserListByPage(DbUser user) {

        Map<String, Object> map = new HashMap<String, Object>();
        try {

            List<DbUser> userList = userMapper.selectUserListByPage(user);
            Long count = userMapper.selectUserCount(user);

            map.put("code", 200);
            map.put("msg", "");
            map.put("count", count);
            map.put("data", userList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            map.put("code", 500);
            map.put("msg", "用户信息查询异常");
            throw e;
        }
        return map;
    }




}
