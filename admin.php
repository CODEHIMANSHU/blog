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
    <header>
      <?php
        session_start();
        $link=mysql_connect('localhost','root','') or die(mysql_error());
        $db=mysql_select_db("blog",$link)or die(mysql_error());
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
      <button type="submit" name="logout">LOGOUT</button>
      </form>
      <?php
        if(isset($_POST["logout"]))
        {
          $_SESSION['login_statu2']=false;
          session_destroy();
          header('location:index.php');
        }
    	?> 	
  	</header>
  	<section>
      Add a new Post
      <form action="" method="post">
        <label>Heading</label>
        <input type="text" name="heading" required>
        <label>Content</label>
        <input type="text" name="content" required>
        <button type="submit" name="add">POST</button> 
      </form>
      <?php
        if(isset($_POST["add"]))
        {
          $heading=$_POST["heading"];
          $content=$_POST["content"];
          $date=date("Y-m-d");
          $time=date("H:i:s");
          echo $time;
          $auther=$_SESSION['user'];
          $result=mysql_query("INSERT INTO post VALUES ('','$auther','$date','$time','$heading','$content','0')",$link) or die(mysql_error());
          if($result)
            echo "POST Added Successfully!!!";
        }
      ?>
      <?php
        $posts=mysql_query("SELECT * FROM post ORDER BY date DESC LIMIT 5") or die(mysql_error());
        while($post=mysql_fetch_assoc($posts))
        {
          echo "Author: ", $post["auther"];
          echo " Date: ", $post["date"];
          echo " Time: ", $post["time"];
          echo " Heading: ", $post["heading"];
          echo " Content: ", $post["content"];
          echo " Likes: ", $post["likes"], "<br>";
          $id=$post["id"];
          $comments=mysql_query("SELECT * FROM comments WHERE id='$id' LIMIT 5") or die(mysql_error());
          $count=mysql_num_rows($comments);
          if($count)
            echo " Comments: ";
          while($comment=mysql_fetch_assoc($comments))
          {
            echo "User: ", $comment["username"];
            echo " ", $comment["comment"], " ";
          }
          echo "<br><br>";
        }
      ?>      
  	</section>
    <footer>
      
    </footer>
    <!--Import jQuery before materialize.js-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
  </body>
</html>