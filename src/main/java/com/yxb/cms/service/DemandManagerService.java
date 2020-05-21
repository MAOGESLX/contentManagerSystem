package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.DateUtil;
import com.yxb.cms.architect.utils.DbIdUtil;
import com.yxb.cms.dao.DbDemandManagerMapper;
import com.yxb.cms.dao.DbProjectMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbDemandManager;
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
 * 需求管理服务
 * @author YXB
 */
@Service
@Log4j2
public class DemandManagerService {


    @Autowired
    private DbDemandManagerMapper demandManagerMapper;

    @Autowired
    private DbProjectMapper projectMapper;


    /**
     * 需求信息分页展示列表
     *
     * @return
     */
    public Map<String, Object> selectMemberListByPage(DbDemandManager demandManager) {

        Map<String, Object> map = new HashMap<>();
        try {

            List<DbDemandManager> demandManagerList = demandManagerMapper.selectDemandManagerListByPage(demandManager);

            Long count = demandManagerMapper.selectDemandManagerCount(demandManager);
            map.put("code", 200);
            map.put("msg", "获取信息成功");
            map.put("count", count);
            map.put("data", demandManagerList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            map.put("code", 500);
            map.put("msg", "需求信息查询异常");
        }
        return map;
    }



    /**
     * 保存修改需求信息
     * @return
     */
    public BussinessMsg saveOrUpdateDemand(DbDemandManager demand, String userId) {


        log.info("保存需求信息开始");
        long start = System.currentTimeMillis();
        try {


            //验证项目是否存在
            DbProject project = projectMapper.selectByPrimaryKeyByStatus(demand.getProjectId());
            if(project == null){
                log.error("需求信息保存失败，所属项目不存在");
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.PROJECT_IS_NULL);
            }


            //保存需求信息
            if(StringUtils.isEmpty(demand.getDemandId())){

                demand.setDemandId(DbIdUtil.generate());

                //项目信息
                demand.setProjectId(project.getProjectId());
                demand.setProjectName(project.getProjectName());

                //需求开始时间
                demand.setStartTime(DateUtil.Date2Stirng(new Date()));

                demand.setDemandStatus(BusinessConstants.DEMAND_STATUS_1.getCode());
                demand.setCreaterUserId(userId);
                demand.setCreaterTime(new Date());
                demandManagerMapper.insertSelective(demand);

            }else{

                //项目信息
                demand.setProjectId(project.getProjectId());
                demand.setProjectName(project.getProjectName());


                demand.setModifierTime(new Date());
                demand.setModifierUserId(userId);
                demandManagerMapper.updateByPrimaryKeySelective(demand);
            }
        } catch (Exception e) {
            log.error("保存需求信息内部错误{}", e.getMessage(), e);
            throw e;
        } finally {
            log.info("保存需求信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }
        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);

    }
}
