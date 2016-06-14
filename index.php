<!DOCTYPE html>
<html>
  <head>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>
      Blog
    </title>
  </head>
  <body class="blue-grey lighten-5">
     <!--Checking Database Access and login status-->
    <?php
      session_start();
      error_reporting(0);
      $link=mysql_connect('localhost','root','') or die(mysql_error());
      $db=mysql_select_db("blog",$link) or die("Error in Database");
      if(!isset($_SESSION['login_status1']))
        $_SESSION['login_status1']=NULL;
      if(!isset($_SESSION['login_status2']))
        $_SESSION['login_status2']=NULL;        
      if($_SESSION['login_status1']==true)
        header("Location:dashboard.php");
      if($_SESSION['login_status2']==true)
        header("Location:admin.php");        
    ?>
    <header>
      <!--navbar--> 
      <div class="navbar-fixed"> 
        <nav class="blue-grey darken-1" style="z-index: 7;">
          <a class="brand-logo" href="index.php" style="padding-left:10%;">My Blog</a>
          <ul id="slide-out" class="side-nav">
            <li><a href="ReachMe.php">Reach Us</a></li>
          </ul>
          <ul class="right hide-on-med-and-down fixed">
            <li><a href="ReachMe.php">Reach Us</a></li>
          </ul>
          <a href="#" data-activates="slide-out" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
        </nav>
      </div> 
    </header>
    <section>
    <br>
      <div class="container">
        <div class="row ">
          <div class="col s5 center blue-grey lighten-4" style="border-radius: 10px;padding: 20px 30px 10px 30px; margin-top: 50px;">
            <!--login-->
            Login
            <form action="" method="post">
              <input placeholder="Username" type="text" name="name" required>
              <input placeholder="Password" type="password" name="password" required>
              <button type="submit" name="login" style="visibility: hidden;"><a class="waves-effect waves-light btn" style="visibility: visible;">Log In</a></button>
            </form>
            <?php
            if(isset($_POST["login"]))
            {
              $name=$_POST["name"];
              $password=$_POST["password"];
              $result=mysql_query("SELECT * FROM user WHERE username='$name' AND password='$password'",$link);
              $count=mysql_num_rows($result);
              if($count)
              {
                $_SESSION['login_status1']=true;
                $_SESSION['user']=$name;
                header("location:dashboard.php");
              }
              else
              {
                $result=mysql_query("SELECT * FROM admin WHERE name='$name' AND password='$password'",$link);
                $count=mysql_num_rows($result);
                if($count)
                {
                  $_SESSION['login_status2']=true;
                  $_SESSION['user']=$name;
                  header("location:admin.php");
                }
                else
                  echo "Wrong Username or Password";
              }
            }
            ?>
          </div>
          <div class="col s2">
            &nbsp;
          </div>
          <div class="col s5 center blue-grey lighten-4" style="border-radius: 10px;padding: 20px 30px 10px 30px;">
            <!--signup-->
            Sign Up
            <form action="" method="post">
              <input placeholder="Username" type="text" name="name" required>
              <input placeholder="Email" type="email" name="email" required>
              <input placeholder="Mobile" type="number" name="mobile" required>
              <input placeholder="Password" type="password" name="password" required>
              <button type="submit" name="signup" value="Signup" style="visibility: hidden;"><a class="waves-effect waves-light btn" style="visibility: visible;">Sign Up</a></button>
            </form>
            <?php
              if(isset($_POST["signup"]))
              {
                $name=$_POST["name"];
                $email=$_POST["email"];
                $mobile=$_POST["mobile"];
                $password=$_POST["password"];
                $result1=mysql_query("SELECT * FROM user WHERE username='$name'",$link);
                $result2=mysql_query("SELECT * FROM user WHERE email='$email'",$link);
                $result3=mysql_query("SELECT * FROM admin WHERE name='$name'",$link);
                $count1=mysql_num_rows($result1);
                $count2=mysql_num_rows($result2);
                $count3=mysql_num_rows($result3);
                if($count1)
                {
                  echo "Username already exists";
                }
                else
                  if($count2)
                  {
                    echo "Email already exists";
                  }
                  else
                    if($count3)
                    {
                      echo "Username already exists";
                    }
                    else
                      {
                        $result=mysql_query("INSERT INTO user VALUES ('$name','$password','$mobile','$email')",$link) or die(mysql_error());
                        if($result)
                        echo "Sign Up Successful. Please Login!!!";
                      }
              }
            ?>
          </div>
        </div>
      </div>
      <div class="container">
        <?php
          $posts=mysql_query("SELECT * FROM post ORDER BY date DESC") or die(mysql_error());
          $postcount=mysql_num_rows($posts);
          $postperpage=2;
          $pagecount=$postcount/$postperpage;
          if(isset($_GET['p']))
          {
            $curpage=$_GET['p'];
          }
          else
          {
            $curpage=0;
          }      
          if($curpage>$pagecount)
            $curpage=0;
          if($curpage<0)
            $startpost=0;
          else
            $startpost=$curpage*$postperpage;
          $previous=$curpage-1;
          $next=$curpage+1;
        ?>
        <?php
          $posts=mysql_query("SELECT * FROM post ORDER BY date DESC LIMIT $startpost, $postperpage") or die(mysql_error());
          while($post=mysql_fetch_assoc($posts)):
        ?>
        <?php $id=$post["id"]; ?>
        <a href="post.php?id=<?php echo $id; ?>">
          <div class=row>
            <div class="card blue-grey darken-1">
              <div class="card-content white-text" style="overflow-wrap: break-word;>
                <span class="card-title"><?php echo $post["heading"]; ?></span>
                <p><?php $content=substr($post["content"],0,100); echo $content; ?>...</p>
              </div>
              <div class="card-action" style="padding-top: 5px;padding-bottom: 5px;">
                <a ><?php echo "Author: ",$post["auther"]; ?></a>
                <a ><?php echo "Date: ",  $post["date"]; ?></a>
                <a ><?php echo "Time: ",  $post["time"]; ?></a>
                <a class="right"><?php echo "Likes: ", $post["likes"]; ?></a>
              </div>
               <?php
                $comments=mysql_query("SELECT * FROM comments WHERE id='$id' LIMIT 2") or die(mysql_error());
                $count=mysql_num_rows($comments);
                if($count):
              ?>
              <div class="card-action" style="padding-top: 5px;padding-bottom: 5px; background-color:white">
                <a>
                  <?php
                    while($comment=mysql_fetch_assoc($comments))
                    {
                      echo $comment["username"];
                      echo ": ", $comment["comment"], "<br>";
                    }
                  ?>    
                </a>
              </div>
              <?php endif; ?>
            </div>
          </div>
        </a>
        <?php endwhile; ?>
      </div> 
      <br>
      <div class="center">
        <?php
          if($curpage>0):
        ?>
          <a class="waves-effect waves-light btn" href=index.php?p=<?php echo $previous;?>>Previous</a>
          &nbsp;
        <?php
          endif;
          if($curpage<$pagecount-1):
        ?>
          <a class="waves-effect waves-light btn" href=index.php?p=<?php echo $next;?>>Next</a>
        <?php
          endif;
        ?>
        
      </div>
    </section>
    <footer>
    &nbsp;
    </footer>
      <!--Import jQuery before materialize.js-->
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
  </body>
</html>