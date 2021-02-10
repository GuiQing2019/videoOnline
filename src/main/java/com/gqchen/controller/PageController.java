package com.gqchen.controller;

import com.gqchen.entity.TbSysuser;
import com.gqchen.entity.TbVideo;
import com.gqchen.service.TbSysuserService;
import com.gqchen.service.TbVideoService;
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

    @Autowired
    private TbVideoService videoService;

    @RequestMapping("/index")
    public String page(){
        LOG.info("------------------------------ 用户界面 ------------------------------");
        return "/index/index";
    }

    @RequestMapping("/userInfo")
    public String userInfo(String id, Model session){
        LOG.info("------------------------------ 进入到个人中心 ------------------------------");
        if (!id.equals("")) {
            LOG.info("id不为空,根据id返回数据");
            TbSysuser tbSysuser = sysuserService.queryById(Integer.valueOf(id));
            session.addAttribute("tbSysuser",tbSysuser);
        }
        return "/index/user/userinformation";
    }

    @RequestMapping("/myVideo")
    public String myVideo(String id, Model session){
        LOG.info("------------------------------ 我的视频 ------------------------------");
        //查询该用户的所有视频
        TbVideo tbVideo = new TbVideo();
        tbVideo.setUserId(Integer.valueOf(id));
        //查询出userId的所有视频
        List<TbVideo> tbVideos = videoService.queryAll(tbVideo);
        session.addAttribute("tbVideos",tbVideos);

        return "/index/user/myVideo";
    }


}
