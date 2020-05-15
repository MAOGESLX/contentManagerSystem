package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.DbIdUtil;
import com.yxb.cms.dao.DbEmployeeMapper;
import com.yxb.cms.dao.DbMemberManagerMapper;
import com.yxb.cms.dao.DbProjectMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbEmployee;
import com.yxb.cms.domain.vo.DbMemberManager;
import com.yxb.cms.domain.vo.DbProject;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 成员管理服务
 * @author YXB
 */
@Service
@Log4j2
public class MemberManagerService {


    @Autowired
    private DbMemberManagerMapper memberManagerMapper;

    @Autowired
    private DbProjectMapper projectMapper;

    @Autowired
    private DbEmployeeMapper employeeMapper;


    /**
     * 项目成员信息分页展示列表
     *
     * @return
     */
    public Map<String, Object> selectMemberListByPage(DbMemberManager memberManager) {

        Map<String, Object> map = new HashMap<>();
        try {

            List<DbMemberManager> memberManagerList = memberManagerMapper.selectMemberManagerListByPage(memberManager);

            Long count = memberManagerMapper.selectMemberManagerCount(memberManager);
            map.put("code", 200);
            map.put("msg", "获取信息成功");
            map.put("count", count);
            map.put("data", memberManagerList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            map.put("code", 500);
            map.put("msg", "项目成员信息查询异常");
        }
        return map;
    }



    /**
     * 保存修改项目成员信息
     * @return
     */
    public BussinessMsg saveOrUpdateMember(DbMemberManager member, String userId) {


        log.info("保存项目成员信息开始");
        long start = System.currentTimeMillis();
        try {


            //验证项目是否存在
            DbProject project = projectMapper.selectByPrimaryKeyByStatus(member.getProjectId());
            if(project == null){
                log.error("项目成员信息保存失败，所属项目不存在");
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.PROJECT_IS_NULL);
            }

            //验证员工是否存在
            DbEmployee employee = employeeMapper.selectByPrimaryKeyByStatus(member.getEmployeeId());
            if(employee == null){
                log.error("项目成员信息保存失败，员工不存在");
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.EMPLOYEE_IS_NULL);
            }

            //TODO 验证员工是否已加入项目

            //保存项目成员信息
            if(StringUtils.isEmpty(member.getMemberId())){

                member.setMemberId(DbIdUtil.generate());
                //项目信息
                member.setProjectId(project.getProjectId());
                member.setProjectName(project.getProjectName());

                //项目成员信息
                member.setEmployeeId(employee.getEmployeeId());
                member.setEmployeeName(employee.getEmployeeName());

                member.setMemberStatus(BusinessConstants.MEMBER_STATUS_1.getCode());
                member.setCreaterUserId(userId);
                member.setCreaterTime(new Date());
                memberManagerMapper.insertSelective(member);

            }else{

                //项目信息
                member.setProjectId(project.getProjectId());
                member.setProjectName(project.getProjectName());

                //项目成员信息
                member.setEmployeeId(employee.getEmployeeId());
                member.setEmployeeName(employee.getEmployeeName());

                member.setModifierTime(new Date());
                member.setModifierUserId(userId);
                memberManagerMapper.updateByPrimaryKeySelective(member);
            }
        } catch (Exception e) {
            log.error("保存项目成员信息内部错误{}", e.getMessage(), e);
            throw e;
        } finally {
            log.info("保存项目成员信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);

    }
}
