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
    <header>
      <!--navbar-->  
      <nav class="blue-grey darken-1" style="position: fixed; z-index: 7;">
        <div class="nav-wrapper">
          <a class="brand-logo" href="index.php" style="padding-left:10%;">My Blog</a>
          <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="ReachMe.php">Reach Us</a></li>
            <?php
              session_start();
              if(isset($_SESSION['login_status1'])==true):
            ?>
            <li><a href="logout.php">Logout</a></li> 
            <?php 
              endif;
            ?>        
          </ul>
        </div>
      </nav> 
      <br><br><br>
      <?php
        if(isset($_SESSION['login_status1'])==false):
      ?>
      <div class="center">
      GUEST USER!!!
      </div>
      <br>
      <?php
        endif;
        $link=mysql_connect('localhost','root','') or die(mysql_error());
        $db=mysql_select_db("blog",$link) or die("Error in Database");
      ?>
      <br>
    </header>
    <section>
      <div class="container">
        <div class="row">
          <a class="waves-effect waves-light btn right" href="dashboard.php">Back to Homepage</a>
        </div>
        <?php
          $id=$_GET['id'];
          $result=mysql_query("SELECT * FROM post WHERE id=$id",$link);
          $post=mysql_fetch_assoc($result);
          if(isset($_SESSION['login_status1'])==true)
            $user=$_SESSION["user"];
        ?>
        <div class="row">
            <div class="card blue-grey darken-1">
              <div class="card-content white-text" style="overflow-wrap: break-word;">
                <span class="card-title">
                  <?php echo $post["heading"]; ?>
                </span>
                  <form action="" method=post>
                    <?php
                      if(isset($_SESSION['login_status1'])==true)
                      {          
                        $result=mysql_query("SELECT * FROM likes WHERE id='$id' AND user='$user'",$link);
                        $resultcount=mysql_num_rows($result);
                        if(!$resultcount)
                          echo "<button class='waves-effect waves-light btn right' type=submit name=like>Like</button>";
                        else
                          echo "<button class='waves-effect waves-light btn right' type=submit name=like>Unlike</button>";
                      }
                      else
                        echo "<button class='waves-effect waves-light btn right' type=submit name=like disabled>Like</button>";
                    ?>
                  </form>
                    <?php $content=$post["content"]; echo $content; ?>
                    <?php 
                      if($post['image']):
                        $uri='data:image/jpg;base64,'.base64_encode($post['image']);
                    ?>
                    <br>
                    <img class="center" style="margin: 10px 10px 10px 10px; padding: 10px 10px 10px 10px; max-width: 800px;" src="<?php echo $uri;?>">
                    <?php 
                      endif;
                    ?>
              </div>
              <div class="card-action" style="padding-top: 5px;padding-bottom: 5px;">
                <a ><?php echo "Author: ",$post["auther"]; ?></a>
                <a ><?php echo "Date: ",  $post["date"]; ?></a>
                <a ><?php echo "Time: ",  $post["time"]; ?></a>
                <a class="right"><?php echo "Likes: ", $post["likes"]; ?></a>
              </div>
               <?php
                $comments=mysql_query("SELECT * FROM comments WHERE id='$id' LIMIT 10") or die(mysql_error());
                $count=mysql_num_rows($comments);  
              ?>
              <div class="card-action" style="padding-top: 5px;padding-bottom: 0px; background-color:white">
                  <?php
                    if($count):
                    while($comment=mysql_fetch_assoc($comments))
                    {
                      echo $comment["username"];
                      echo ": ", $comment["comment"], "<br>";
                    }
                    endif;
                  ?>    
                  <form action="" method=post>
                  <?php
                    if(isset($_SESSION['login_status1'])==true)
                    {
                      echo "<input placeholder=Comment name=newcomment style='width:750px;' required >";
                      echo "<button class='waves-effect waves-light btn right' type=submit name=addcomment>Comment</button>";
                    }
                    else
                    {
                      echo "<input placeholder=Comment name=newcomment style='width:750px;' disabled required >";
                      echo "<button class='waves-effect waves-light btn right' type=submit name=addcomment disabled>Comment</button>";
                    }
                  ?>
                  </form>
              </div>
            </div>
          <?php
            if(isset($_POST["like"]))
            {
              if(!$resultcount)
              {
                $result1=mysql_query("UPDATE post SET likes=likes+1 WHERE id='$id'",$link);
                $result2=mysql_query("INSERT INTO likes values ('','$user','$id')",$link);
                header("Refresh:0");
              }
              else
              {
                $result1=mysql_query("UPDATE post SET likes=likes-1 WHERE id='$id'",$link) or die(mysql_error());
                $result2=mysql_query("DELETE FROM likes WHERE id='$id' AND user='$user'",$link) or die(mysql_error());
                header("Refresh:0");
              }
            }
          ?>
          <?php
            if(isset($_POST["addcomment"]))
            {
              $newcomment=$_POST["newcomment"];
              $result=mysql_query("INSERT INTO comments values ('','$id','$user','$newcomment')",$link);
              header("Refresh:0");
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