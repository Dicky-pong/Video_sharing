package com.pwx.video_sharing.user.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pwx.video_sharing.common.pagination.Page;
import com.pwx.video_sharing.common.redisUtil.RedisUtil;
import com.pwx.video_sharing.common.util.MsgJson;
import com.pwx.video_sharing.common.util.SessionUtil;
import com.pwx.video_sharing.dictionary.DicSingle;
import com.pwx.video_sharing.user.dao.CmsUserDao;
import com.pwx.video_sharing.user.entity.Cms_Users;
import com.pwx.video_sharing.user.service.ICmsUserService;


/**
 * <用户实现接口Service>
 * 
 * @version <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月4日 	Created
 *
 * </pre>
 * @since 1.
 */
@Service("cmsUserService")
public class CmsUserServiceImpl implements ICmsUserService {

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Resource
    private CmsUserDao cmsUserDao;
    
    // 数据字典
    public static DicSingle dic = DicSingle.getInstance();
    
    private RedisUtil redis = RedisUtil.getInstance();
    
    private static Logger logger = Logger.getLogger(CmsUserServiceImpl.class);
    
    
    @Transactional(rollbackFor = RuntimeException.class)
    public String addUser(Cms_Users user) throws Exception {
        String pKey = cmsUserDao.addUser(user);
        if (pKey != null && !"".equals(pKey)) {
            cmsUserDao.addUserRole(pKey, 1);
        }
        return pKey;
    }

    public void delUser(Cms_Users user) {
        cmsUserDao.delUser(user);
    }

    public Cms_Users findUserByuserName(String username, String password) {
        return cmsUserDao.findUserByuserName(username, password);
    }
    
	public Cms_Users queryCms_UsersMessage(String id) {
		return cmsUserDao.queryCms_UsersMessage(id);
	}

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateUser(Cms_Users user) {
        cmsUserDao.updateUser(user);
    }

    @Override
    public List<Cms_Users> getPageInfoList(Integer page, Integer pagesize) {

        return cmsUserDao.getPageInfoList(page, pagesize);
    }

    @Override
    public Cms_Users findUserById(String id) {
        return cmsUserDao.findUserById(id);
    }

    @Override
    public String addUserRole(String userid, int roleid) {
        try {
            String pKey = cmsUserDao.addUserRole(userid, roleid);
            if(null != pKey && !"".equals(pKey)){
                return pKey;
            }else{
                return "1";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "9";
        }

    }

    @Override
    public Cms_Users findUserByuserName(String username) {
        return cmsUserDao.findUserByuserName(username);
    }

    
    @Override
    public void updateCms_Userstate(Cms_Users user, String state) {
    	user = findUserByuserName(SessionUtil.getUserName());
    	user.setState(state);
    	updateUser(user);
    }
    
    
    /**
     * 根据手机号去找
     * TODO Add comments here.
     * @param phone   手机号
     * @return
     */
    public Cms_Users findByPhone(String phone){
        return cmsUserDao.findByPhone(phone);
    }
    

    @Override
    public Cms_Users findByUserCode(String userCode) {
        return cmsUserDao.findByUserCode(userCode);
    }
    

    @Override
    public MsgJson setNewPwd(String userName, String pw, String pwd) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Page queryCmsUserList(Cms_Users user,Integer pageIndex,Integer pageSize) {
        
        return cmsUserDao.queryCmsUserList(user, pageIndex, pageSize);
    }

    @Override
    public Integer queryCmsUserPageSize(Cms_Users user) {
        
        return cmsUserDao.queryCmsUserPageSize(user);
    }
    
}
