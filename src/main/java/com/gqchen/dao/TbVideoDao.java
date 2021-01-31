package com.gqchen.dao;

import com.gqchen.entity.TbVideo;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (TbVideo)表数据库访问层
 *
 * @author makejava
 * @since 2021-01-30 22:27:39
 */
public interface TbVideoDao {

    /**
     * 通过ID查询单条数据
     *
     * @param videoId 主键
     * @return 实例对象
     */
    TbVideo queryById(Integer videoId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbVideo> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbVideo 实例对象
     * @return 对象列表
     */
    List<TbVideo> queryAll(TbVideo tbVideo);

    /**
     * 新增数据
     *
     * @param tbVideo 实例对象
     * @return 影响行数
     */
    int insert(TbVideo tbVideo);

    /**
     * 修改数据
     *
     * @param tbVideo 实例对象
     * @return 影响行数
     */
    int update(TbVideo tbVideo);

    /**
     * 通过主键删除数据
     *
     * @param videoId 主键
     * @return 影响行数
     */
    int deleteById(Integer videoId);

}