package com.gqchen.controller;

import com.gqchen.entity.Result;
import com.gqchen.entity.TbSysuser;
import com.gqchen.service.MailService;
import com.gqchen.service.TbSysuserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: Online
 * @description: 个人中心
 * @author: GuiQingChen
 * @create: 2021-02-06 20:45
 **/
@RequestMapping("/index/user")
@Controller
public class IndexUserController {
    //用户个人界面
    private final static Logger LOG = LoggerFactory.getLogger(IndexUserController.class);

    @Autowired
    private TbSysuserService service;

    @Autowired
    private MailService sender;
    /**
    * @Description: 根据id查询某个用户
    * @Param: [id]
    * @return: java.lang.String
    * @Author: GuiQingChen
    * @Date: 2021/2/7
     */
    @RequestMapping("/findUserById")
    public String userInfo(String id){
        LOG.info("------------------------------ 进入到个人中心 ------------------------------");
        LOG.info("------------------------------ user_IndexUserController_findUserById ------------------------------");

        return "/index/user/userinformation";
    }

    /**
    * @Description: 修改用户信息
    * @Param: [sysuser]
    * @return: java.lang.String
    * @Author: GuiQingChen
    * @Date: 2021/2/7
     */
    @RequestMapping("/userInfoUpdate")
    public String userInfoUpdate(TbSysuser sysuser, HttpSession session){
        LOG.info("------------------------------ 修改用户信息 ------------------------------");
        LOG.info("------------------------------ user_IndexUserController_userInfoUpdate ------------------------------");

        int result=0;
       if (sysuser==null) {
           LOG.info("数据为空");
       } else {
           LOG.info("进行用户修改");
           result = service.update(sysuser);
       }

       if (result>0) {
           LOG.info("渲染到session,回传数据");
           TbSysuser tbSysuser = service.queryById(Integer.valueOf(sysuser.getUserId()));
           session.setAttribute("tbSysuser",tbSysuser);
           LOG.info("渲染成功");
       }

        return "/index/user/userinformation";
    }


    @PostMapping("/passwordUpdate")
    @ResponseBody
    public Result<TbSysuser> passwordUpdate(TbSysuser sysuser){
        LOG.info("------------------------------ 修改密码 ------------------------------");
        Result<TbSysuser> tbSysuserResult = null;
        int updatePwd = service.update(sysuser);
        //查询出用户的所有数据
        TbSysuser tbSysuser = service.queryById(Integer.valueOf(sysuser.getUserId()));
        if (updatePwd >0) {
            ArrayList<TbSysuser> list = new ArrayList<>();
            list.add(sysuser);
            LOG.info("用户"+tbSysuser.getUserNick()+" 修改成功,进行发送短信告知");
            sender.sendSimpleMail(tbSysuser.getUserEmail(),"密码修改成功","新密码为:"+tbSysuser.getUserPassword());
            LOG.info("发送成功,邮箱地址是:"+tbSysuser.getUserEmail());
            tbSysuserResult=new Result<TbSysuser>(0,"密码修改成功!",list);
        }else {
            ArrayList<TbSysuser> list = new ArrayList<>();
            list.add(sysuser);
            LOG.info("用户"+tbSysuser.getUserNick()+"修改失败");
            tbSysuserResult=new Result<TbSysuser>(1,"密码修改失败!",list);
        }
        return tbSysuserResult;
    }

    @PostMapping("/forget")
    @ResponseBody
    public Result<TbSysuser> forget(HttpServletRequest request){
        LOG.info("");
        String userName = request.getParameter("userName");
        String userId = request.getParameter("userId");

        return null;
    }
}
