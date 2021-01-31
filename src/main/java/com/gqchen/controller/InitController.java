package com.gqchen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 初始化页面
 */
@Controller
public class InitController {

    @RequestMapping("/")
    public String loginPage() {
        return "login";
    }

    @RequestMapping("/register")
    public String regitsterPage() {
        return "register";
    }
}
