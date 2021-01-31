package com.gqchen;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.gqchen.dao")
public class OnlineApplication {

    private final static Logger logger = LoggerFactory.getLogger(OnlineApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(OnlineApplication.class,args);
        logger.info("------------------------------ 项目启动成功 ------------------------------");
        logger.info("访问地址入口：localhost:8088");
    }
}
