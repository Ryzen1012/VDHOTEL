<?php

    function adminLogin(){
        session_start();
        if (isset($_SESSION['adminLogin']) && $_SESSION['adminLogin'] == true)
        {
            echo"
        <script>wirdow.location.href='index.php'</script>
        ";
        }
        session_regenerate_id(true);
    }


    function redirect($url){
        echo"
        <script>wirdow.location.href='$url'</script>
        ";
    }

    function alert($type,$msg){
      
        $bs_class = ($type == "success") ? "alert-success" : "alert-danger";
      
        echo <<<ALERT
        <div class="alert $bs_class alert-warning alert-dismissible fade show custom-alert" role="alert">
            <stron class="me-3">$msg</strong> 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        ALERT;
    }




?>