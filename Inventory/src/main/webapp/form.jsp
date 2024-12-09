<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %> 
<%@ page import="javax.swing.*"%> 
<%
	//RECORD OF SAVE
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
		String t7=request.getParameter("t7");
		String t8=request.getParameter("t8");
		String t9=request.getParameter("t9");
		String t10=request.getParameter("t10");
		String t11=request.getParameter("t11");

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
			PreparedStatement psmt=conn.prepareStatement("insert into getit values(?,?,?,?,?,?,?,?,?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.setString(4,t4);
			psmt.setString(5,t5);
			psmt.setString(6,t6);
			psmt.setString(7,t7);
			psmt.setString(8,t8);
			psmt.setString(9,t9);
			psmt.setString(10,t10);
			psmt.setString(11,t11);
			psmt.executeQuery();
			out.println("<script>alert('Your data is succesfully saved...')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}// END OF SAVE
	// delete the record
		if(btnval.equalsIgnoreCase("delete"))
		{
			String t1=request.getParameter("t1");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
				PreparedStatement psmt=conn.prepareStatement("delete from getit where name=?");
				psmt.setString(1,t1);
				psmt.executeQuery();
				out.println("<script>alert('Your data is Deleted succesfully...')</script>");
			}
			catch(Exception e)
			{
				out.println(e.toString());
			}
		}//End of delete

	//Record of Allsearch
		if(btnval.equalsIgnoreCase("search"))
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
				Statement smt=conn.createStatement();
				ResultSet rs=smt.executeQuery("select * from getit");
				%>
				<table border=2>
				<tr>
					<th>NAME</th>
					<TH>D.O.B</TH> 
					<TH>GENDER</TH>
					<th>FATHER NAME</th>
					<TH>ADDRESS</TH> 
					<TH>CONTACT ID</TH>
					<th>EMAIL ID</th>
					<TH>EDUCATION</TH> 
					<TH>SCHOOL/COLLEGE</TH>
					<th>COURSE</th>
					<TH>DATE</TH> 
				</tr>
				<%
				while(rs.next())
				{
				%>
					<tr>
						<th><%=rs.getString(1)%></th>
						<th><%=rs.getString(2)%></th>
						<th><%=rs.getString(3)%></th>
						<th><%=rs.getString(4)%></th>
						<th><%=rs.getString(5)%></th>
						<th><%=rs.getString(6)%></th>
						<th><%=rs.getString(7)%></th>
						<th><%=rs.getString(8)%></th>
						<th><%=rs.getString(9)%></th>
						<th><%=rs.getString(10)%></th>
						<th><%=rs.getString(11)%></th>
					</tr>
				<%}%>
				<input type=button value="print" onclick="window.print()">
				</table>
			<%}
			catch(Exception e)
			{
				out.println(e.toString());
			}
		}//End of all search
	%>
</body>
</html>