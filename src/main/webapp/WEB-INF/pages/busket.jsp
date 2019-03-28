<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26.02.2019
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="ph" uri="/WEB-INF/tagLib.tld" %>

<html>
<head>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

    <!-- Google Fonts
    ============================================ -->
    <link href='https://fonts.googleapis.com/css?family=Raleway:400,600' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>

    <!-- Bootstrap CSS
    ============================================ -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <!-- Font awesome CSS
    ============================================ -->
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <!-- owl.carousel CSS
    ============================================ -->
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.css">
    <link rel="stylesheet" href="/resources/css/owl.transitions.css">
    <!-- nivo slider CSS
    ============================================ -->
    <link rel="stylesheet" href="/resources/css/nivo-slider.css" type="text/css"/>
    <!-- meanmenu CSS
    ============================================ -->
    <link rel="stylesheet" href="/resources/css/meanmenu.min.css">
    <!-- jquery-ui CSS
    ============================================ -->
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <!-- animate CSS
    ============================================ -->
    <link rel="stylesheet" href="/resources/css/stail.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    <!-- main CSS
    ============================================ -->
    <link rel="stylesheet" href="/resources/css/main.css">
    <!-- style CSS
    ============================================ -->
    <link rel="stylesheet" href="/resources/css/style.css">
    <!-- responsive CSS
    ============================================ -->
    <link rel="stylesheet" href="/resources/css/responsive.css">
    <link rel="stylesheet" href="/resources/css/stail.css.css">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <title>Title</title>
    <script>
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState==2){
                document.getElementById("order1").removeAttribute("hidden");

            }

        }


    </script>
    <script type="text/javascript">

        document.getElementById('xxx').removeChild(document.getElementById('xxx').getElementsByTagName('tr')[0]);

    </script>
</head>
<body>

<!-- Add your site or application content here -->

<!-- HEADER-AREA START -->

<!-- HEADER AREA END -->
<!-- START PAGE-CONTENT -->
<section class="page-content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="page-menu">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><a href="#">Wish List</a></li>
                </ul>
            </div>
        </div>
        <div class="row">

            <div class="col-md-9">
                <!-- START PRODUCT-BANNER -->

                <!-- END PRODUCT-BANNER -->
                <div class="Wishlist-area">
                    <h2>My Wish List</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td class="text-center">Image</td>
                                <td class="text-left">Product Name</td>
                                <td class="text-left">Model</td>
                                <td class="text-right">Stock</td>
                                <td class="text-right">Unit Price</td>
                                <td class="text-right">Action</td>
                            </tr>
                            </thead>
                            <tbody id="xxx">
                            <c:forEach items="${busk}" var="list">
                            <tr>
                                <td class="text-center">
                                    <a href="#"> <img width="20" height="20"
                                                      src="<ph:ImageTag imageByte="${list.key.photo}"/>"
                                                      alt="#"/> </a>
                                </td>
                                <td class="text-left">
                                    <a href="#">${list.key.name}</a>
                                </td>
                                <td class="text-left">${list.key.description}</td>
                                <td class="text-right">${list.value}</td>
                                <td class="text-right">
                                    <div class="price-box">
                                        <span class="price">${list.key.price}</span>
                                    </div>
                                </td>
                                <td class="text-right">
                                    <button class="btn btn-primary" data-toggle="tooltip" title="" type="button" data-original-title="Add to Cart">
                                        <i class="fa fa-shopping-cart"></i>
                                    </button>
                                    <a href="#" class="btn btn-danger" data-toggle="tooltip" title="" data-original-title="Remove">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="buttons clearfix pull-right">
                        <a href="#" class="btn btn-primary">Continue</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- START SUBSCRIBE-AREA -->
    <div class="subscribe-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-7 col-xs-12">
                    <label class="hidden-sm hidden-xs">Sign Up for Our Newsletter:</label>
                    <div class="subscribe">
                        <form action="#">
                            <input type="text" placeholder="Enter Your E-mail">
                            <button type="submit">Subscribe</button>
                        </form>
                    </div>
                </div>
                <div class="col-md-4 col-sm-5 col-xs-12">
                    <div class="social-media">
                        <a href="#"><i class="fa fa-facebook fb"></i></a>
                        <a href="#"><i class="fa fa-google-plus gp"></i></a>
                        <a href="#"><i class="fa fa-twitter tt"></i></a>
                        <a href="#"><i class="fa fa-youtube yt"></i></a>
                        <a href="#"><i class="fa fa-linkedin li"></i></a>
                        <a href="#"><i class="fa fa-rss rs"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END SUBSCRIBE-AREA -->
