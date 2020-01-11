package com.lanqiao.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.lanqiao.pojo.TbType;
import com.lanqiao.pojo.TbUser;
import com.lanqiao.service.ITbTypeService;
import com.lanqiao.service.ITbUserService;
import com.lanqiao.util.Commons;
import com.lanqiao.util.EMail;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private ITbUserService tbUserService;
	
	@Autowired
	private ITbTypeService tbTypeService;
	
	@RequestMapping("/login.do")
	public String login(TbUser user,Model model,HttpSession session){
		
		TbUser uu = tbUserService.isActive(user);
		if(uu!=null && uu.getState().equals(Commons.state_no_active)){
			model.addAttribute("mess", "用户名未激活");
			return "/login.jsp";
		}
		
		user.setState(Commons.state_active);
		uu = tbUserService.selectByPrimaryKey(user);
		
		if(uu==null){
			model.addAttribute("mess", "用户名或者密码错误");
			return "/login.jsp";
		}else{
			session.setAttribute("tbuser", uu);
			
			List<TbType> types = tbTypeService.selectAll(uu.getUsername());
			session.setAttribute("types", types);
			return "/blog/selectBlog.do";
		}
		
	}
	
	@RequestMapping("/register.do")
	public String register(TbUser user){
		user.setState(Commons.state_no_active);
		tbUserService.insert(user);
		
		//给用户发送激活邮件
		
		EMail mail = new EMail();
		mail.setSubject("个人云笔记激活邮件");
		String str = "点击如下的链接，激活账号<br> "
				+ "<a href='http://localhost:8086/user/active.do?"
				+ "username="+user.getUsername()+"'>请点击</a>";
		mail.setContent(str);
		//收件人 可以发给其他邮箱(163等) 下同
		mail.setTo(new String[] {user.getEmail()});
		
		//发送邮件
		try {
			mail.sendMessage();
			System.out.println("发送邮件成功！");
		} catch (Exception e) {
			System.out.println("发送邮件失败！");
			e.printStackTrace();
		}
		
		return "/pages/success.html";
		
	}
	
	@RequestMapping("/active.do")
	public String active(TbUser user){
		user.setState(Commons.state_active);
		tbUserService.updateByPrimaryKey(user);
		return "/login.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/validate.do")
	public String validate(String username){
		TbUser user = tbUserService.selectUserByName(username);
		if(user==null){
			return "1";
		}else{
			return "0";
		}
	}
	
	@RequestMapping("/update.do")
	public String update(TbUser user,@RequestParam("file") CommonsMultipartFile file){
		
		try {
			File ff = new File(Commons.upload_path+file.getOriginalFilename());
			file.getFileItem().write(ff);
			user.setImage(Commons.path+file.getOriginalFilename());
			tbUserService.updateByPrimaryKey(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/login.jsp";
		
	}
}









