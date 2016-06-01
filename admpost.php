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
        if(isset($_SESSION['login_status2'])==false)
        {
          echo "You are not logged in.";
          //POP UP
          header('location:index.php');
        }
        $link=mysql_connect('localhost','root','') or die(mysql_error());
        $db=mysql_select_db("blog",$link) or die("Error in Database");
      ?>
      <form action="" method="post">
      <button type="submit" name="logout">LOGOUT</div>
      <?php
        if(isset($_POST["logout"]))
        {
          $_SESSION['login_status2']=false;
          session_destroy();
          header('location:index.php');
        }
      ?>    

    </header>
    <section>
      <?php
        $id=$_GET["id"];
        $user=$_SESSION["user"];
        $result=mysql_query("SELECT * FROM post WHERE id=$id",$link);
        $post=mysql_fetch_assoc($result);
        echo "Author: ", $post["auther"];
        echo " Date: ", $post["date"];
        echo " Time: ", $post["time"];
        echo " Heading: ", $post["heading"];
        echo " Content: ", $post["content"];
        echo " Likes: ", $post["likes"], "<br>";
        $comments=mysql_query("SELECT * FROM comments WHERE id='$id'") or die(mysql_error());
        $count=mysql_num_rows($comments);
        if($count)
          echo " Comments: ";
        while($comment=mysql_fetch_assoc($comments))
        {
          echo "Ref. ID: ", $comment["reference"];
          echo "User: ", $comment["username"];
          echo " ", $comment["comment"], " ";
        }
        echo "<br><br>";
      ?>
      <br>
      Delete a Comment: 
      <form action="" method=post>
        <input type="number" name="refid" placeholder="Ref.ID">
        <button type"submit" name="delcomment">Delete</button>
      </form>
      <?php
        if(isset($_POST["delcomment"]))
        {
          $refid=$_POST["refid"];
          $result=mysql_query("DELETE FROM comments WHERE reference='$refid'",$link);
          if($result)
          {
            echo "Comment Deleted!!!";
          }
        }
      ?>
      <form action="" method=post>
        <?php
          $id=$_GET["id"];
          $result=mysql_query("SELECT * FROM likes WHERE id='$id' AND user='$user'",$link);
          $resultcount=mysql_num_rows($result);
          if(!$resultcount)
            echo "<button type=submit name=like>Like</button>";
          else
            echo "<button type=submit name=like>Unlike</button>";
        ?>
      </form>
      <?php
        if(isset($_POST["like"]))
        {
          if(!$resultcount)
          {
            $result1=mysql_query("UPDATE post SET likes=likes+1 WHERE id='$id'",$link);
            $result2=mysql_query("INSERT INTO likes values ('','$user','$id')",$link);
            if($result1&&$result2)
              echo "Liked";            
          }
          else
          {
            $result1=mysql_query("UPDATE post SET likes=likes-1 WHERE id='$id'",$link) or die(mysql_error());
            $result2=mysql_query("DELETE FROM likes WHERE id='$id' AND user='$user'",$link) or die(mysql_error());
            if($result1&&$result2)
              echo "Unliked";            
          }
        }
      ?>
      <form action="" method=post>
        <input placeholder=comment name="newcomment" required >
        <button type="submit" name="addcomment">Comment</button>
      </form>
      <?php
        if(isset($_POST["addcomment"]))
        {
          $newcomment=$_POST["newcomment"];
          $result=mysql_query("INSERT INTO comments values ('','$id','$user','$newcomment')",$link);
          if($result)
            echo "Comment Added Successfully";
        }
      ?>
      <form action="" method="post">
        <button type="submit" name="delpost">Delete Post</button>
      </form>
      <?php
        if(isset($_POST['delpost']))
        {
          $id=$_GET['id'];
          $result1=mysql_query("DELETE FROM post WHERE id=$id",$link);
          $result2=mysql_query("DELETE FROM comments WHERE id=$id",$link);
          $result3=mysql_query("DELETE FROM likes WHERE id=$id",$link);  
          if($result1&&$result2&&$result3)
          {
            echo "Comment Deleted Successfully";
          }       
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