<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			//String sql = "select * from qbank where ques like('% ? %')";
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ak","root","");
			Statement stmt = conn.createStatement();
			ResultSet rs =stmt.executeQuery("SELECT * FROM  qbank  WHERE ques like('%"+request.getParameter("reqname")+"%') or ans like('%"+request.getParameter("reqname")+"%')");
			//stmt.setString(0,request.getParameter("reqname"));
			
			// =stmt.executeQuery();
			int rss=0;
			while(rs.next())
			{
					out.print(rs.getString(3));
					out.print("\n\n\n");
					rss=1;
			}
			if(rss==0)
			out.print("Sorry Searching failed..!");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
</body>
</html>