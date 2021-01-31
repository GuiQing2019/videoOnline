package com.gqchen.service.impl;

import com.gqchen.entity.TbRole;
import com.gqchen.dao.TbRoleDao;
import com.gqchen.service.TbRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TbRole)表服务实现类
 *
 * @author makejava
 * @since 2021-01-30 13:40:38
 */
@Service("tbRoleService")
public class TbRoleServiceImpl implements TbRoleService {
    @Resource
    private TbRoleDao tbRoleDao;

    /**
     * 通过ID查询单条数据
     *
     * @param roleId 主键
     * @return 实例对象
     */
    @Override
    public TbRole queryById(Integer roleId) {
        return this.tbRoleDao.queryById(roleId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<TbRole> queryAllByLimit(int offset, int limit) {
        return this.tbRoleDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param tbRole 实例对象
     * @return 实例对象
     */
    @Override
    public int insert(TbRole tbRole) {
        return this.tbRoleDao.insert(tbRole);
    }

    /**
     * 修改数据
     *
     * @param tbRole 实例对象
     * @return 实例对象
     */
    @Override
    public int update(TbRole tbRole) {
        return this.tbRoleDao.update(tbRole);
    }

    /**
     * 通过主键删除数据
     *
     * @param roleId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer roleId) {
        return this.tbRoleDao.deleteById(roleId) > 0;
    }

    @Override
    public List<TbRole> queryAll(TbRole role) {
        return this.tbRoleDao.queryAll(role);
    }
}