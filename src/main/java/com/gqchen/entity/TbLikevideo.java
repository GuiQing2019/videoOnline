package com.gqchen.entity;

import java.io.Serializable;

/**
 * (TbLikevideo)实体类
 *
 * @author makejava
 * @since 2021-02-19 20:23:18
 */
public class TbLikevideo implements Serializable {
    private static final long serialVersionUID = 516393044681363096L;
    
    private Integer likeId;
    
    private Integer videoId;
    
    private Integer userId;
    
    private Integer likeGrade;


    public Integer getLikeId() {
        return likeId;
    }

    public void setLikeId(Integer likeId) {
        this.likeId = likeId;
    }

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getLikeGrade() {
        return likeGrade;
    }

    public void setLikeGrade(Integer likeGrade) {
        this.likeGrade = likeGrade;
    }

}