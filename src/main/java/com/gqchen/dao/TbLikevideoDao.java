package com.gqchen.dao;

import com.gqchen.entity.TbLikevideo;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (TbLikevideo)表数据库访问层
 *
 * @author makejava
 * @since 2021-02-19 20:23:18
 */
public interface TbLikevideoDao {

    /**
     * 通过ID查询单条数据
     *
     * @param likeId 主键
     * @return 实例对象
     */
    TbLikevideo queryById(Integer likeId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbLikevideo> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbLikevideo 实例对象
     * @return 对象列表
     */
    List<TbLikevideo> queryAll(TbLikevideo tbLikevideo);

    /**
     * 新增数据
     *
     * @param tbLikevideo 实例对象
     * @return 影响行数
     */
    int insert(TbLikevideo tbLikevideo);

    /**
     * 修改数据
     *
     * @param tbLikevideo 实例对象
     * @return 影响行数
     */
    int update(TbLikevideo tbLikevideo);

    /**
     * 通过主键删除数据
     *
     * @param likeId 主键
     * @return 影响行数
     */
    int deleteById(Integer likeId);


    int startNum(Integer videoId);

}