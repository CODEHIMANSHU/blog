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
        if(isset($_POST["login"]))
        {
          echo "Hello";
        }
      ?>
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