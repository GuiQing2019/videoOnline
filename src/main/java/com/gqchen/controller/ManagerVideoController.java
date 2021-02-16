package com.gqchen.controller;

import com.gqchen.entity.Result;
import com.gqchen.entity.TbUserAndVideo;
import com.gqchen.entity.TbVideo;
import com.gqchen.entity.TbVideoapprover;
import com.gqchen.service.TbVideoService;
import com.gqchen.service.TbVideoapproverService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
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

    private static final Logger LOG = LoggerFactory.getLogger(ManagerVideoController.class);

    @Autowired
    private TbVideoService videoService;

    @Autowired
    private TbVideoapproverService videoapproverService;

    @RequestMapping("/videoList")
    public String videoList(Model model) {

        List<TbUserAndVideo> tbUserAndVideos = videoService.queryAllVideoAndUserName(new TbVideo());
        model.addAttribute("videoList", tbUserAndVideos);
        return "manager/video/videoList";
    }

    @RequestMapping("/videoApproverList")
    public String videoApprover(Model model) {
        List<TbVideoapprover> tbVideoapprovers = videoapproverService.queryAll(new TbVideoapprover());
        model.addAttribute("videoApproverList", tbVideoapprovers);
        return "manager/video/videoApprover";
    }

    @RequestMapping("/queryVideoByClassify")
    public String queryVideoByClassify(String id, Model model) {
        LOG.info(id);
        TbVideo tbVideo = new TbVideo();
        tbVideo.setVideoClassify(Integer.valueOf(id));
        List<TbUserAndVideo> tbUserAndVideos = videoService.queryAllVideoAndUserName(tbVideo);
        model.addAttribute("tbUserAndVideos", tbUserAndVideos);
        return "/index/user/videoCentre";
    }

    /**
     * @Description: 根据videoAp审核id删除
     * @Param: [id]
     * @return: java.lang.String
     * @Author: GuiQingChen
     * @Date: 2021/2/16
     */
    @PostMapping("/delVideo")
    @ResponseBody
    public Result<TbVideo> delvideo(String id) {
        LOG.info("删除video");
        Result<TbVideo> tbVideoResult = null;
        try {
            //先删除video表
            videoService.deleteByApId(Integer.valueOf(id));

            //再删除审核表
            videoapproverService.deleteById(Integer.valueOf(id));
            tbVideoResult = new Result<>(0, "删除成功!", new ArrayList<>());

        } catch (NumberFormatException e) {
            tbVideoResult = new Result<>(1, "删除失败!", new ArrayList<>());
            LOG.error(e.getMessage(), e);
            throw e;
        }

        return tbVideoResult;
    }


}