</section>
<!-- END PAGE-CONTENT -->
<!-- FOOTER-AREA START -->
<footer class="footer-area">
    <!-- Footer Start -->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="footer-title">
                        <h5>My Account</h5>
                    </div>
                    <nav>
                        <ul class="footer-content">
                            <li><a href="my-account.html">My Account</a></li>
                            <li><a href="#">Order History</a></li>
                            <li><a href="wishlist">Wish List</a></li>
                            <li><a href="#">Search Terms</a></li>
                            <li><a href="#">Returns</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="footer-title">
                        <h5>Customer Service</h5>
                    </div>
                    <nav>
                        <ul class="footer-content">
                            <li><a href="contact.html">Contact Us</a></li>
                            <li><a href="about.html">About Us</a></li>
                            <li><a href="#">Delivery Information</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms &amp; Conditions</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-xs-12 hidden-sm col-md-3">
                    <div class="footer-title">
                        <h5>Payment &amp; Shipping</h5>
                    </div>
                    <nav>
                        <ul class="footer-content">
                            <li><a href="#">Brands</a></li>
                            <li><a href="#">Gift Vouchers</a></li>
                            <li><a href="#">Affiliates</a></li>
                            <li><a href="shop-list.html">Specials</a></li>
                            <li><a href="#">Search Terms</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="footer-title">
                        <h5>Payment &amp; Shipping</h5>
                    </div>
                    <nav>
                        <ul class="footer-content box-information">
                            <li>
                                <i class="fa fa-home"></i><span>Towerthemes, 1234 Stret Lorem, LPA States, Libero</span>
                            </li>
                            <li>
                                <i class="fa fa-envelope-o"></i><p><a href="contact.html">admin@bootexperts.com</a></p>
                            </li>
                            <li>
                                <i class="fa fa-phone"></i>
                                <span>01234-56789</span> <br> <span> 01234-56789</span>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
    <!-- Copyright-area Start -->
    <div class="copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <p>Copyright © Взято с <a href="http://bayguzin.ru" target="_blank"> bayguzin.ru</a> All rights reserved.</p>
                        <div class="payment">
                            <a href="#"><img src="img/payment.png" alt="Payment"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright-area End -->
</footer>
<!-- FOOTER-AREA END -->


<!-- jquery
============================================ -->
<script src="js/jquery-1.11.3.min.js"></script>
<!-- bootstrap JS
============================================ -->
<script src="js/bootstrap.min.js"></script>
<!-- wow JS
============================================ -->
<script src="js/wow.min.js"></script>
<!-- meanmenu JS
============================================ -->
<script src="js/jquery.meanmenu.js"></script>
<!-- owl.carousel JS
============================================ -->
<script src="js/owl.carousel.min.js"></script>
<!-- scrollUp JS
============================================ -->
<script src="js/jquery.scrollUp.min.js"></script>
<!-- countdon.min JS
============================================ -->
<script src="js/countdon.min.js"></script>
<!-- jquery-price-slider js
============================================ -->
<script src="js/jquery-price-slider.js"></script>
<!-- Nivo slider js
============================================ -->
<script src="js/jquery.nivo.slider.js" type="text/javascript"></script>
<!-- plugins JS
============================================ -->
<script src="js/plugins.js"></script>
<!-- main JS
============================================ -->
<script src="js/main.js"></script><a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: inline;">Scroll to top</a>


</body>
</html>
