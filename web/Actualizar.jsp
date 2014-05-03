<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" %>

<%! int clave=0; %>

<%

// codigo del evento BUSQUEDA y recordar construir una nueva forma dinamica

if(request.getParameter("BUSCAR") != null)

{

Connection canal = null;

ResultSet tabla= null;

Statement instruccion=null;

String strcon = "jdbc:odbc:dsnmibase";


try {

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();

canal=DriverManager.getConnection(strcon);

instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

clave = Integer.parseInt(request.getParameter("CLAVEB"));

String q="select * from mitabla where clave="+clave;

try { tabla = instruccion.executeQuery(q);

tabla.next();

out.println("<FORM ACTION=Actualizar.jsp METHOD=POST>");

out.println("Nombre:<INPUT TYPE=TEXT NAME=Nombre VALUE= "+ tabla.getString(2)+ "><BR>");

out.println("Edad:<INPUT TYPE=TEXT NAME=Edad VALUE= "+ tabla.getString(3)+ "><BR>");

out.println("<INPUT TYPE=SUBMIT NAME=EDITAR VALUE=EDITAR><BR>");

tabla.close();instruccion.close();canal.close();

} catch(SQLException e) {} catch(Exception ex){};

}; // fin evento buscar

// codigo de evento EDICION

String temp2=request.getParameter("EDITAR");

if(temp2==null)temp2=" ";

if(temp2.compareTo("EDITAR")==0)

{

String nombre,q ;

int edad;

Connection canal = null;

ResultSet tabla= null;

Statement instruccion=null;

String strcon = "jdbc:odbc:dsnmibase";

try {

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

canal=DriverManager.getConnection(strcon);

instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

try {

tabla = instruccion.executeQuery("select * from mitabla");

} catch(SQLException e) {};

nombre = request.getParameter("NOMBRE");

edad = Integer.parseInt(request.getParameter("EDAD"));

q = "UPDATE mitabla SET "+ "NOMBRE='"+ nombre+ "', EDAD="+ edad+" WHERE clave=" + clave+";";

try{instruccion.executeUpdate(q); }catch(SQLException e) {};

try {tabla.close();instruccion.close();canal.close();} catch(SQLException e) {};

out.println("REGISTRO EDITADO");

}; // fin evento editar

// construyendo forma dinamica

out.println("<FORM ACTION=Actualizar.jsp METHOD=post>");

out.println("CLAVE EDITAR:<INPUT TYPE=TEXT NAME=CLAVEB><BR>");

out.println("<INPUT TYPE=SUBMIT NAME=BUSCAR VALUE=BUSCAR ><BR>");

out.println("</FORM>");

%>


