package com.gqchen.dao;

import com.gqchen.entity.TbClassify;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (TbClassify)表数据库访问层
 *
 * @author makejava
 * @since 2021-01-30 19:25:53
 */
public interface TbClassifyDao {

    /**
     * 通过ID查询单条数据
     *
     * @param classifyId 主键
     * @return 实例对象
     */
    TbClassify queryById(Integer classifyId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbClassify> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbClassify 实例对象
     * @return 对象列表
     */
    List<TbClassify> queryAll(TbClassify tbClassify);

    /**
     * 新增数据
     *
     * @param tbClassify 实例对象
     * @return 影响行数
     */
    int insert(TbClassify tbClassify);

    /**
     * 修改数据
     *
     * @param tbClassify 实例对象
     * @return 影响行数
     */
    int update(TbClassify tbClassify);

    /**
     * 通过主键删除数据
     *
     * @param classifyId 主键
     * @return 影响行数
     */
    int deleteById(Integer classifyId);

}