<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<%

Connection canal = null;

ResultSet tabla= null;

Statement instruccion=null;

String strcon = "jdbc:odbc:dsnmibase";

if(request.getParameter("OK") != null)

{

try {

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();

canal=DriverManager.getConnection(strcon);

instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

// preparando condicion de eliminacion

int clave = Integer.parseInt(request.getParameter("CLAVEB"));

// construyendo select con condicion eliminacion SQL DELETE

String q="delete from mitabla where clave = "+clave;

// mandando SQL a tabla en disco

try { instruccion.executeUpdate(q);

// avisando

out.println("registro eliminado");

} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {}

catch(java.lang.NullPointerException e){};

try {

// no ocupa cerrar tabla(), no se leyo (select) un resultset

// la eliminacion fue directa en disco

instruccion.close();canal.close();} catch(SQLException e) {};

};

// construyendo forma dinamica

out.println("<FORM ACTION=Eliminar.jsp METHOD=post>");

out.println("CLAVE ELIMINAR:<INPUT TYPE=TEXT NAME=CLAVEB><BR>");

out.println("<INPUT TYPE=SUBMIT NAME=OK VALUE=ELIMINAR><BR>");

out.println("</FORM>");

%>
