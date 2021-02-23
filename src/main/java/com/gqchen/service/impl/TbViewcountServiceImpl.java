package com.gqchen.service.impl;

import com.gqchen.entity.TbViewcount;
import com.gqchen.dao.TbViewcountDao;
import com.gqchen.service.TbViewcountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TbViewcount)表服务实现类
 *
 * @author makejava
 * @since 2021-02-18 16:27:10
 */
@Service("tbViewcountService")
public class TbViewcountServiceImpl implements TbViewcountService {
    @Resource
    private TbViewcountDao tbViewcountDao;

    /**
     * 通过ID查询单条数据
     *
     * @param viewId 主键
     * @return 实例对象
     */
    @Override
    public TbViewcount queryById(Integer viewId) {
        return this.tbViewcountDao.queryById(viewId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<TbViewcount> queryAllByLimit(int offset, int limit) {
        return this.tbViewcountDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param tbViewcount 实例对象
     * @return 实例对象
     */
    @Override
    public TbViewcount insert(TbViewcount tbViewcount) {
        this.tbViewcountDao.insert(tbViewcount);
        return tbViewcount;
    }

    /**
     * 修改数据
     *
     * @param tbViewcount 实例对象
     * @return 实例对象
     */
    @Override
    public TbViewcount update(TbViewcount tbViewcount) {
        this.tbViewcountDao.update(tbViewcount);
        return this.queryById(tbViewcount.getViewId());
    }

    /**
     * 通过主键删除数据
     *
     * @param viewId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer viewId) {
        return this.tbViewcountDao.deleteById(viewId) > 0;
    }

    @Override
    public List<TbViewcount> queryAll(TbViewcount viewcount) {
        return this.tbViewcountDao.queryAll(viewcount);
    }
}