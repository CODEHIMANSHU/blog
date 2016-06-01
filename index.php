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
        $link=mysql_connect('localhost','root','') or die(mysql_error());
        $db=mysql_select_db("blog",$link) or die("Error in Database") or die(mysql_error());
        if(!isset($_SESSION['login_status1']))
        $_SESSION['login_status1']=NULL;
        if(!isset($_SESSION['login_status2']))
        $_SESSION['login_status2']=NULL;        
        if($_SESSION['login_status1']==true)
          header("Location:dashboard.php");
        if($_SESSION['login_status2']==true)
          header("Location:admin.php");        
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
                $result=mysql_query("INSERT INTO user VALUES ('$name','$password','$mobile','$email','0')",$link) or die(mysql_error());
                if($result)
                  echo "Sign Up Successful. Please Login!!!";
              }
        }
      ?>
    </header>
    <section>
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
            echo " Comments:  ";            
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