<?php
	session_start();
	$_SESSION['login_status1']=false;
	$_SESSION['login_status2']=false;	
    session_destroy();
    header('location:index.php');
?>