package com.gqchen.entity;

import java.io.Serializable;

/**
 * (TbMessage)实体类
 *
 * @author makejava
 * @since 2021-02-23 20:48:17
 */
public class TbMessage implements Serializable {
    private static final long serialVersionUID = 826866380909600225L;
    
    private Integer id;
    
    private String title;
    
    private String context;
    
    private Integer senId;
    
    private Integer revId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Integer getSenId() {
        return senId;
    }

    public void setSenId(Integer senId) {
        this.senId = senId;
    }

    public Integer getRevId() {
        return revId;
    }

    public void setRevId(Integer revId) {
        this.revId = revId;
    }

}