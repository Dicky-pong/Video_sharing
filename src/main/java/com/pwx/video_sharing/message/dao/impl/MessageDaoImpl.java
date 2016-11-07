package com.pwx.video_sharing.message.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.pwx.video_sharing.common.baseUtil.BaseDao;
import com.pwx.video_sharing.message.dao.MessageDao;
import com.pwx.video_sharing.message.entity.MsgChannel;

@Service
public class MessageDaoImpl extends BaseDao implements MessageDao{
	
	public Integer validateLoginNameIsExist(String loginName) {
		String sql = "SELECT COUNT(u.id) FROM Cms_Users u WHERE u.loginName = :loginName";
        Map<String, String> map = new HashMap<String, String>();
        map.put("loginName", loginName);
        return Integer.parseInt(super.getUnique(sql, map).toString());
	}

	public MsgChannel findByMsgUserName(String msgUserName) {
        StringBuffer sb = new StringBuffer();
        Map<String, String> map = new HashMap<String, String>();
        sb.append("FROM MsgChannel m where m.msgUserName = :msgUserName");
        map.put("msgUserName", msgUserName);
        List<MsgChannel> list = (List<MsgChannel>) super.pageQuery(sb.toString(),map);
        if(list!=null && !list.isEmpty()){
            return list.get(0);
        }else{
            return null;
        }
    }
}
