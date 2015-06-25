<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Rejestruj</title>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Roboto Condensed:light">
    <style>
	      body {
    	    font-family: 'Roboto Condensed', serif;
        	font-size: 20px;
      		}
    </style>
</head>
<body>
	<table width="900px" align="center" style="margin-top:15px">
		<tr>
		<td>

<div><h1>Zarejestruj nowe konto</h1></div>
<p>
<div style="color:#CF3212">Podaj nowy login</div>
</p>

<p>	
<form action = "RegisterUser" method = "post">

    <table cellpadding="10"><tr>
            <td>Imię:</td>
			<td>
				<input type="text" name="name" required/>
			</td>
		</tr><tr>
		<td>Login:</td>
			<td>
				<input type="text" name="username" required/>
			</td>
		</tr><tr>
		<td>Hasło:</td>
			<td>
				<input type="password" name="password" required/>
			</td>
		</tr><tr>
		<td>Potwierdź hasło:</td>
			<td>
				<input type="password" name="password_confirm" required/>
			</td>
		</tr><tr>
		<td>Podaj email:</td>
			<td>
				<input type="email" name="email" required/>
			</td>
		</tr><tr>
		<td>Wbór konta</td>
				<td>  		
     				<select name = "role">
    					<option value = "user">Konto standardowe</option>
   					<option value = "admin">Konto administratora</option>          
   				</select>
   				</td>
   			</tr><tr>
			<td colspan="2">
				<input type="submit" value="Rejestruj" />
			</td>
		</tr>
	</table>
		
</form>
</p>

<p>
	<a href='index.jsp'>Wróć</a>
</p>

		</td>
		</tr>
	</table>
</body>
</html>