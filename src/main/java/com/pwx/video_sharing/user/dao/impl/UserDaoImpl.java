package com.pwx.video_sharing.user.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.pwx.video_sharing.common.baseUtil.BaseDao;
import com.pwx.video_sharing.user.dao.UserDao;
import com.pwx.video_sharing.user.entity.Roles;
import com.pwx.video_sharing.user.entity.User_Role;
import com.pwx.video_sharing.user.entity.Users;


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
public class UserDaoImpl extends BaseDao implements UserDao {
	
    
    public String addUser(Users user) {
        String pKey = super.add(user);
        return pKey;
    }
    
    public void delUser(Users user) {
        super.delete(user);
    }

    @SuppressWarnings("unchecked")
	@Override
	public Users findUserByuserName(String username,String password) {
		
	    String hql = "select e from Users e where 1 = 1 ";
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
        List<Users> users = (List<Users>) super.queryObject(hql,maps); 
		
		if(users!=null && !users.isEmpty() && users.size()>0){
		    super.getHibernateTemplate().evict(users.get(0));
			return users.get(0);
		}else{
			return null;
		}
	}

    @Override
    public void updateUser(Users user) {
        super.update(user);
    }
    
    public Users queryUsersMessage(String id) {
        String hql = "SELECT id, loginName, nickName, contactName, contactProfile, contactPhone, "
        		+ "contactCellPhone, contactEmail, contactCardId, contactCardImgSrc,"
        		+ "enterpriseName, enterprisePhone, enterpriseDetail, enterpriseAddressProvince, "
        		+ "enterpriseAddressCity, enterpriseAddressArea, enterpriseBusinessCircle, enterpriseAddressDetail,"
        		+ "enterpriseInfoDetail, businessLicense, businessLicenseScan, enterpriseJGH, enterpriseLogo,"
        		+ "businessNameCardScan, businessNameCardScan1, businessHours, userCode, webSite, remark, contactBackCardImgSrc"
        		+ " FROM Users u WHERE id = :id";
        Map<String,String> map = new HashMap<String, String>();
        map.put("id", id);
        Object object = super.getUnique(hql, map);
        Object[] obj = (Object[]) object;
        Users users = new Users();
        users.setId((String)obj[0]);
        users.setLoginName((String)obj[1]);
        users.setNickName((String)obj[2]);
        users.setContactName((String)obj[3]);
        users.setContactProfile((String)obj[4]);
        users.setContactPhone((String)obj[5]);
        users.setContactCellPhone((String)obj[6]);
        users.setContactEmail((String)obj[7]);
        users.setContactCardId((String)obj[8]);
        users.setContactCardImgSrc((String)obj[9]);
        users.setEnterpriseName((String)obj[10]);
        users.setEnterprisePhone((String)obj[11]);
        users.setEnterpriseDetail((String)obj[12]);
        users.setEnterpriseAddressProvince((String)obj[13]);
        users.setEnterpriseAddressCity((String)obj[14]);
        users.setEnterpriseAddressArea((String)obj[15]);
        users.setEnterpriseBusinessCircle((String)obj[16]);
        users.setEnterpriseAddressDetail((String)obj[17]);
        users.setEnterpriseInfoDetail((String)obj[18]);
        users.setBusinessLicense((String)obj[19]);
        users.setBusinessLicenseScan((String)obj[20]);
        users.setEnterpriseJGH((String)obj[21]);
        users.setEnterpriseLogo((String)obj[22]);
        users.setBusinessNameCardScan((String)obj[23]);
        users.setBusinessNameCardScan1((String)obj[24]);
        users.setBusinessHours((String)obj[25]);
        users.setUserCode((String)obj[26]);
        users.setWebSite((String)obj[27]);
        users.setRemark((String)obj[28]);
        users.setContactBackCardImgSrc((String)obj[29]);
        return users;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Users> getPageInfoList(Integer page,Integer pagesize) {
        String hql = "from Users where 1=1";//and contact_Name = ?
        Map<String,String> map = new HashMap<String, String>();
        
        List<Users> users =  (List<Users>) super.pageQuery(hql, page, pagesize,map);
        return users;
    }

    @Override
    public Users findUserById(String id) {
        Users users = (Users) getById(Users.class, id);
        return users;
    }

    @Override
    public String addUserRole(String userid,int roleid) {
//        throw NullPointerException;
        User_Role user_role = new User_Role();
        Users users = (Users) getById(Users.class, userid);
        Roles roles = (Roles) getById(Roles.class, roleid);
        user_role.setUsers(users);
        user_role.setRoles(roles);
        String pKey = super.add(user_role);
        return pKey;
    }

    @Override
    public Users findUserByuserName(String username) {
    	Users users = findUserByuserName(username,null);
    	super.getHibernateTemplate().evict(users);
        return users;
    }

    @Override
    public void updateUserAccUUID(String userId, String accUUID) {
        String hql ="update Users u set accUUID = :accUUID where id = :userId";
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("accUUID", accUUID);
        map.put("userId", userId);
        super.update(hql, map);
    }

    @Override
    public Users findUserByPhone(String phone) {
        String hql = "from Users e where 1 = 1 ";
        Map<String,String> maps = new HashMap<String, String>();
        if(phone != null && !"".equals(phone)){
            hql = hql+" and e.enterprisePhone = :phone ";
            maps.put("phone", phone);
        }
        //根据不同条件进行查询返回
        List<Users> users = (List<Users>) super.queryObject(hql,maps); 
        
        if(users!=null && !users.isEmpty() && users.size()>0){
            super.getHibernateTemplate().evict(users.get(0));
            return users.get(0);
        }else{
            return null;
        }
    }
    @Override
    public Users findByPhone(String phone) {
        Users u=null;
        String hql="from Users u where 1=1 and u.enterprisePhone=:enterprisePhone";
        Map<String,String> map=new HashMap<String,String>();
        map.put("enterprisePhone",phone);
        List<Users> us=(List<Users>)super.queryObject(hql, map);
        if(us!=null&&us.size()!=0){
            u=us.get(0);
        }
        return u;
    }
    @Override
    public Users findByEmail(String email) {
        Users u=null;
        String hql="from Users u where 1=1 and u.contactEmail=:email";
        Map<String,String> map=new HashMap<String,String>();
        map.put("email",email);
        List<Users> us=(List<Users>)super.queryObject(hql, map);
        if(us!=null&&us.size()!=0){
            u=us.get(0);
        }
        return u;
    }

    @Override
    public Users findByUserCode(String userCode) {
        Users u=null;
        String hql="from Users u where 1=1 and u.userCode=:userCode";
        Map<String,String> map=new HashMap<String,String>();
        map.put("userCode",userCode);
        List<Users> us=(List<Users>)super.queryObject(hql, map);
        if(us!=null&&us.size()!=0){
            u=us.get(0);
        }
        return u;
    }
    
    @Override
    public void updateMerchantMessage(Users user) {
    	String hql = "UPDATE Users SET "
    			+ "enterpriseDetail = :enterpriseDetail,"
    			+ "editEnterpriseDetail = :editEnterpriseDetail"
				+ " WHERE id = :id";
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("enterpriseDetail", user.getEnterpriseDetail());
    	map.put("editEnterpriseDetail", user.getEditEnterpriseDetail());
    	map.put("id", user.getId());
    	super.update(hql, map);
    }
}
