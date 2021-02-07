package com.gqchen.controller;

import com.gqchen.entity.Result;
import com.gqchen.entity.TbClassify;
import com.gqchen.entity.TbSysuser;
import com.gqchen.service.TbClassifyService;
import com.gqchen.service.TbSysuserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/sysuser")
public class SysuerController {
    private static final Logger LOG = LoggerFactory.getLogger(SysuerController.class);
    private static final Integer SUCCESS_CODE = 0;
    private static final Integer FAIL_CODE = 1;
    private static final String SUCCESS_MSG = "登录成功!";
    private static final String FAIL_MSG = "登录失败!";

    @Autowired
    private TbSysuserService service;

    @Autowired
    private TbClassifyService classify;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Result<TbSysuser> login(TbSysuser sysuser, HttpSession session) {
        LOG.info("------------------------------ 登录校验 ------------------------------");
        List<TbSysuser> list = new ArrayList<>();
        Result<TbSysuser> result = null;
        list = service.queryAll(sysuser);

        //初始化视频列表


        //查询状态id如果为2的不允许登入
        TbSysuser tbSysuser = list.get(0);
        if (2 != tbSysuser.getStatuId() && !StringUtils.isEmpty(tbSysuser)) {
            result = new Result<>(SUCCESS_CODE, SUCCESS_MSG, list);
            LOG.info("校验成功!!");
        } else if (2 == tbSysuser.getStatuId()) {
            result = new Result<>(FAIL_CODE, "该账号存在违规", list);
            LOG.info("该账号存在违规!!");
        } else {
            result = new Result<>(FAIL_CODE, FAIL_MSG, list);
            LOG.info("校验失败!!");
        }
        //用户信息
        session.setAttribute("tbSysuser",tbSysuser);
        //传递视频
        //session.setAttribute("tbVideo",null);
        LOG.info(tbSysuser.toString());
        return result;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Result<Integer> register(TbSysuser tbSysuser) {
        LOG.info("------------------------------ 开始注册 ------------------------------");
        //开始注册,需要设置statu_id和role_id 默认1
        tbSysuser.setRoleId(1);
        tbSysuser.setStatuId(1);
        int resultIn = service.insert(tbSysuser);
        Result<Integer> result = null;
        ArrayList<Integer> list = new ArrayList<>();
        list.add(resultIn);
        if (resultIn > 0) {
            LOG.info("注册成功!");
            result = new Result<>(SUCCESS_CODE, "注册成功!", list);
            LOG.info("------------------------------ 进入主页 ------------------------------");
        } else {
            LOG.info("注册失败!");
            result = new Result<>(SUCCESS_CODE, "注册失败!", list);
        }
        return result;
    }


}
