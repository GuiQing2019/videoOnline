package com.gqchen.controller;

import com.gqchen.entity.TbVideo;
import com.gqchen.service.TbVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @program: Online
 * @description: 视频控制层
 * @author: GuiQingChen
 * @create: 2021-01-30 22:29
 **/
@Controller
@RequestMapping("/manager/videoManager")
public class ManagerVideoController {

    @Autowired
    private TbVideoService videoService;

    @RequestMapping("/videoList")
    public String videoList(Model model){

        List<TbVideo> tbVideos = videoService.queryAll(new TbVideo());
        model.addAttribute("videoList",tbVideos);
        return "manager/video/videoList";
    }

}
