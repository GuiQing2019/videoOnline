package com.gqchen.entity;

import java.io.Serializable;

/**
 * (TbRole)实体类
 *
 * @author makejava
 * @since 2021-01-30 13:40:38
 */
public class TbRole implements Serializable {
    private static final long serialVersionUID = 561984063869572430L;
    
    private Integer roleId;
    
    private String roleName;


    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

}