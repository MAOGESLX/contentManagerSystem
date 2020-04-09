package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.dao.DbUserMapper;
import com.yxb.cms.domain.vo.DbUser;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


}
