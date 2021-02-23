package com.gqchen.service.impl;

import com.gqchen.dao.TbSysuserDao;
import com.gqchen.entity.TbCollect;
import com.gqchen.dao.TbCollectDao;
import com.gqchen.entity.TbSysuser;
import com.gqchen.entity.TbVideo;
import com.gqchen.service.TbCollectService;
import com.gqchen.service.TbVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TbCollect)表服务实现类
 *
 * @author makejava
 * @since 2021-02-22 11:06:01
 */
@Service("tbCollectService")
public class TbCollectServiceImpl implements TbCollectService {
    @Resource
    private TbCollectDao tbCollectDao;

    @Resource
    private TbSysuserDao sysuserDao;

    @Autowired
    private TbVideoService videoService;

    @Autowired
    private TbCollect collect;

    /**
     * 通过ID查询单条数据
     *
     * @param collectId 主键
     * @return 实例对象
     */
    @Override
    public TbCollect queryById(Integer collectId) {
        return this.tbCollectDao.queryById(collectId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<TbCollect> queryAllByLimit(int offset, int limit) {
        return this.tbCollectDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param tbCollect 实例对象
     * @return 实例对象
     */
    @Override
    public TbCollect insert(TbCollect tbCollect) {
        this.tbCollectDao.insert(tbCollect);
        return tbCollect;
    }

    /**
     * 修改数据
     *
     * @param tbCollect 实例对象
     * @return 实例对象
     */
    @Override
    public TbCollect update(TbCollect tbCollect) {
        this.tbCollectDao.update(tbCollect);
        return this.queryById(tbCollect.getCollectId());
    }

    /**
     * 通过主键删除数据
     *
     * @param collectId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer collectId) {
        return this.tbCollectDao.deleteById(collectId) > 0;
    }

    @Override
    public String vertifyIfCollection(int userId, int videoId) {
        if (sysuserDao.queryById(userId) != null) {
            try {
                collect.setUserId(userId);
                collect.setVideoId(videoId);
                List<TbCollect> tbCollects = tbCollectDao.queryAll(collect);
                if (tbCollects.size() <= 0) {
                    return "未收藏";
                } else {
                    return "已收藏";
                }
            } catch (Exception e) {
                return "收藏失败";
            }
        }
        return "用户未登录";
    }

    @Override
    public String addCollection(int userId, int videoId) {
        TbVideo tbVideo = videoService.queryById(videoId);
        TbSysuser sysuser = sysuserDao.queryById(userId);
        if (sysuser != null && !sysuser.getUserId().equals(tbVideo.getUserId())) {
            try {
                collect.setUserId(userId);
                collect.setVideoId(videoId);
                List<TbCollect> tbCollects = tbCollectDao.queryAll(collect);
                if (tbCollects.size() <= 0) {
                    tbCollectDao.insert(collect);
                    return "收藏成功";
                } else {
                    return "已收藏";
                }
            } catch (Exception e) {
                e.printStackTrace();
                return "收藏失败";
            }
        } else {
            return "不可对自身视频收藏";
        }
    }

    @Override
    public List<TbCollect> queryAll(TbCollect collect) {
        return this.tbCollectDao.queryAll(collect);
    }

}