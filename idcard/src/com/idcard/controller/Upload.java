package com.idcard.controller;
import java.io.IOException;
import java.util.Iterator;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.jni.File;
/**
 * 
 * @author ZHB
 *
 */
@WebServlet("/fileUpload")//定义访问路径
public class Upload extends HttpServlet{
	//获取上传文件
	//前后交互实现三步曲1.extends HttpSerlet类2.定义访问路径3.实现交互方法
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
		req.setCharacterEncoding("UTF-8");//设置上传文件的编码
		resp.setCharacterEncoding("UTF-8");
		String fileName=null;
		//判断是否为文件上传表单
		boolean flag=ServletFileUpload.isMultipartContent(req);
			try {
				if(flag){
					//构建文件上传对象
					DiskFileItemFactory factory = new DiskFileItemFactory();
					ServletFileUpload upload = new ServletFileUpload(factory);
					//创建迭代器
					Iterator<FileItem> items = upload.parseRequest(req).iterator();
				while(items.hasNext()){
					FileItem item = items.next();
					//获取文件名称
					fileName=item.getName();
					//定义上传路径
					String filePath=req.getRealPath("upload");
					java.io.File file=new java.io.File(filePath);
					//判断文件是否存在，如不存在则创建
					if(!file.exists()){
						file.mkdirs();
					}
					//上传文件(自动生成返回值对象快捷键Alt+shift+L)
					java.io.File uploadFile = new java.io.File(fileName+"/"+fileName);
					item.write(uploadFile);
					
					
				}
			}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();//打印异常
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//响应，将上传的文件返回前台页面
			resp.getWriter().print(fileName);;
			
		}
	}
	
	

