package com.gqchen.entity;

import java.io.Serializable;

/**
 * @program: Online
 * @description: 用户跟影视的实体类
 * @author: GuiQingChen
 * @create: 2021-02-15 16:18
 **/
public class TbUserAndVideo implements Serializable {

    private Integer videoId;

    private String videoTitle;

    private String videoInfo;

    private String videoUrl;

    private Integer videoStatuId;

    private Integer videotypeId;

    private Integer userId;

    private Integer videoClassify;

    private String userName;

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "TbUserAndVideo{" +
                "videoId=" + videoId +
                ", videoTitle='" + videoTitle + '\'' +
                ", videoInfo='" + videoInfo + '\'' +
                ", videoUrl='" + videoUrl + '\'' +
                ", videoStatuId=" + videoStatuId +
                ", videotypeId=" + videotypeId +
                ", userId=" + userId +
                ", videoClassify=" + videoClassify +
                ", userName='" + userName + '\'' +
                '}';
    }
}
