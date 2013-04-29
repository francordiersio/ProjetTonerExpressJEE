<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="pck.metier.Imprimante"%>
<%@page import="java.util.Vector"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<H2><u>Toner Express </u></H2> 
<% 	Vector<Imprimante> lesImprimantes = (Vector<Imprimante>) request.getAttribute("lesImprimantes"); %>
<form method="get">
<table>
	<tr>
		<td>Choix d'une imprimante</td>
		<td><select name=chxImprimante>
		<% 	int cpt=0;
			   for (Imprimante uneImprimante : lesImprimantes) 
			    { 

					out.println("<option value="+cpt+">"+uneImprimante.toString()+"</option>");
					cpt++;
				}

		%>
			</select>
		</td>
		<td><input type="submit" value="Valider">
		</td>
	</tr>
</table>
</form>
<% 
// A améliorer : chxImprimante ne mémorise pas un objet Imprimante mais un string (la ref) du au toString()?
// On repasse donc toute la collection
if (request.getParameter("chxImprimante")!=null)
{	
	
//for (Imprimante i : lesImprimantes) 
//	{ 
//		if (i.getRefImprimante().equals(request.getParameter("chxImprimante")))
//		{ 
	int nb = Integer.parseInt(request.getParameter("chxImprimante"));

%>
			<center>Pour l'imprimante <b><%= lesImprimantes.get(nb) %>, il existe <font color=red><%= lesImprimantes.get(nb).getNbCartouchesCompatibles() %> </b></font> cartouche(s) compatible(s)</center>
<% 	
//		}
//	}
}
%>
<br>
<br>
<a href="/TonerExpress/">Retour</a>
</body>
</html>