<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Skanetrafiken</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/scrolling-nav.css" rel="stylesheet">
    

</head>

<body id="page-top">

<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">Skanetrafiken</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">Journey</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services">Search</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <header class="bg-primary text-white">
    <div class="container text-center">
      <h1>Welcome to Skanetrafiken!</h1>
      <p class="lead">The place where you can see the nearest bus to your destination!</p>
    </div>
  </header>	
  
   <section id="about">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Where do you want to go?</h2>
          <p class="lead">All you need to enter is a station you want to reach and your coordinates!</p>
          <form action="ControllerServlet" method="GET">
          	<!--  <p>Destination: <input type="text" name="station" /></p>-->
          	<p>Coordinate X: <input type="text" name="x" /></p>
          	<p>Coordinate Y: <input type="text" name="y" /></p>
          	<input type="submit" value="Submit" />
          </form>
          <p class="lead">How do you get coordinates you may ask? All you need to do is click this button!</p>
          <button id = "find-me">Show my location</button><br/>
			<p id = "status"></p>
			<a id = "map-link" target="_blank"></a>
        </div>
      </div>
    </div>
  </section>

  <section id="services" class="bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Services we offer</h2>
          <p class="lead">We offer busses that can take you anywhere you want inside of Skåne! </p>
        </div>
      </div>
    </div>
  </section>

  <section id="contact">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Contact us</h2>
          <p class="lead">Our contact team works 24/7 so you can reach us any time you want! Here are the ways you can contact us: </p>
          <ul>
          	<li>Email: skanehelp@gmail.com</li>
          	<li>Phone: 046 123 456</li>
          	<li>Our office: Malmö C</li>
          </ul> 
        </div>
      </div>
    </div>
  </section>

<!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="js/scrolling-nav.js"></script>
  <script src="js/geolocation.js"></script>
  
  
</body>

</html>