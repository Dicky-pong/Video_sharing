package com.pwx.video_sharing.user.dao.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.pwx.video_sharing.common.baseUtil.BaseDao;
import com.pwx.video_sharing.common.pagination.Page;
import com.pwx.video_sharing.user.dao.CmsUserDao;
import com.pwx.video_sharing.user.entity.Cms_Roles;
import com.pwx.video_sharing.user.entity.Cms_User_Role;
import com.pwx.video_sharing.user.entity.Cms_Users;


/**
 * 
 * <userDao的实现类>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月4日 	Created
 *
 * </pre>
 * @since 1.
 */
@Service
public class CmsUserDaoImpl extends BaseDao implements CmsUserDao {
	
    
    public String addUser(Cms_Users user) {
        String pKey = super.add(user);
        return pKey;
    }
    
    public void delUser(Cms_Users user) {
        super.delete(user);
    }

    @SuppressWarnings("unchecked")
	@Override
	public Cms_Users findUserByuserName(String username,String password) {
		
	    String hql = "select e from Cms_Users e where 1 = 1 ";
	    Map<String,String> maps = new HashMap<String, String>();
	    if(username != null && !"".equals(username)){
	        hql = hql+" and e.loginName = :username ";
	        maps.put("username", username);
	    }
	    if(password != null && !"".equals(password)){
	        hql = hql+" and password = :password ";
	        maps.put("password", password);
	    }
	    //根据不同条件进行查询返回
        List<Cms_Users> Cms_Users = (List<Cms_Users>) super.queryObject(hql,maps); 
		
		if(Cms_Users!=null && !Cms_Users.isEmpty() && Cms_Users.size()>0){
		    super.getHibernateTemplate().evict(Cms_Users.get(0));
			return Cms_Users.get(0);
		}else{
			return null;
		}
	}

    @Override
    public void updateUser(Cms_Users user) {
        super.update(user);
    }
    
    /*public Cms_Users queryCms_UsersMessage(String id) {
        String hql = "SELECT id, loginName, nickName, contactName, contactProfile, contactPhone, "
        		+ "contactCellPhone, contactEmail, contactCardId, contactCardImgSrc,"
        		+ "enterpriseName, enterprisePhone, enterpriseDetail, enterpriseAddressProvince, "
        		+ "enterpriseAddressCity, enterpriseAddressArea, enterpriseBusinessCircle, enterpriseAddressDetail,"
        		+ "enterpriseInfoDetail, businessLicense, businessLicenseScan, enterpriseJGH, enterpriseLogo,"
        		+ "businessNameCardScan, businessNameCardScan1, businessHours, userCode, webSite, remark, contactBackCardImgSrc"
        		+ " FROM Cms_Users u WHERE id = :id";
        Map<String,String> map = new HashMap<String, String>();
        map.put("id", id);
        Object object = super.getUnique(hql, map);
        Object[] obj = (Object[]) object;
        Cms_Users Cms_Users = new Cms_Users();
        Cms_Users.setId((String)obj[0]);
        Cms_Users.setLoginName((String)obj[1]);
        Cms_Users.setNickName((String)obj[2]);
        Cms_Users.setContactName((String)obj[3]);
        Cms_Users.setContactProfile((String)obj[4]);
        Cms_Users.setContactPhone((String)obj[5]);
        Cms_Users.setContactCellPhone((String)obj[6]);
        Cms_Users.setContactEmail((String)obj[7]);
        Cms_Users.setContactCardId((String)obj[8]);
        Cms_Users.setContactCardImgSrc((String)obj[9]);
        Cms_Users.setEnterpriseName((String)obj[10]);
        Cms_Users.setEnterprisePhone((String)obj[11]);
        Cms_Users.setEnterpriseDetail((String)obj[12]);
        Cms_Users.setEnterpriseAddressProvince((String)obj[13]);
        Cms_Users.setEnterpriseAddressCity((String)obj[14]);
        Cms_Users.setEnterpriseAddressArea((String)obj[15]);
        Cms_Users.setEnterpriseBusinessCircle((String)obj[16]);
        Cms_Users.setEnterpriseAddressDetail((String)obj[17]);
        Cms_Users.setEnterpriseInfoDetail((String)obj[18]);
        Cms_Users.setBusinessLicense((String)obj[19]);
        Cms_Users.setBusinessLicenseScan((String)obj[20]);
        Cms_Users.setEnterpriseJGH((String)obj[21]);
        Cms_Users.setEnterpriseLogo((String)obj[22]);
        Cms_Users.setBusinessNameCardScan((String)obj[23]);
        Cms_Users.setBusinessNameCardScan1((String)obj[24]);
        Cms_Users.setBusinessHours((String)obj[25]);
        Cms_Users.setUserCode((String)obj[26]);
        Cms_Users.setWebSite((String)obj[27]);
        Cms_Users.setRemark((String)obj[28]);
        Cms_Users.setContactBackCardImgSrc((String)obj[29]);
        return Cms_Users;
    }*/

    @SuppressWarnings("unchecked")
    @Override
    public List<Cms_Users> getPageInfoList(Integer page,Integer pagesize) {
        String hql = "from Cms_Users where 1=1";//and contact_Name = ?
        Map<String,String> map = new HashMap<String, String>();
        
        List<Cms_Users> Cms_Users =  (List<Cms_Users>) super.pageQuery(hql, page, pagesize,map);
        return Cms_Users;
    }

