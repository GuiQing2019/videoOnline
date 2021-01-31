package com.gqchen.entity;

import java.io.Serializable;

/**
 * (TbSysuser)实体类
 *
 * @author makejava
 * @since 2021-01-27 18:49:55
 */
public class TbSysuser implements Serializable {
    private static final long serialVersionUID = -88367253967951061L;
    
    private Integer userId;
    
    private String userName;
    
    private String userPassword;
    /**
    * 昵称
    */
    private String userNick;
    
    private String userGender;
    
    private String userAge;
    
    private String userEmail;
    
    private String userPhone;
    /**
    * 个性签名
    */
    private String userSelfIntroduction;
    /**
    * 状态id
    */
    private Integer statuId;
    /**
    * 角色Id
    */
    private Integer roleId;


    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserNick() {
        return userNick;
    }

    public void setUserNick(String userNick) {
        this.userNick = userNick;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public String getUserAge() {
        return userAge;
    }

    public void setUserAge(String userAge) {
        this.userAge = userAge;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserSelfIntroduction() {
        return userSelfIntroduction;
    }

    public void setUserSelfIntroduction(String userSelfIntroduction) {
        this.userSelfIntroduction = userSelfIntroduction;
    }

    public Integer getStatuId() {
        return statuId;
    }

    public void setStatuId(Integer statuId) {
        this.statuId = statuId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

}