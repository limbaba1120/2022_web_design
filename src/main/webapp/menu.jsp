 <script src="./resources/js/bubble.js"></script>
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <script src="./resources/js/bootstrap.bundle.min.js"></script>
    <style>
  .bubbles {
    display: inline-block;
    font-family: arial;
    position: relative;
    }
.bubbles h5 {
    position: relative;
    margin: 1em 0 0;
    font-family: 'Luckiest Guy', cursive;
    color: #fff;
    z-index: 2;
}
.individual-bubble {
    position: absolute;
    border-radius: 100%;
    bottom: 10px;
    background-color: #fff;
    z-index: 1;
}
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>
<header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid bubbles">
      <a class="navbar-brand" id="header-title" href="#">TravelAgency</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="./welcome.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./products.jsp">Product</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./cart.jsp">Cart</a>
          </li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> About Product </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="./addProduct.jsp">Add Product</a></li>
						<li><a class="dropdown-item" href="./editProduct.jsp?edit=update">Edit Product</a></li>
						<li><a class="dropdown-item" href="./editProduct.jsp?edit=delete">Delete Product</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul>
				</li>
		</ul>
      	<ul class="nav justify-content-end">
      		<li class="nav-item">
            <a class="nav-link" href="./.jsp">Login</a>
          </li>
      	</ul>
      </div>
    </div>
  </nav>
</header>




