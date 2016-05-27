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
  <body>
    <header>
      <?php
        session_start();
        $link=mysql_connect('localhost','root','');
        $db=mysql_select_db("blog",$link) or die("Error in Database");
      ?>    
      My Blog
      <!--login-->
      Login
      <form action="" method="post">
        <label>Username</label>
        <input type="text" name="name" required>
        <label>Password</label>
        <input type="password" name="password" required>
        <button type="submit" name="login" value="Login">Login</button>
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
          header("location:dashboard.php");
          $_SESSION['login_status1']=true;
        }
        else
        {
          $result=mysql_query("SELECT * FROM admin WHERE name='$name' AND password='$password'",$link);
          $count=mysql_num_rows($result);
          if($count)
          {
            header("location:admin.php");
            $_SESSION['login_status2']=true;
          }
          else
            echo "Wrong Username or Password";
        }
      }
      ?>
      <!--signup-->
      Sign Up
      <form action="" method="post">
        <label>Username</label>
        <input type="text" name="name" required>
        <label>Email</label>
        <input type="email" name="email" required>
        <label>Mobile</label>
        <input type="number" name="mobile" required>
        <label>Password</label>
        <input type="password" name="password" required>
        <button type="submit" name="signup" value="Signup">Sign Up</button>
      </form>
      <?php
        if(isset($_POST["signup"]))
        {
          $name=$_POST["name"];
          $email=$_POST["email"];
          $mobile=$_POST["mobile"];
          $password=$_POST["password"];
          $result=$db->query("SELECT * FROM user WHERE username=$name");
          $rows=$result->fetch_all["MYSQLI_ASSOC"];
        }
      ?>
    </header>
    <section>
      <?php

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