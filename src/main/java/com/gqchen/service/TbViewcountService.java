package com.gqchen.service;

import com.gqchen.entity.TbViewcount;
import java.util.List;

/**
 * (TbViewcount)表服务接口
 *
 * @author makejava
 * @since 2021-02-18 16:27:10
 */
public interface TbViewcountService {

    /**
     * 通过ID查询单条数据
     *
     * @param viewId 主键
     * @return 实例对象
     */
    TbViewcount queryById(Integer viewId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<TbViewcount> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param tbViewcount 实例对象
     * @return 实例对象
     */
    TbViewcount insert(TbViewcount tbViewcount);

    /**
     * 修改数据
     *
     * @param tbViewcount 实例对象
     * @return 实例对象
     */
    TbViewcount update(TbViewcount tbViewcount);

    /**
     * 通过主键删除数据
     *
     * @param viewId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer viewId);

    List<TbViewcount> queryAll(TbViewcount viewcount);
}