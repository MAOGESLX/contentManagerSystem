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

//
//
//    /**
//     * 保存修改管理员信息
//     * @param user              用户对象
//     * @return
//     */
//    public BussinessMsg saveOrUpdateManager(SkUser user, String userId) {
//        log.info("保存管理员用户信息开始");
//        long start = System.currentTimeMillis();
//
//        try {
//
//            //验证用户账号唯一性
//            Long checkUserAccount = userMapper.selectUserAccountCheck(user.getUserAccount(),user.getUserId());
//            if(checkUserAccount.intValue() > 0){
//                return BussinessMsgUtil.returnCodeMessage(BussinessCode.USER_ACCOUNT_EXIST2);
//
//            }
//            //系统管理员不验证学校/企业信息
//            SkSchool skSchool = null;
//            if(!user.getUserType().equals(BusinessConstants.USER_ROLE_TYPE_5.getCode())){
//                //验证绑定的学校/企业是否存在
//                skSchool = skSchoolMapper.selectByPrimaryKey(user.getOrgId());
//                if(skSchool == null){
//                    return BussinessMsgUtil.returnCodeMessage(BussinessCode.SCHOOL_COMPANY_IS_NULL);
//                }
//
//            }else{
//                log.info("系统管理员，不验证企业/学校信息");
//            }
//
//            //保存用户信息
//            if(StringUtils.isEmpty(user.getUserId())){
//                user.setUserId(DbId.generate());
//                user.setLoginPwd(ShiroUtils.encryptPassword(Constants.DEFAULT_PWD,user.getUserAccount()));  //初始密码
//                user.setUserStatus(BusinessConstants.STATUS_1.getCode());
//                if(skSchool != null){
//                    user.setOrgId(skSchool.getSchoolId());
//                    user.setOrgName(skSchool.getSchoolName());
//                    user.setProvinceCode(skSchool.getProcinceCode());
//                    user.setProvinceName(skSchool.getProvinceName());
//                    user.setCityCode(skSchool.getCityCode());
//                    user.setCityName(skSchool.getCityName());
//                    user.setCountyCode(skSchool.getCountyCode());
//                    user.setCountyName(skSchool.getCountyName());
//                }
//
//
//
//                user.setCreaterUserId(userId);
//                user.setCreaterTime(new Date());
//                userMapper.insertSelective(user);
//
//                //保存用户角色管理
//                SkUserRole userRole = new SkUserRole();
//                userRole.setUserRoleId(DbId.generate());
//                userRole.setFkUserId(user.getUserId());
//
//                //查询角色信息
//                String roleId = roleMapper.selectRoleId(user.getUserType().toString());
//                if(StringUtils.isNotEmpty(roleId)){
//                    log.info("开始保存用户角色信息，角色Id{}",roleId);
//                    userRole.setFkRoleId(roleId);
//                    userRoleMapper.insertSelective(userRole);
//                }else{
//                    log.info("保存管理员信息，用户角色信息为空,不保存角色信息");
//                }
//
//            }else{
//
//                if(skSchool != null){
//                    user.setOrgId(skSchool.getSchoolId());
//                    user.setOrgName(skSchool.getSchoolName());
//                    user.setProvinceCode(skSchool.getProcinceCode());
//                    user.setProvinceName(skSchool.getProvinceName());
//                    user.setCityCode(skSchool.getCityCode());
//                    user.setCityName(skSchool.getCityName());
//                    user.setCountyCode(skSchool.getCountyCode());
//                    user.setCountyName(skSchool.getCountyName());
//                }
//                user.setModifierTime(new Date());
//                user.setModifierUserId(userId);
//                userMapper.updateByPrimaryKeySelective(user);
//            }
//        } catch (Exception e) {
//            log.error("保存管理员用户信息内部错误{}", e.getMessage(), e);
//            throw e;
//        } finally {
//            log.info("保存管理员用户信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
//        }
//
//        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
//
//    }
//
//
//
//
//    /**
//     *  重置管理员用户密码
//     * @param userId 用户id
//     * @return
//     * @throws Exception
//     */
//    @Transactional
//    public BussinessMsg resetManagerPwd(String userId,String currentUserId){
//        log.info("重置管理员用户密码开始,用户id{}",userId);
//        long start = System.currentTimeMillis();
//        try {
//            SkUser user = userMapper.selectByPrimaryKey(userId);
//            if(null != user){
//                user.setLoginPwd(ShiroUtils.encryptPassword(Constants.DEFAULT_PWD,user.getUserAccount()));
//                user.setModifierUserId(currentUserId);
//                user.setModifierTime(new Date());
//                userMapper.updateByPrimaryKey(user);
//            }
//        } catch (Exception e) {
//            log.error("重置管理员用户密码方法内部错误{}",e.getMessage(),e);
//            throw e;
//        }finally {
//            log.info("重置管理员用户密码信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
//        }
//        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
//    }
//
//    /**
//     * 删除管理员用户
//     * @param userId 用户id
//     * @return
//     * @throws Exception
//     */
//    @Transactional
//    public BussinessMsg delManagerInfo(String userId,String currentUserId){
//        log.info("删除管理员用户信息开始,用户id{}",userId);
//        long start = System.currentTimeMillis();
//        try {
//            SkUser user = userMapper.selectByPrimaryKey(userId);
//            if(null != user){
//                user.setUserStatus(BusinessConstants.STATUS_0.getCode());
//                user.setModifierUserId(currentUserId);
//                user.setModifierTime(new Date());
//                userMapper.updateByPrimaryKey(user);
//            }
//        } catch (Exception e) {
//            log.error("删除管理员用户信息方法内部错误{}",e.getMessage(),e);
//            throw e;
//        }finally {
//            log.info("删除管理员用户信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
//        }
//        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);
//    }
//




}
