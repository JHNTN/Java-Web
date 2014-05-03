<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<%

if(request.getParameter("GRABAR") != null)

{

// objetos de enlace

Connection canal = null;

ResultSet tabla= null;

Statement instruccion=null;

String strcon = "jdbc:odbc:dsnmibase";

// abriendo canal o enlace en su propio try-catch

try {

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver") ;

canal=DriverManager.getConnection(strcon);

instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,

ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

//cargando los campos a grabar

// excepto clave porque en mysql es de tipo auto-increment

int clave = Integer.parseInt(request.getParameter("Clave"));

String nombre = request.getParameter("Nombre");


int edad = Integer.parseInt(request.getParameter("Edad"));


// insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);

String q="insert into mitabla(clave,nombre,edad) values('" +clave+"','"+nombre+"','"+edad+"')";

try {

// agregando renglon (insert)

int n=instruccion.executeUpdate(q);

//avisando que se hizo la instruccion

out.println("REGISTRO INSERTADO");

} catch(SQLException e) {out.println(e);};

try{

// tabla.close();

instruccion.close();

canal.close();

} catch(SQLException e) {out.println(e);};

};

// construyendo forma dinamica

out.println("<FORM ACTION=Insertar.jsp METHOD=post>");

out.println("Clave :<INPUT TYPE=TEXT NAME=Clave><BR>");

out.println("Nombre :<INPUT TYPE=TEXT NAME=Nombre><BR>");

out.println("Edad:<INPUT TYPE=TEXT NAME=Edad><BR>");

out.println("<INPUT TYPE=SUBMIT NAME=GRABAR VALUE=INSERTAR ><BR>");

out.println("</FORM>");

%>

