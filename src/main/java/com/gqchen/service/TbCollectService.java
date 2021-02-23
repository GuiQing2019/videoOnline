package com.gqchen.service;

import com.gqchen.entity.TbCollect;
import com.gqchen.entity.TbVideo;

import java.util.List;

/**
 * (TbCollect)表服务接口
 *
 * @author makejava
 * @since 2021-02-22 11:06:01
 */
public interface TbCollectService {

    /**
     * 通过ID查询单条数据
     *
     * @param collectId 主键
     * @return 实例对象
     */
    TbCollect queryById(Integer collectId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbCollect> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param tbCollect 实例对象
     * @return 实例对象
     */
    TbCollect insert(TbCollect tbCollect);

    /**
     * 修改数据
     *
     * @param tbCollect 实例对象
     * @return 实例对象
     */
    TbCollect update(TbCollect tbCollect);

    /**
     * 通过主键删除数据
     *
     * @param collectId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer collectId);

    List<TbCollect> queryAll(TbCollect collect);

    public String vertifyIfCollection(int userId,int videoId);

    public String addCollection(int userId,int videoId);
}