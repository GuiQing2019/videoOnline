package com.gqchen.entity;

import java.io.Serializable;

/**
 * (TbClassify)实体类
 *
 * @author makejava
 * @since 2021-01-30 19:25:53
 */
public class TbClassify implements Serializable {
    private static final long serialVersionUID = 888588967153831654L;
    
    private Integer classifyId;
    /**
    * 分类名
    */
    private String classifyName;
    /**
    * 分类介绍
    */
    private String classifyDesc;


    public Integer getClassifyId() {
        return classifyId;
    }

    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
    }

    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }

    public String getClassifyDesc() {
        return classifyDesc;
    }

    public void setClassifyDesc(String classifyDesc) {
        this.classifyDesc = classifyDesc;
    }

}