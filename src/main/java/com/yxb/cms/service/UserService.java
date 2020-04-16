package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.constant.Constants;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.DbIdUtil;
import com.yxb.cms.architect.utils.ShiroUtils;
import com.yxb.cms.dao.DbRoleMapper;
import com.yxb.cms.dao.DbUserMapper;
import com.yxb.cms.dao.DbUserRoleMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbUser;
import com.yxb.cms.domain.vo.DbUserRole;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
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

    @Autowired
    private DbRoleMapper roleMapper;

    @Autowired
    private DbUserRoleMapper userRoleMapper;


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



    /**
     * 保存修改用户信息
     * @param user              用户对象
     * @return
     */
    public BussinessMsg saveOrUpdateUser(DbUser user, String userId) {
        log.info("保存用户信息开始");
        long start = System.currentTimeMillis();

        try {

            //验证用户账号唯一性
            Long checkUserAccount = userMapper.selectUserAccountCheck(user.getUserAccount(),user.getUserId());
            if(checkUserAccount.intValue() > 0){
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.USER_LOGIN_NAME_EXIST);

            }


            //保存用户信息
            if(StringUtils.isEmpty(user.getUserId())){
                user.setUserId(DbIdUtil.generate());
                user.setLoginPwd(ShiroUtils.encryptPassword(Constants.DEFAULT_PWD,user.getUserAccount()));  //初始密码
                user.setUserStatus(BusinessConstants.STATUS_1.getCode());

                user.setCreaterUserId(userId);
                user.setCreaterTime(new Date());
                userMapper.insertSelective(user);

              //保存用户角色管理
                DbUserRole userRole = new DbUserRole();
                userRole.setUserRoleId(DbIdUtil.generate());
                userRole.setFkUserId(user.getUserId());

                //查询角色信息
                String roleId = roleMapper.selectRoleId(user.getUserType().toString());
                if(StringUtils.isNotEmpty(roleId)){
                    log.info("开始保存用户角色信息，角色Id{}",roleId);
                    userRole.setFkRoleId(roleId);
                    userRoleMapper.insertSelective(userRole);
                }else{
                    log.info("保存用户信息，用户角色信息为空,不保存角色信息");
                }

            }else{

                user.setModifierTime(new Date());
                user.setModifierUserId(userId);
                userMapper.updateByPrimaryKeySelective(user);
            }
        } catch (Exception e) {
            log.error("保存用户信息内部错误{}", e.getMessage(), e);
            throw e;
        } finally {
            log.info("保存用户信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }

        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);

    }




    /**
     *  重置用户密码
     * @param userId 用户id
     * @return
     * @throws Exception
     */
    @Transactional
    public BussinessMsg resetUserPwd(String userId,String currentUserId){
        log.info("重置用户密码开始,用户id{}",userId);
        long start = System.currentTimeMillis();
        try {
            DbUser user = userMapper.selectByPrimaryKey(userId);
            if(null != user){
                user.setLoginPwd(ShiroUtils.encryptPassword(Constants.DEFAULT_PWD,user.getUserAccount()));
                user.setModifierUserId(currentUserId);
                user.setModifierTime(new Date());
                userMapper.updateByPrimaryKey(user);
            }
        } catch (Exception e) {
            log.error("重置用户密码方法内部错误{}",e.getMessage(),e);
            throw e;
        }finally {
            log.info("重置用户密码信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
    }

    /**
     * 删除用户
     * @param userId 用户id
     * @return
     * @throws Exception
     */
    @Transactional
    public BussinessMsg delUserInfo(String userId, String currentUserId){
        log.info("删除用户信息开始,用户id{}",userId);
        long start = System.currentTimeMillis();
        try {
            DbUser user = userMapper.selectByPrimaryKey(userId);
            if(null != user){
                user.setUserStatus(BusinessConstants.STATUS_0.getCode());
                user.setModifierUserId(currentUserId);
                user.setModifierTime(new Date());
                userMapper.updateByPrimaryKey(user);
            }
        } catch (Exception e) {
            log.error("删除用户信息方法内部错误{}",e.getMessage(),e);
            throw e;
        }finally {
            log.info("删除管用户信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
    }





}
