<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<%
Connection canal = null;
ResultSet tabla = null;
Statement instruccion = null;

String strcon = "jdbc:odbc:dsnmibase";

if(request.getParameter("OK") != null)

{

try {
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver") ;
canal = DriverManager.getConnection("jdbc:odbc:dsnmibase");

instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
ResultSet.CONCUR_UPDATABLE);
}catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

int clave = Integer.parseInt(request.getParameter("CLAVEB"));

String q = "select * from mitabla where clave="+clave;

try { tabla = instruccion.executeQuery(q);

out.println("<TABLE Border=1 CellPadding=1><TR>");
out.println("<th bgcolor=Green>Clave</th><th bgcolor=White>Nombre</th><th bgcolor=Red>Edad</th></TR>");

while(tabla.next() == true) {

out.println("<TR>");
out.println("<TD>"+tabla.getString(1)+"</TD>");
out.println("<TD>"+tabla.getString(2)+"</TD>");
out.println("<TD>"+tabla.getString(3)+"</TD>");
out.println("</TR>"); }; // fin while

out.println("</TABLE></CENTER></DIV></HTML>");
} 
catch(SQLException e) {};
try {tabla.close();instruccion.close();canal.close();} catch(SQLException e) {};
};

out.println("<FORM ACTION=Consultar.jsp METHOD=post>");
out.println("CLAVE BUSCAR:<INPUT TYPE=TEXT NAME=CLAVEB><BR>");
out.println("<INPUT TYPE=SUBMIT NAME=OK VALUE=BUSCAR><BR>");
out.println("</FORM>");

%>
