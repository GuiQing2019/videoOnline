package com.gqchen.service;

import com.gqchen.entity.TbClassify;
import java.util.List;

/**
 * (TbClassify)表服务接口
 *
 * @author makejava
 * @since 2021-01-30 19:25:53
 */
public interface TbClassifyService {

    /**
     * 通过ID查询单条数据
     *
     * @param classifyId 主键
     * @return 实例对象
     */
    TbClassify queryById(Integer classifyId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbClassify> queryAllByLimit(int offset, int limit);

    List<TbClassify> queryAll(TbClassify tbClassify);
    /**
     * 新增数据
     *
     * @param tbClassify 实例对象
     * @return 实例对象
     */
    int insert(TbClassify tbClassify);

    /**
     * 修改数据
     *
     * @param tbClassify 实例对象
     * @return 实例对象
     */
    TbClassify update(TbClassify tbClassify);

    /**
     * 通过主键删除数据
     *
     * @param classifyId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer classifyId);

}