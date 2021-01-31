package com.gqchen.controller;

import com.gqchen.entity.TbVideo;
import com.gqchen.entity.TbVideoapprover;
import com.gqchen.service.TbVideoService;
import com.gqchen.service.TbVideoapproverService;
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

    @Autowired
    private TbVideoapproverService videoapproverService;

    @RequestMapping("/videoList")
    public String videoList(Model model){

        List<TbVideo> tbVideos = videoService.queryAll(new TbVideo());
        model.addAttribute("videoList",tbVideos);
        return "manager/video/videoList";
    }

    @RequestMapping("/videoApproverList")
    public String videoApprover(Model model){
        List<TbVideoapprover> tbVideoapprovers = videoapproverService.queryAll(new TbVideoapprover());
        model.addAttribute("videoApproverList",tbVideoapprovers);
        return "manager/video/videoApprover";
    }

}
