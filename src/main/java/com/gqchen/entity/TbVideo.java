package com.gqchen.entity;

import java.io.Serializable;

/**
 * (TbVideo)实体类
 *
 * @author makejava
 * @since 2021-01-30 22:27:39
 */
public class TbVideo implements Serializable {
    private static final long serialVersionUID = -12705070014724388L;
    
    private Integer videoId;
    
    private String videoTitle;
    
    private String videoInfo;
    
    private String videoUrl;
    
    private Integer videoStatuId;
    
    private Integer videotypeId;
    
    private Integer userId;
    
    private Integer videoClassify;


    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public String getVideoTitle() {
        return videoTitle;
    }

    public void setVideoTitle(String videoTitle) {
        this.videoTitle = videoTitle;
    }

    public String getVideoInfo() {
        return videoInfo;
    }

    public void setVideoInfo(String videoInfo) {
        this.videoInfo = videoInfo;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public Integer getVideoStatuId() {
        return videoStatuId;
    }

    public void setVideoStatuId(Integer videoStatuId) {
        this.videoStatuId = videoStatuId;
    }

    public Integer getVideotypeId() {
        return videotypeId;
    }

    public void setVideotypeId(Integer videotypeId) {
        this.videotypeId = videotypeId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getVideoClassify() {
        return videoClassify;
    }

    public void setVideoClassify(Integer videoClassify) {
        this.videoClassify = videoClassify;
    }

}