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
          <div class="col m2">
            &nbsp;
          </div>
          <div class="col m8  blue-grey lighten-4" style="border-radius: 10px;padding: 0px 30px 10px 30px; margin-top: 50px;">
            <h5 style="margin-top:0px;"><p align="center">Add a new Post</p></h5>
            <form action="" method="post" enctype="multipart/form-data">
              <input placeholder="Heading" type="text" name="heading" required />
              <input placeholder="Your HTML content" type="text" name="content" required />
              <input type="file" name="image" />
              <input class="waves-effect waves-light btn" type="submit" value="POST" name="add" style="margin-left:43%;"></input> 
            </form>
          </div>
          <div class="col m2">
            &nbsp;
          </div>
        </div>
        <div class="row">
          <?php
            if(isset($_POST["add"]))
            {
              echo "llll";
              //var_dump($_POST["image"]);
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
              $heading=$_POST["heading"];
              $content=$_POST["content"];
              $date=date("Y-m-d");
              $time=date("H:i:s");
              $auther=$_SESSION['user'];
              $result=mysql_query("INSERT INTO post VALUES ('','$auther','$date','$time','$heading','$content','$image','0')",$link) ;
              if($result)
                echo "<p align=center>POST Added Successfully!!!</p>";
            }
          ?>          
        </div>
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
        <a href="admpost.php?id=<?php echo $id; ?>">
          <div class=row>
            <div class="card blue-grey darken-1">
              <div class="card-content white-text" style="overflow-wrap: break-word;">
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
          <a class="waves-effect waves-light btn" href=admin.php?p=<?php echo $previous;?>>Previous</a>
          &nbsp;
        <?php
          endif;
          if($curpage<$pagecount-1):
        ?>
          <a class="waves-effect waves-light btn" href=admin.php?p=<?php echo $next;?>>Next</a>
        <?php
          endif;
        ?>  
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