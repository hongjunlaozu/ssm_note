package com.lanqiao.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanqiao.pojo.TbType;
import com.lanqiao.pojo.TbUser;
import com.lanqiao.service.ITbTypeService;

@Controller
@RequestMapping("/type")
public class TypeController {
	
	@Autowired
	private ITbTypeService typeService;
	
	@RequestMapping("/addtype")
	public String addtype(TbType type,HttpSession session){
		
		TbUser tbuser = (TbUser)session.getAttribute("tbuser");
		type.setUsername(tbuser.getUsername());
		typeService.insert(type);
		
		return "/type/typelist.do";
	}
	
	@RequestMapping("/typelist")
	public String typelist(HttpSession session,Model model){
		TbUser tbuser = (TbUser)session.getAttribute("tbuser");
		List<TbType> types = typeService.selectAll(tbuser.getUsername());
		model.addAttribute("types", types);
		return "/pages/type.jsp";
	}
	
	@RequestMapping("/delete")
	public String delete(Integer id){
		
		typeService.deleteByPrimaryKey(id);
		
		return "/type/typelist.do";
	}
	
	@RequestMapping("/toupdate")
	public  String toupdate(Integer id,Model model){
		TbType type = typeService.selectByPrimaryKey(id);
		model.addAttribute("type", type);
		return "/pages/updateType.jsp";
	}
	
	@RequestMapping("/updatetype")
	public String updatetype(TbType type){
		typeService.updateByPrimaryKey(type);
		
		return "/type/typelist.do";
	}
}







