package com.idcard.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.baidu.aip.ocr.AipOcr;
@WebServlet("/parse")
public class Parseld extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String path=req.getParameter("path");
		String realPath=req.getRealPath(path);
		AipOcr aipOcr = new AipOcr(appId, aipKey, aipToken);
		JSONObject result = aipOcr.idcard(realPath, true,new HashMap<String, String>());
		System.out.println(result);
		resp.getWriter().print(result);;
		
		
	}

}
