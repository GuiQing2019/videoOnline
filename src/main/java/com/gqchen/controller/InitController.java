package com.gqchen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 初始化页面
 */
@Controller
public class InitController {
    private static final Logger LOG= LoggerFactory.getLogger(InitController.class);
    @RequestMapping("/")
    public String loginPage() {
        LOG.info("------------------------------ 进入登录页面 ------------------------------");
        return "login";
    }

    @RequestMapping("/register")
    public String regitsterPage() {
        LOG.info("------------------------------ 进入注册页面 ------------------------------");
        return "register";
    }
}
