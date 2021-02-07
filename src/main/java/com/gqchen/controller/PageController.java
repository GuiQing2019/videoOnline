package com.gqchen.controller;

import com.gqchen.entity.TbSysuser;
import com.gqchen.service.TbSysuserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @program: Online
 * @description: 主界面
 * @author: GuiQingChen
 * @create: 2021-01-27 20:19
 **/
@RequestMapping("/page")
@Controller
public class PageController {

    private final static Logger LOG = LoggerFactory.getLogger(PageController.class);

    @Autowired
    private TbSysuserService sysuserService;

    @RequestMapping("/index")
    public String page(){
        LOG.info("------------------------------ 用户界面 ------------------------------");
        return "/index/index";
    }

    @RequestMapping("/userInfo")
    public String userInfo(String id, Model session){
        LOG.info("------------------------------ 进入到个人中心 ------------------------------");

        return "/index/user/userinformation";
    }


}
