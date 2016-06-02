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
      <a href="ReachMe.php">Reach Me</a>
      <?php
        session_start();
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
      My Blog
      <!--login-->
      Login
      <form action="" method="post">
        <label>Username</label>
        <input placeholder="Username" type="text" name="name" required>
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
        <?php $pic=3;
          echo "<img src=img/captcha/$pic.jpg height=40px width=120px>";
        ?>
        <input type="text" name="captcha" placeholder="Enter Captcha" required>
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
          $result4=mysql_query("SELECT * FROM captcha WHERE id='$pic'",$link);
          $count1=mysql_num_rows($result1);
          $count2=mysql_num_rows($result2);
          $count3=mysql_num_rows($result3);
          $code=1;
          if(mysql_num_rows($result4))
          {
            $code=mysql_fetch_assoc($result4);
            $code=$code["code"];
          }
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
                if($code!=$_POST["captcha"])
                {
                  echo "Wrong Captcha";
                }
                else
                {
                  $result=mysql_query("INSERT INTO user VALUES ('$name','$password','$mobile','$email')",$link) or die(mysql_error());
                  if($result)
                  echo "Sign Up Successful. Please Login!!!";
                }
        }
      ?>
    </header>
    <section>
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
      <div>
        <?php
            $id=$post["id"];
            echo "<a href=post.php?id=$id>";
            echo "Author: ", $post["auther"];
            echo " Date: ", $post["date"];
            echo " Time: ", $post["time"];
            echo " Heading: ", $post["heading"];
            $content=substr($post["content"],0,100);
            echo " Content: ", $content, "...";
            echo " Likes: ", $post["likes"], "<br>";
            $comments=mysql_query("SELECT * FROM comments WHERE id='$id' LIMIT 2") or die(mysql_error());
            $count=mysql_num_rows($comments);
            if($count)
              echo " Comments: ";
            while($comment=mysql_fetch_assoc($comments))
            {
              echo "User: ", $comment["username"];
              echo " ", $comment["comment"], " ";
            }
            echo "<br><br>";
            echo "</a>"
        ?>
      </div>
      <?php
        endwhile;
        if($curpage>0)
          echo "<a href='index.php?p=$previous'>Previous</a>";
        if($curpage<$pagecount-1)
          echo "<a href='index.php?p=$next'>Next</a>";
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