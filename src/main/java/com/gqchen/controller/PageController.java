package com.gqchen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: Online
 * @description: 主界面
 * @author: GuiQingChen
 * @create: 2021-01-27 20:19
 **/
@RequestMapping("/page")
@Controller
public class PageController {

    @RequestMapping("/index")
    public String page(){

        return "/index/index";
    }
}
