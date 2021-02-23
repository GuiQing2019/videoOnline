package com.gqchen.dao;

import com.gqchen.entity.TbCollect;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (TbCollect)表数据库访问层
 *
 * @author makejava
 * @since 2021-02-22 11:06:01
 */
public interface TbCollectDao {

    /**
     * 通过ID查询单条数据
     *
     * @param collectId 主键
     * @return 实例对象
     */
    TbCollect queryById(Integer collectId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbCollect> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbCollect 实例对象
     * @return 对象列表
     */
    List<TbCollect> queryAll(TbCollect tbCollect);

    /**
     * 新增数据
     *
     * @param tbCollect 实例对象
     * @return 影响行数
     */
    int insert(TbCollect tbCollect);

    /**
     * 修改数据
     *
     * @param tbCollect 实例对象
     * @return 影响行数
     */
    int update(TbCollect tbCollect);

    /**
     * 通过主键删除数据
     *
     * @param collectId 主键
     * @return 影响行数
     */
    int deleteById(Integer collectId);

    public TbCollect selectOne(@Param(value = "userId") int userId, @Param(value = "videoId") int videoId);

    public int insertOne(@Param(value="userId")int userId,@Param(value="videoId")int videoId);

}