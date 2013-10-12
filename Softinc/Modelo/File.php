<?php


class File {
    

    function guardar($contenido,$archivo){
        $fp = fopen($archivo,"a");
        $array=$this->getContenido($contenido);
        for($i=0; $i<=count($array)-1 ;$i++ ){
        fwrite($fp, $array[$i]. PHP_EOL);
        
        }
        fclose($fp);
    }
    function getContenido($variable){
    $contenedor=array();

    $toque=strtok($variable, " ");
        while ($toque != false) {
            $contenedor[]=$toque;
            $toque = strtok(" ");
        }
    return $contenedor;
    }


}
?>
