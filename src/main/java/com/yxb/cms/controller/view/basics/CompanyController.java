package com.yxb.cms.controller.view.basics;


import com.yxb.cms.architect.constant.BussinessCode;
import com.yxb.cms.architect.utils.BussinessMsgUtil;
import com.yxb.cms.controller.view.BaseController;
import com.yxb.cms.dao.DbCompanyMapper;
import com.yxb.cms.domain.dto.BussinessMsg;
import com.yxb.cms.domain.vo.DbCompany;
import com.yxb.cms.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 基础数据-公司管理
 *
 * @author YXB
 */
@Controller
@RequestMapping("company")
public class CompanyController extends BaseController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private DbCompanyMapper companyMapper;




    /**
     * 跳转到公司管理页面
     *
     * @return
     */
    @RequestMapping("/company_page.action")
    public String toCompanyPagePage() {
        return "basics/company_page";
    }

    /**
     * 公司管理信息分页展示
     *
     * @param company 公司管理对象
     * @return
     */
    @RequestMapping("/ajax_company_list.action")
    @ResponseBody
    public Map<String, Object> ajaxCompanyList(DbCompany company) {

        return companyService.selectCompanyListByPage(company);
    }

    /**
     * 跳转到公司新增页面
     *
     * @return
     */
    @RequestMapping("/company_add.action")
    public String companyAddPage(Model model) {
        model.addAttribute("pageFlag", "addPage");
        return "basics/company_edit";
    }
    /**
     * 跳转到公司编辑页面
     *
     * @return
     */
    @RequestMapping("/company_update.action")
    public String CompanyUpdatePage(Model model,String companyId) {
        model.addAttribute("pageFlag", "updatePage");
        DbCompany company = companyMapper.selectByPrimaryKey(companyId);
        model.addAttribute("company",company);

        return "basics/company_edit";
    }


    /**
     * 保存公司信息
     * @return
     */
    @RequestMapping(value="/ajax_save_company.action")
    @ResponseBody
    public BussinessMsg ajaxSaveCompany(DbCompany company){
        try {
            return companyService.saveOrUpdateCompany(company,this.getCurrentUserId());
        } catch (Exception e) {
            log.error("保存公司信息内部错误{}", e.getMessage(), e);
            return BussinessMsgUtil.returnCodeMessage(BussinessCode.COMPANY_SAVE_ERROR);
        }

    }

}
