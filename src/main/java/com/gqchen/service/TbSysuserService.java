package com.gqchen.service;

import com.gqchen.entity.TbSysuser;
import java.util.List;

/**
 * (TbSysuser)表服务接口
 *
 * @author makejava
 * @since 2021-01-27 18:49:56
 */
public interface TbSysuserService {

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    TbSysuser queryById(Integer userId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbSysuser> queryAllByLimit(int offset, int limit);

    List<TbSysuser> queryAll(TbSysuser tbSysuser);
    /**
     * 新增数据
     *
     * @param tbSysuser 实例对象
     * @return 实例对象
     */
    int insert(TbSysuser tbSysuser);

    /**
     * 修改数据
     *
     * @param tbSysuser 实例对象
     * @return 实例对象
     */
    int update(TbSysuser tbSysuser);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer userId);

}