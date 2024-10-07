package com.vast.util;

import java.util.ResourceBundle;

public class ExamDbConstants {
	public static final String DRIVER;
	public static final String URL;
	public static final String UNAME;
	public static final String PSWD;
	
	static {
		ResourceBundle rb=ResourceBundle.getBundle("db");
		DRIVER=rb.getString("driver");
		URL=rb.getString("url");
		UNAME=rb.getString("user");
		PSWD=rb.getString("pswd");
	}
	
}
