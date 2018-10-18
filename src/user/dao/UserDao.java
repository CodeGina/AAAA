package user.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import user.domain.Hobby;
import user.domain.UserAndHobby;
import user.domain.UserHobby;
import user.domain.User;
import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class UserDao {
	private QueryRunner qr = new TxQueryRunner();
	
	/**
	 * 新添用户
	 * @param user
	 */
	public void addUser(UserAndHobby user) {
		String sql = "insert into t_user(uid,username,password,usertype,gender,birthday,email,introduction) values(?,?,?,?,?,?,?,?)";
		Object[] params = {
				user.getUid(),
				user.getUsername(),
				user.getPassword(),
				user.getUsertype(),
				user.getGender(),
				user.getBirthday(),
				user.getEmail(),
				user.getIntroduction()
		};
		try {
			qr.update(sql,params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} 
	}
	public int getLastUid(){
		String sql = "select max(uid) from t_user";
		try {
			Number number = (Number) qr.query(sql, new ScalarHandler());
			return number.intValue();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public void addHobby(int uid,int hid){
		String sql = "insert into t_user_hobby(uid,hid) values(?,?)";
		Object[] params = {uid, hid};
		try {
			qr.update(sql,params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} 
	}
	
	/**
	 * 按用户名模糊查询
	 * @param username
	 * @return
	 */
	public List<User> searchUserName(String username) {
		String sql = "SELECT * FROM t_user WHERE username LIKE '%"+ username +"%'";
		List<User> beanList;
		try {
			beanList =  qr.query(sql, new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return beanList;
	}
	
	/**
	 * 按用户类型查询
	 * @param usertype
	 * @return
	 */
	public List<User> searchUserType(int usertype) {
		String sql = "select * from t_user where usertype = " + usertype;
		List<User> beanList;
		try {
			beanList = qr.query(sql, new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return beanList;
	}
	
	/**
	 * 按爱好查询
	 * @param hobby
	 * @return
	 */
//	public UserAndHobby searchHobby(String hobby) {
//		String sql = "select * from t_user where hobby = ?";
//		try {
//			return qr.query(sql, new BeanHandler<UserAndHobby>(UserAndHobby.class),hobby);
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
	
	/**
	 * 按性别查询
	 * @param gender
	 * @return
	 */
//	public UserAndHobby searchGender(String gender) {
//		String sql = "select * from t_user where gender = ?";
//		try {
//			return qr.query(sql, new BeanHandler<UserAndHobby>(UserAndHobby.class),gender);
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<User> userList(){
		String sql = "select * from t_user";
		List<User> beanList;
		try {
			beanList = qr.query(sql, new BeanListHandler<User>(User.class));
			//System.out.println(beanList);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return beanList;
	}
	
	public List<Hobby> HobbyList(int uid){
		String sql = "select * from t_hobby where hid IN(select hid from t_user_hobby where uid="+ uid + ")";
		List<Hobby> beanList;
		try {
			beanList = qr.query(sql, new BeanListHandler<Hobby>(
					Hobby.class));
			//System.out.println(beanList);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return beanList;
	}
	
	public User findUid(int uid){
		String sql = "select * from t_user where uid = ?";
		User user;
		try {
			user = qr.query(sql, new BeanHandler<User>(User.class),uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return user;
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 */
	public void updateUser(UserAndHobby user) {
		String sql = "update t_user set username=?, password=?, usertype=?," +
				"gender=?,birthday=?,email=?,introduction=? where uid=?";
		Object[] params = {
				user.getUsername(),
				user.getPassword(),
				user.getUsertype(),
				user.getGender(),
				user.getBirthday(),
				user.getEmail(),
				user.getIntroduction(),
				user.getUid()
		};
		
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//先删除原先的hobby
	public void deleteHobby(int uid){
		String sql = "delete from t_user_hobby where uid = ?";
		try {
			qr.update(sql,uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} 
	}
	
	
	/**
	 * 删除用户信息
	 * @param uid
	 */
	public void delete(String uid) {
		String sql = "delete from t_user where uid=?";
		try {
			qr.update(sql,uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
}
