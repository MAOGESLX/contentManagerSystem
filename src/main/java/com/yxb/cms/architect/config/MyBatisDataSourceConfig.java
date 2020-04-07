
package com.yxb.cms.architect.config;


import com.alibaba.druid.pool.DruidDataSource;
import com.yxb.cms.architect.properties.JdbcProperties;
import com.yxb.cms.architect.properties.MybatisDruidDataSourceProperties;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.sql.SQLException;

/**
 * SpringBoot MyBatis数据链接配置信息<br>
 *
 * 1.注册DataSource Druid数据源<br>
 * 2.注册数据源事务管理<br>
 * 3.注册SqlSessionFactory<br>
 *
 * @author yangxiaobing
 * @date 2020/3/1
 */
@Configuration
@EnableTransactionManagement
 //扫描 Mapper 接口并容器管理
@MapperScan(basePackages = "com.yxb.cms.dao")
public class MyBatisDataSourceConfig {


    private static Logger log = LogManager.getLogger(MyBatisDataSourceConfig.class);


    /**
     * 注册DataSource
     *
     * @return
     */
    @Bean(destroyMethod = "close", initMethod = "init")
    @Primary
    public DataSource myBatisDataSource(MybatisDruidDataSourceProperties dataSourceProperties, JdbcProperties jdbc2Properties) throws Exception {
        log.info("------------------myBatis DruiDataSource init ---------"+jdbc2Properties.getUrl());
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl(jdbc2Properties.getUrl());
        dataSource.setUsername(jdbc2Properties.getUsername());
        dataSource.setPassword(jdbc2Properties.getPassword());
        dataSource.setInitialSize(jdbc2Properties.getInitialSize());             //初始化链接大小
        dataSource.setMaxActive(jdbc2Properties.getMaxActive());                 //连接池最大使用链接数量
        dataSource.setMinIdle(jdbc2Properties.getMinIdle());                     //连接池最小空闲
        dataSource.setMaxWait(jdbc2Properties.getMaxWait());                     //获取连接最大等待时间
        dataSource.setValidationQuery(jdbc2Properties.getValidationQuery());     //验证数据库是否连通

        dataSource.setTestOnBorrow(dataSourceProperties.isTestOnBorrow());
        dataSource.setTestOnReturn(dataSourceProperties.isTestOnReturn());
        dataSource.setTestWhileIdle(dataSourceProperties.isTestWhileIdle());
        //配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
        dataSource.setTimeBetweenEvictionRunsMillis(dataSourceProperties.getTimeBetweenEvictionRunsMillis());
        //配置一个连接在池中最小生存的时间，单位是毫秒
        dataSource.setMinEvictableIdleTimeMillis(dataSourceProperties.getMinEvictableIdleTimeMillis());
        //打开removeAbandoned功能
        dataSource.setRemoveAbandoned(dataSourceProperties.isRemoveAbandoned());
        // 1800秒，也就是30分
        dataSource.setRemoveAbandonedTimeout(dataSourceProperties.getRemoveAbandonedTimeout());
        //关闭abanded连接时输出错误日志
        dataSource.setLogAbandoned(dataSourceProperties.isLogAbandoned());
        //监控数据库
        dataSource.setFilters(dataSourceProperties.getFilters());
        //开启池的prepared statement 池功能
        dataSource.setPoolPreparedStatements(dataSourceProperties.isPoolPreparedStatements());

        return dataSource;
    }

    /**
     * 注册数据源事务管理
     *
     * @return
     * @throws SQLException
     */
    @Bean(name = "myBatisTransactionManager")
    public DataSourceTransactionManager myBatisTransactionManager(DataSource myBatisDataSource) throws SQLException {
        return new DataSourceTransactionManager(myBatisDataSource);
    }


    /**
     * 注册数据源事务管理
     *
     * @param myBatisDataSource
     * @return
     * @throws Exception
     */
    @Bean
    @ConditionalOnMissingBean
    public SqlSessionFactory myBatisSqlSessionFactory(DataSource myBatisDataSource, MybatisDruidDataSourceProperties dataSourceProperties) {
        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();

        try {
            //添加数据源
            sessionFactory.setDataSource(myBatisDataSource);
            //实体类扫描路径
            sessionFactory.setTypeAliasesPackage(dataSourceProperties.getTypeAliasesPackage());
            //Mapper文件位置
            sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(dataSourceProperties.getMapperLocation()));
            //mybatisConfig 文件
            sessionFactory.setConfigLocation(new DefaultResourceLoader().getResource(dataSourceProperties.getConfigLocation()));

            return sessionFactory.getObject();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return null;
        }

    }

}