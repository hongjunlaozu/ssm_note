package com.lanqiao.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanqiao.pojo.TbBlog;
import com.lanqiao.pojo.TbType;
import com.lanqiao.pojo.TbUser;
import com.lanqiao.service.ITbBlogService;
import com.lanqiao.util.Commons;

@Controller
@RequestMapping("/blog")
public class BlogController {
	
	@Autowired
	private ITbBlogService blogService;
	
	@RequestMapping("/addBlog")
	public String addBlog(TbBlog blog,String editorValue,HttpSession session){
		
		blog.setContent(editorValue);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		blog.setDdate(format.format(date));
		
		TbUser tbuser = (TbUser)session.getAttribute("tbuser");
		blog.setUsername(tbuser.getUsername());
		blogService.insert(blog);
		return "redirect:/blog/selectBlog.do";
	}
	
	@RequestMapping("/selectBlog")
	public String selectBlog(HttpSession session,Model model,TbBlog blog,Integer cp){
		TbUser tbuser = (TbUser)session.getAttribute("tbuser");
		
		blog.setUsername(tbuser.getUsername());
		
		if(cp==null){
			cp=1;
		}
		
		PageHelper.startPage(cp, Commons.pageSize);
		List<TbBlog> blogs = blogService.selectAll(blog);
		PageInfo<TbBlog> page = new PageInfo<TbBlog>(blogs);
		
		model.addAttribute("page", page);
		
		List<TbType> types = blogService.selectTypeCount(tbuser.getUsername());
		
		List<Map> dates = blogService.selectDdateCount(tbuser.getUsername());
		model.addAttribute("types", types);
		model.addAttribute("dates", dates);
		model.addAttribute("blog", blog);
		
		return "/pages/index.jsp";
	}
	
	@RequestMapping("/info.do")
	public String info(Integer id,Model model){
		TbBlog blog = blogService.selectByPrimaryKey(id);
		model.addAttribute("blog",blog);
		return "/pages/info.jsp";
	}

}













