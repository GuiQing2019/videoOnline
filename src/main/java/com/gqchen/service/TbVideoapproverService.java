package com.gqchen.service;

import com.gqchen.entity.TbVideoapprover;
import java.util.List;

/**
 * (TbVideoapprover)表服务接口
 *
 * @author makejava
 * @since 2021-01-31 00:37:49
 */
public interface TbVideoapproverService {

    /**
     * 通过ID查询单条数据
     *
     * @param videoapproverId 主键
     * @return 实例对象
     */
    TbVideoapprover queryById(Integer videoapproverId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<TbVideoapprover> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param tbVideoapprover 实例对象
     * @return 实例对象
     */
    TbVideoapprover insert(TbVideoapprover tbVideoapprover);

    /**
     * 修改数据
     *
     * @param tbVideoapprover 实例对象
     * @return 实例对象
     */
    TbVideoapprover update(TbVideoapprover tbVideoapprover);

    /**
     * 通过主键删除数据
     *
     * @param videoapproverId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer videoapproverId);

}