package com.yxb.cms.service;


import com.yxb.cms.architect.constant.BusinessConstants;
import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.architect.utils.DbIdUtil;
import com.yxb.cms.dao.DbCompanyMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbCompany;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 公司管理服务
 * @author YXB
 */
@Service
@Log4j2
public class CompanyService {


    @Autowired
    private DbCompanyMapper companyMapper;



    /**
     * 公司信息分页展示列表
     *
     * @return
     */
    public Map<String, Object> selectCompanyListByPage(DbCompany company) {

        Map<String, Object> map = new HashMap<String, Object>();
        try {

            List<DbCompany> companyList = companyMapper.selectCompanyListByPage(company);

            Long count = companyMapper.selectCompanyCount(company);

            map.put("code", 200);
            map.put("msg", "");
            map.put("count", count);
            map.put("data", companyList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            map.put("code", 500);
            map.put("msg", "公司信息查询异常");
        }
        return map;
    }



    /**
     * 保存修改公司信息
     * @return
     */
    public BussinessMsg saveOrUpdateCompany(DbCompany company, String userId) {
        log.info("保存公司信息开始");
        long start = System.currentTimeMillis();

        try {

            //验证公司名称唯一性
            Long checkCompanyName = companyMapper.selectCompanyNameCheck(company.getCompanyName(),company.getCompanyId());
            if(checkCompanyName.intValue() > 0){
                return BussinessMsgUtil.returnCodeMessage(BussinessCode.COMPANY_NAME_EXIST);

            }

            //保存公司信息
            if(StringUtils.isEmpty(company.getCompanyId())){
                company.setCompanyId(DbIdUtil.generate());
                company.setCompanyStatus(BusinessConstants.STATUS_1.getCode());

                company.setCreaterUserId(userId);
                company.setCreaterTime(new Date());
                companyMapper.insertSelective(company);


            }else{

                company.setModifierTime(new Date());
                company.setModifierUserId(userId);
                companyMapper.updateByPrimaryKeySelective(company);
            }
        } catch (Exception e) {
            log.error("保存公司信息内部错误{}", e.getMessage(), e);
            throw e;
        } finally {
            log.info("保存公司信息结束,用时" + (System.currentTimeMillis() - start) + "毫秒");
        }

        return BussinessMsgUtil.returnCodeMessage(BussinessCode.GLOBAL_SUCCESS);

    }

}
