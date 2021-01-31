package com.gqchen.service.impl;

import com.gqchen.entity.TbSysuser;
import com.gqchen.dao.TbSysuserDao;
import com.gqchen.service.TbSysuserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TbSysuser)表服务实现类
 *
 * @author makejava
 * @since 2021-01-27 18:49:58
 */
@Service("tbSysuserService")
public class TbSysuserServiceImpl implements TbSysuserService {
    @Resource
    private TbSysuserDao tbSysuserDao;

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    @Override
    public TbSysuser queryById(Integer userId) {
        return this.tbSysuserDao.queryById(userId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<TbSysuser> queryAllByLimit(int offset, int limit) {
        return this.tbSysuserDao.queryAllByLimit(offset, limit);
    }

    @Override
    public List<TbSysuser> queryAll(TbSysuser tbSysuser) {
        return this.tbSysuserDao.queryAll(tbSysuser);
    }

    /**
     * 新增数据
     *
     * @param tbSysuser 实例对象
     * @return 实例对象
     */
    @Override
    public int insert(TbSysuser tbSysuser) {

        return this.tbSysuserDao.insert(tbSysuser);
    }

    /**
     * 修改数据
     *
     * @param tbSysuser 实例对象
     * @return 实例对象
     */
    @Override
    public int  update(TbSysuser tbSysuser) {
        return this.tbSysuserDao.update(tbSysuser);
    }

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer userId) {
        return this.tbSysuserDao.deleteById(userId) > 0;
    }


}