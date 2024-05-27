<%@ page import="java.sql.*"%>


<%
String Fname=request.getParameter("fname");
String Lname=request.getParameter("lname");
String uname=request.getParameter("uname");
String email=request.getParameter("email");
String phone=request.getParameter("pnumber");
String gender=request.getParameter("gender");
String password=request.getParameter("password");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manohar");
		PreparedStatement ps=conn.prepareStatement("insert into register values(?,?,?,?,?,?,?)");
		ps.setString(1,Fname);
		ps.setString(2,Lname);
		ps.setString(3,uname);
		ps.setString(4,email);
		ps.setString(5,phone);
		ps.setString(6,gender);
		ps.setString(7,password);
		int i=ps.executeUpdate();
		if(i!=0){
			out.println("registration is completed");
			response.sendRedirect("login.html");
		}
		else{
			out.println("once again please check the information");
		}
	}
	catch(Exception e){
		out.print(e);
	}

%>
		
		