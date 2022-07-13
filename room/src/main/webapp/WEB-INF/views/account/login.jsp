<!DOCTYPE html>
<html>
  <head>
    <title>Login</title>
    <!-- Bootstrap -->
    <link href="/room/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/room/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="/room/resources/assets/styles.css" rel="stylesheet" media="screen">
     <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
  </head>
  <body id="login">
    <div class="container"  >

      <form class="form-signin" method="post" action="/room/account/login">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" class="input-block-level" name="memberId" placeholder="">
        <input type="password" class="input-block-level" name="passwd" placeholder="Password">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-large btn-primary" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->
    <script src="/room/resources/vendors/jquery-1.9.1.min.js"></script>
    <script src="/room/resources/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>