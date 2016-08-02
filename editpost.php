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
  <body class="blue-grey lighten-5">
    <header>
      <?php
        session_start();
        $link=mysql_connect('localhost','root','') or die(mysql_error());
        $db=mysql_select_db("blog",$link)or die(mysql_error());
      ?>    
    	<?php
    	  if(isset($_SESSION['login_status2'])==false)
    	  {
    	  	header('location:index.php');
    	  }
      ?>
      <!--navbar-->  
      <nav class="blue-grey darken-1" style="position: fixed; z-index: 7;">
        <div class="nav-wrapper">
          <a class="brand-logo" href="index.php" style="padding-left:10%;">My Blog</a>
          <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="ReachMe.php">Reach Us</a></li>
            <?php
              if(isset($_SESSION['login_status2'])==true):
            ?>
            <li><a href="logout.php">Logout</a></li> 
            <?php 
              endif;
            ?>        
          </ul>
        </div>
      </nav> 
    <br><br><br>
  	</header>
  	<section>
      <div class="container">
        <div class="row">
          <br>
          <a class="waves-effect waves-light btn right" href="admin.php">Back to Homepage</a>
        </div>
        <div class="row">
          <div class="col m2">
            &nbsp;
          </div>
          <div class="col m8  blue-grey lighten-4" style="border-radius: 10px;padding: 0px 30px 10px 30px; margin-top: 50px;">
            <h5 style="margin-top:0px;"><p align="center">Edit Post</p></h5>
            <form action="" method="post" enctype="multipart/form-data">
              <?php echo "<input value='$_SESSION[heading]' type=text name=heading required />" ?>
              <?php echo "<input value='$_SESSION[content]' type=text name=content required />" ?>
              Please Upload the image again<br>
              <input type="file" name="image" />
              <input class="waves-effect waves-light btn" type="submit" value="EDIT" name="edit" style="margin-left:43%;"></input> 
            </form>
          </div>
          <div class="col m2">
            &nbsp;
          </div>
        </div>
        <div class="row center">
          <?php
            if(isset($_POST["edit"]))
            {
              if($_FILES["image"])
              {
                echo "Ulllla";
                $file=$_FILES['image']['tmp_name'];
                $image=addslashes(file_get_contents($file));
                $image_name=addslashes($_FILES['image']['name']);
                $image_size=getimagesize($_FILES['image']['tmp_name']);
                if(!$image_size)
                {
                  echo "Not an image";
                }
              }
              else
                $image='';
              echo "111";
              $heading=$_POST["heading"];
              $content=$_POST["content"];
              $date=date("Y-m-d");
              $time=date("H:i:s");
              $auther=$_SESSION['user'];
              $result=mysql_query("UPDATE post SET auther='$auther', date='$date', time='$time', heading='$heading', content='$content', image='$image' WHERE id='$_SESSION[id]'",$link) or die(mysql_error());
              if($result)
                echo "<p align=center>POST Edited Successfully!!!</p>";
            }
          ?>
        </div>
      </div>
    </section>
    <footer>
      
    </footer>
    <!--Import jQuery before materialize.js-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
  </body>
</html>
