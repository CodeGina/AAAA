package user.web.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.UserDao;
import user.domain.Hobby;
import user.domain.UserAndHobby;
import user.domain.UserHobby;
import user.domain.User;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class UserServlet extends BaseServlet {
	private UserDao userDao = new UserDao();

	/**
	 * 添加用户
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.封装表单数据到User对象中
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int usertype = Integer.parseInt(request.getParameter("usertype"));
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String introduction = request.getParameter("introduction");
		String[] hobbys = request.getParameterValues("hobby");
		List<Integer> hidList = new ArrayList();
		for (int i = 0; i < hobbys.length; i++) {
			hidList.add(Integer.parseInt(hobbys[i]));
		}
		UserAndHobby userForm = new UserAndHobby(0, username, password,
				usertype, gender, null, birthday, email, introduction);
		// 2.使用UserDao完成业务
		userDao.addUser(userForm);
		int uid = userDao.getLastUid();
		userForm.setUid(uid);
		for (int i = 0; i < hidList.size(); i++) {
			userDao.addHobby(uid, hidList.get(i));
		}
		// System.out.println(userForm);
		return this.searchAll(request, response);
		/*
		 * 你的添加页面表单提交到这个方法，这个方法要添加完用户之后 把用户信息返回要用户列表界面，但是你只是返回那个界面，并没有查询用户信息
		 * 这里通过调用searchAll方法，查询用户信息，并把数据放进request中
		 * 然后通过searchAll方法的返回值，让这个方法转发到用户列表页面
		 */

	}

	/**
	 * 查询所有用户
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String searchAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<UserAndHobby> list = new ArrayList();
		List<User> userList = userDao.userList();
		for (User userPojo : userList) {
			int uid = userPojo.getUid();
			List<Hobby> hobbyList = userDao.HobbyList(uid);
			UserAndHobby user = new UserAndHobby(uid, userPojo.getUsername(),
					userPojo.getPassword(), userPojo.getUsertype(),
					userPojo.getGender(), hobbyList, userPojo.getBirthday(),
					userPojo.getEmail(), userPojo.getIntroduction());
			list.add(user);
		}
		System.out.println(list);
		request.setAttribute("list", list);
		return "f:/jdbc_users/userAdmin.jsp";
	}

	/**
	 * 修改用户信息先行步骤
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updatepre(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));// 获取该用户的uid
		User userPojo = userDao.findUid(uid);
		List<Hobby> hobbyList = userDao.HobbyList(uid);
		UserAndHobby user = new UserAndHobby(uid, userPojo.getUsername(),
				userPojo.getPassword(), userPojo.getUsertype(),
				userPojo.getGender(), hobbyList, userPojo.getBirthday(),
				userPojo.getEmail(), userPojo.getIntroduction());
		request.setAttribute("update", user);
		return "f:/jdbc_users/userUpdate.jsp";
	}

	/**
	 * 修改用户信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String update(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));// 获取该用户的uid
		// UserAndHobby user = CommonUtils.toBean(request.getParameterMap(),
		// UserAndHobby.class);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int usertype = Integer.parseInt(request.getParameter("usertype"));
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String introduction = request.getParameter("introduction");

		String[] hobbys = request.getParameterValues("hobby");
		List<Integer> hidList = new ArrayList();
		for (int i = 0; i < hobbys.length; i++) {
			hidList.add(Integer.parseInt(hobbys[i]));
		}
		// System.out.println(hidList);
		UserAndHobby userForm = new UserAndHobby(uid, username, password,
				usertype, gender, null, birthday, email, introduction);

		userDao.updateUser(userForm);
		userDao.deleteHobby(uid);
		for (int i = 0; i < hidList.size(); i++) {
			userDao.addHobby(uid, hidList.get(i));
		}
		// userForm.setHobby(hidList);

		return this.searchAll(request, response);
	}

	/**
	 * 删除用户信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String delete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		userDao.delete(uid);
		return this.searchAll(request, response);
	}

	/**
	 * 按用户名模糊查询
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String searchUserName(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 获取文本框的值
		String username = request.getParameter("value");
		List<User> userList = userDao.searchUserName(username);

		List<UserAndHobby> list = new ArrayList();
		for (User userPojo : userList) {
			int uid = userPojo.getUid();
			List<Hobby> hobbyList = userDao.HobbyList(uid);
			UserAndHobby user = new UserAndHobby(uid, userPojo.getUsername(),
					userPojo.getPassword(), userPojo.getUsertype(),
					userPojo.getGender(), hobbyList, userPojo.getBirthday(),
					userPojo.getEmail(), userPojo.getIntroduction());
			list.add(user);
		}
		request.setAttribute("list", list);
		return "f:/jdbc_users/userAdmin.jsp";
	}

	public String searchUserType(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 获取文本框的值
		String value = request.getParameter("value");
		if(value == "管理员"){
			value = "1";
		}
		if(value == "普通用户"){
			value = "2";
		}
		int num = Integer.parseInt(value);
		List<User> userList = userDao.searchUserType(num);

		List<UserAndHobby> list = new ArrayList();
		for (User userPojo : userList) {
			int uid = userPojo.getUid();
			List<Hobby> hobbyList = userDao.HobbyList(uid);
			UserAndHobby user = new UserAndHobby(uid, userPojo.getUsername(),
					userPojo.getPassword(), userPojo.getUsertype(),
					userPojo.getGender(), hobbyList, userPojo.getBirthday(),
					userPojo.getEmail(), userPojo.getIntroduction());
			list.add(user);
		}
		request.setAttribute("list", list);
		return "f:/jdbc_users/userAdmin.jsp";
	}

}
