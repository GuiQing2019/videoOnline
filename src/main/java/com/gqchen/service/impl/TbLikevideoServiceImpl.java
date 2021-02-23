package com.gqchen.service.impl;

import com.gqchen.entity.TbLikevideo;
import com.gqchen.dao.TbLikevideoDao;
import com.gqchen.service.TbLikevideoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TbLikevideo)表服务实现类
 *
 * @author makejava
 * @since 2021-02-19 20:23:18
 */
@Service("tbLikevideoService")
public class TbLikevideoServiceImpl implements TbLikevideoService {
    @Resource
    private TbLikevideoDao tbLikevideoDao;

    /**
     * 通过ID查询单条数据
     *
     * @param likeId 主键
     * @return 实例对象
     */
    @Override
    public TbLikevideo queryById(Integer likeId) {
        return this.tbLikevideoDao.queryById(likeId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<TbLikevideo> queryAllByLimit(int offset, int limit) {
        return this.tbLikevideoDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param tbLikevideo 实例对象
     * @return 实例对象
     */
    @Override
    public TbLikevideo insert(TbLikevideo tbLikevideo) {
        this.tbLikevideoDao.insert(tbLikevideo);
        return tbLikevideo;
    }

    /**
     * 修改数据
     *
     * @param tbLikevideo 实例对象
     * @return 实例对象
     */
    @Override
    public TbLikevideo update(TbLikevideo tbLikevideo) {
        this.tbLikevideoDao.update(tbLikevideo);
        return this.queryById(tbLikevideo.getLikeId());
    }

    /**
     * 通过主键删除数据
     *
     * @param likeId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer likeId) {
        return this.tbLikevideoDao.deleteById(likeId) > 0;
    }

    @Override
    public List<TbLikevideo> queryAll(TbLikevideo likevideo) {
        return this.tbLikevideoDao.queryAll(likevideo);
    }

    @Override
    public int startNum(Integer videoId) {
        return this.tbLikevideoDao.startNum(videoId);
    }
}