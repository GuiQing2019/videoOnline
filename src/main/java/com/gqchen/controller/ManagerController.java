package com.gqchen.controller;

import com.gqchen.entity.TbClassify;
import com.gqchen.entity.TbRole;
import com.gqchen.entity.TbSysuser;
import com.gqchen.service.TbClassifyService;
import com.gqchen.service.TbRoleService;
import com.gqchen.service.TbSysuserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @program: Online
 * @description: 后台管理系统
 * @author: GuiQingChen
 * @create: 2021-01-28 10:36
 **/
@RequestMapping("/manager")
@Controller
public class ManagerController {
    private static final Logger LOG = LoggerFactory.getLogger(ManagerController.class);

    @Autowired
    private TbRoleService roleService;

    @Autowired
    private TbSysuserService sysuserService;

    @Autowired
    private TbClassifyService classifyService;

    @RequestMapping("/index")
    public String manager() {

        return "/manager/manager";
    }

    @RequestMapping("/userNew")
    public String userNew(Model model) {
        LOG.info("------------------------------ 新增用户 ------------------------------");
        //跳转到用户新增页面
        List<TbSysuser> sysusers = sysuserService.queryAll(new TbSysuser());
        model.addAttribute("userList", sysusers);
        LOG.info("传递model数据" + sysusers);
        return "/manager/user/userNew";
    }

    @RequestMapping("/roleNew")
    public String roleNew(Model model) {
        LOG.info("------------------------------ 新增角色 ------------------------------");
        //跳转到角色新增页面
        List<TbRole> tbRoles = roleService.queryAll(new TbRole());
        model.addAttribute("roleList", tbRoles);
        LOG.info("传递model数据" + tbRoles);
        return "/manager/user/roleNew";
    }

    @RequestMapping("/classifyNew")
    public String classifyNew(Model model) {
        LOG.info("------------------------------ 开始分类 ------------------------------");
        List<TbClassify> tbClassifies = classifyService.queryAll(new TbClassify());
        model.addAttribute("classifyList", tbClassifies);
        LOG.info("传递model数据" + tbClassifies);
        return "/manager/classIfy/classifyNew";
    }
}