    @Override
    public Cms_Users findUserById(String id) {
        Cms_Users Cms_Users = (Cms_Users) getById(Cms_Users.class, id);
        super.getHibernateTemplate().evict(Cms_Users);
        return Cms_Users;
    }

    @Override
    public String addUserRole(String userid,int roleid) {
//        throw NullPointerException;
        Cms_User_Role Cms_User_Role = new Cms_User_Role();
        Cms_Users Cms_Users = (Cms_Users) getById(Cms_Users.class, userid);
        Cms_Roles Cms_Roles = (Cms_Roles) getById(Cms_Roles.class, roleid);
        Cms_User_Role.setCms_Users(Cms_Users);
        Cms_User_Role.setCms_Roles(Cms_Roles);
        String pKey = super.add(Cms_User_Role);
        return pKey;
    }

    @Override
    public Cms_Users findUserByuserName(String username) {
    	Cms_Users Cms_Users = findUserByuserName(username,null);
    	super.getHibernateTemplate().evict(Cms_Users);
        return Cms_Users;
    }

    @Override
    public void updateUserAccUUID(String userId, String accUUID) {
        String hql ="update Cms_Users u set accUUID = :accUUID where id = :userId";
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("accUUID", accUUID);
        map.put("userId", userId);
        super.update(hql, map);
    }

    @Override
    public Cms_Users findUserByPhone(String phone) {
        String hql = "from Cms_Users e where 1 = 1 ";
        Map<String,String> maps = new HashMap<String, String>();
        if(phone != null && !"".equals(phone)){
            hql = hql+" and e.enterprisePhone = :phone ";
            maps.put("phone", phone);
        }
        //根据不同条件进行查询返回
        List<Cms_Users> Cms_Users = (List<Cms_Users>) super.queryObject(hql,maps); 
        
        if(Cms_Users!=null && !Cms_Users.isEmpty() && Cms_Users.size()>0){
            super.getHibernateTemplate().evict(Cms_Users.get(0));
            return Cms_Users.get(0);
        }else{
            return null;
        }
    }
    @Override
    public Cms_Users findByPhone(String phone) {
        Cms_Users u=null;
        String hql="from Cms_Users u where 1=1 and u.enterprisePhone=:enterprisePhone";
        Map<String,String> map=new HashMap<String,String>();
        map.put("enterprisePhone",phone);
        List<Cms_Users> us=(List<Cms_Users>)super.queryObject(hql, map);
        if(us!=null&&us.size()!=0){
            u=us.get(0);
        }
        return u;
    }
    @Override
    public Cms_Users findByEmail(String email) {
        Cms_Users u=null;
        String hql="from Cms_Users u where 1=1 and u.contactEmail=:email";
        Map<String,String> map=new HashMap<String,String>();
        map.put("email",email);
        List<Cms_Users> us=(List<Cms_Users>)super.queryObject(hql, map);
        if(us!=null&&us.size()!=0){
            u=us.get(0);
        }
        return u;
    }

    @Override
    public Cms_Users findByUserCode(String userCode) {
        Cms_Users u=null;
        String hql="from Cms_Users u where 1=1 and u.userCode=:userCode";
        Map<String,String> map=new HashMap<String,String>();
        map.put("userCode",userCode);
        List<Cms_Users> us=(List<Cms_Users>)super.queryObject(hql, map);
        if(us!=null&&us.size()!=0){
            u=us.get(0);
        }
        return u;
    }
    
    @Override
    public void updateMerchantMessage(Cms_Users user) {
    	/*String hql = "UPDATE Cms_Users SET "
    			+ "enterpriseDetail = :enterpriseDetail,"
    			+ "editEnterpriseDetail = :editEnterpriseDetail"
				+ " WHERE id = :id";
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("enterpriseDetail", user.getEnterpriseDetail());
    	map.put("editEnterpriseDetail", user.getEditEnterpriseDetail());
    	map.put("id", user.getId());
    	super.update(hql, map);*/
    }

    @Override
    public Cms_Users queryCms_UsersMessage(String id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Page queryCmsUserList(Cms_Users user,Integer pageIndex,Integer pageSize) {
        
        StringBuffer sql = new StringBuffer();
        Map<String, String> map = new HashMap<String, String>();
        sql.append(" from Cms_Users ");
        
        Page page = new Page();
        List<Page> pList =  (List<Page>)super.queryPage(sql.toString(), pageIndex, pageSize,map);
        //转换数据状态
        super.getHibernateTemplate().evict(pList);
        //转换用户数据关系  去掉关联查询中的权限数据
        List<Cms_Users> userlist = new ArrayList<Cms_Users>();
        for (Page o : pList) {
            for (int i = 0; i < o.getData().size(); i++) {
                Cms_Users u = (Cms_Users) o.getData().get(i);
                super.getHibernateTemplate().evict(u);
                u.setCms_roles(null);
                userlist.add(u);
            }
        }
        if(pList.size()>0){
            page = pList.get(0);
            page.setData(userlist);
            return page;
        }else{
            return null;
        }
    }

    @Override
    public Integer queryCmsUserPageSize(Cms_Users user) {
        
        StringBuffer where = new StringBuffer();
        Map<String, String> map = new HashMap<String, String>();
        //取总记录条数
        Integer pageCount = Integer.parseInt(super.getUnique(Cms_Users.class,map,where.toString()).toString());
        
        return pageCount;
    }
}
