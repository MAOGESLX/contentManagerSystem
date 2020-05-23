package com.yxb.cms.service;


import com.yxb.cms.dao.DbTaskManagerMapper;
import com.yxb.cms.domain.vo.DbTaskManager;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 任务管理服务
 * @author YXB
 */
@Service
@Log4j2
public class TaskManagerService {


    @Autowired
    private DbTaskManagerMapper taskManagerMapper;



    /**
     * 需求信息分页展示列表
     *
     * @return
     */
    public Map<String, Object> selectTaskListByPage(DbTaskManager taskManager) {

        Map<String, Object> map = new HashMap<>();
        try {

            List<DbTaskManager> taskManagerList = taskManagerMapper.selectTaskManagerListByPage(taskManager);

            Long count = taskManagerMapper.selectTaskManagerCount(taskManager);
            map.put("code", 200);
            map.put("msg", "获取信息成功");
            map.put("count", count);
            map.put("data", taskManagerList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            map.put("code", 500);
            map.put("msg", "任务信息查询异常");
        }
        return map;
    }


}
