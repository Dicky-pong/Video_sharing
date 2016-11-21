package com.pwx.video_sharing.file.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.pwx.video_sharing.common.baseUtil.BaseDao;
import com.pwx.video_sharing.common.pagination.Page;
import com.pwx.video_sharing.file.dao.FileDao;
import com.pwx.video_sharing.file.entity.File;
@Service
public class FileDaoImpl extends BaseDao implements FileDao {

	@Override
	public String saveFile(File file) {
		return super.add(file);
	}

	@Override
	public Page findByUserId(Map<String, Object> param) {
		List<File> list = new ArrayList<File>(); 
		Map<String, String> map = new HashMap<String, String>();
        StringBuffer sbf = new StringBuffer("SELECT d FROM File d where d.userId = :userId");
        sbf.append(" ORDER BY d.createDate DESC");
        map.put("userId",(String) param.get("user_id"));
        List<Page> pList =  (List<Page>)super.queryPage(sbf.toString(), (Integer)param.get("start"), (Integer)param.get("size"), map);
        Page page = pList.get(0);
        Page p = new Page();
        if(page != null){
            if(page.getData().size()>0){
                for (int i = 0; i < page.getData().size(); i++) {
                	File deal = (File) page.getData().get(i);
                    list.add(deal);
                    p.setData(list);
                }
            }else{
                p.setData(page.getData());
            }
            p.setPageIndex(page.getPageIndex());
            p.setPageSize(page.getPageSize());
        }
        return p;
	}

	@Override
	public int countById(Map<String, Object> param) {
		StringBuffer sb = new StringBuffer("SELECT COUNT(d.id) FROM File d where d.userId = :userId");
        Map<String, String> map = new HashMap<String, String>();
        map.put("userId",(String) param.get("user_id"));
        return Integer.parseInt(super.getUnique(sb.toString(), map).toString());
	}

}
