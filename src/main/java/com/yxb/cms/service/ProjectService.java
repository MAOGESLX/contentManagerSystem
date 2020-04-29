package com.yxb.cms.service;


import com.yxb.cms.dao.DbProjectMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 项目管理服务
 * @author YXB
 */
@Service
@Log4j2
public class ProjectService {


    @Autowired
    private DbProjectMapper projectMapper;



}
