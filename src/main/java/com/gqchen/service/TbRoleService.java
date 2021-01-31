package com.gqchen.service;

import com.gqchen.entity.TbRole;
import java.util.List;

/**
 * (TbRole)表服务接口
 *
 * @author makejava
 * @since 2021-01-30 13:40:38
 */
public interface TbRoleService {

    /**
     * 通过ID查询单条数据
     *
     * @param roleId 主键
     * @return 实例对象
     */
    TbRole queryById(Integer roleId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbRole> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param tbRole 实例对象
     * @return 实例对象
     */
    int insert(TbRole tbRole);

    /**
     * 修改数据
     *
     * @param tbRole 实例对象
     * @return 实例对象
     */
    int update(TbRole tbRole);

    /**
     * 通过主键删除数据
     *
     * @param roleId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer roleId);

    List<TbRole> queryAll(TbRole role);
}