<?php
session_start();
//$_SESSION["ci_usuario"];
?>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="1.js" language="JavaScript"></script>
        <link rel="StyleSheet" href="1.css" type="text/css">
    </head>
    <body>
        bienvenid@ a juez SOFT-INC: <?php echo $_SESSION["nombre_usuario"];  ?><br>
        

<h1>Seccion COMITE ACADEMICO.</h1>
<div id="menu">
<p><a id="enlace1" href="CrearProblema.html">CREAR PROBLEMA</a></p>
<p><a id="enlace2" href="SubirCA.html">SUBIR ARCHIVOS</a></p>
</div>
<div id="cambio"> QUE DESEA HACER</div>
</body>
        
</html>
