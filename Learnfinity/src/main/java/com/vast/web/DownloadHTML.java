package com.vast.web;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadHTML implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment");
		FileInputStream fis;
		try {
			fis = new FileInputStream("D:\\JEE\\htmlcss.pdf");
			BufferedInputStream bis=new BufferedInputStream(fis);
			byte arr[]=new byte[fis.available()];
			bis.read(arr);
			ServletOutputStream out=response.getOutputStream();
			out.write(arr);
			out.close();
			bis.close();
			fis.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "htmlcsscourse.jsp";
	}

}
