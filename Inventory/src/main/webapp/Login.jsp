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
	String btnval=request.getParameter("b1");
				if(btnval.equalsIgnoreCase("login"))
				{
					String t1=request.getParameter("t1");
					String t2=request.getParameter("t2");
					int f=0;
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
						Statement smt=conn.createStatement();
						ResultSet rs=smt.executeQuery("select * from login");
						while(rs.next())
						{
					
							if(rs.getString(1).equals(t1))
							{
								if(rs.getString(2).equals(t2))
								{
								    f=1;
								    break;
								}
					        }
						}
						if(f==1)
						{
							out.println("<script>window.open('MYMenu.html','_self')</script>");
						}
						else
						{
							out.println("<script>alert('NOT WELCOME')</script>");
						}
					}
					catch(Exception e)
					{
						out.println(e.toString());
					}
				}
				
			//Register-------------------------------------
			if(btnval.equalsIgnoreCase("register"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
			if(t2.equals(t3)){
				PreparedStatement psmt=conn.prepareStatement("insert into Login values(?,?)");
				psmt.setString(1,t1);
				psmt.setString(2,t3);
				psmt.executeQuery();
				out.println("<script>alert('Registered succesfully ...')</script>");
			}else{
				out.println("<script>alert('Something is Wrong ...')</script>");
			}
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of register

%>
</body>
</html>