<!DOCTYPE html>
<html>
  <head>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <!--Let browser know websi  te is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>
      Blog
    </title>
  </head>
  <body>
    <?php
      session_start();
      $link=mysql_connect('localhost','root','');
      $db=mysql_select_db("blog",$link) or die("Error in Database");
    ?>    
  	<?php
  	  if(isset($_SESSION['login_status2'])==false)
  	  {
  	  	echo "You are not logged in.";
  	  	//POP UP
  	  	header('location:index.php');
  	  }
  	  echo "Welcome Admin";
    ?>
    <form action="" method="post">
    <button type="submit" name="logout">LOGOUT</div>
    <?php
      if(isset($_POST["logout"]))
      {
        $_SESSION['login_statu2']=false;
        session_destroy();
        header('location:index.php');
      }
  	?>
  	<header>
  	
  	</header>
  	<section>

  	</section>
    <footer>
      
    </footer>
    <!--Import jQuery before materialize.js-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
  </body>
</html>