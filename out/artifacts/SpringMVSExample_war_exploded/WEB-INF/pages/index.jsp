<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ph" uri="/WEB-INF/tagLib.tld" %>
<html class="no-js">

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
    <script type="text/javascript">
        jQuery(function () {
            jQuery('#sel').change(function () {
                this.form.submit();
                $(function () {

                    $('html, body').animate({
                        scrollTop: $('#sel').offset().top
                    }, 700);

                });
            });
        });

    </script>
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TODO

    <script type="text/javascript">

        function plus(clicked_id) {
            var span = "span";
            var id = clicked_id.substring(0, clicked_id.length-10);
            var vr = id+span;
            var el = document.getElementById(vr).innerHTML;
            $.ajax({
                    url: "/plus",
                    data: ({
                        good: id,
                        amnt: el,

                    }),
                    success: function (data) {


                     document.getElementById(vr).innerHTML = data;



                    }


                }
            );




        }

    </script>
    <script type="text/javascript">
        function mseOv(id) {

            id.setAttribute("style", "background-color:red;");
        }


    </script>
    <script type="text/javascript">
        function doAjax() {
            $.ajax({
                    url: "/check",
                    data: ({
                        name: $("#amount").val(),
                        name2: $("#amount_1").val(),
                    }),
                    success: function (data) {

                        $("#xxxx").html(data);
                        document.getElementById("hiddenbutton").removeAttribute("hidden");
                        $(function () {

                            $('html, body').animate({
                                scrollTop: $('#sel').offset().top
                            }, 700);

                        });

                    }


                }
            );
        }
    </script>
    <script>
        function sortPrice() {
            $.ajax({
                    url: "/sortbyprice",
                    data: ({
                        name: "name",
                    }),

                    success: function () {
                        window.location.reload();


                    }

                }
            );


        }

    </script>

    <script>
        function doLike(clicked) {
            $.ajax({
                    url: "/like",
                    data: ({
                        name: clicked,
                    }),
                    success: function () {
                        window.location.reload();
                        clicked.style.background = "red";


                    }


                }
            );


        }

    </script>


    <script type="text/javascript">
        function putBusket(clicked_id) {


            $.ajax({
                    url: "/put",
                    data: ({
                        good: clicked_id,
                    }),
                    success: function (data) {
                        var v = "hidden";
                        $("#busket").html(data);
                        document.getElementById(clicked_id+v).removeAttribute("hidden");
                        document.getElementById(clicked_id).style.display = 'none';


                    }


                }
            );
        }

    </script>

    <script>
        $(function () {
            $("#slider-range").slider({
                // orientation: "vertical",
                // step: 15,
                range: true,
                min: 0,
                max: 500,
                values: [10, 300],
                slide: function (event, ui) {
                    $("#amount").val(ui.values[0]);
                    $("#amount_1").val(ui.values[1]);
                }
            });
            $("#amount").val($("#slider-range").slider("values", 0));
            $("#amount_1").val($("#slider-range").slider("values", 1));

            // Изменение местоположения ползунка при вводиде данных в первый элемент input
            $("input#amount").change(function () {
                var value1 = $("input#amount").val();
                var value2 = $("input#amount_1").val();
                if (parseInt(value1) > parseInt(value2)) {
                    value1 = value2;
                    $("input#amount").val(value1);
                }
                doAjax()
                $("#slider-range").slider("values", 0, value1);
            });


            // Изменение местоположения ползунка при вводиде данных в второй элемент input
            $("input#amount_1").change(function () {
                var value1 = $("input#amount").val();
                var value2 = $("input#amount_1").val();

                if (parseInt(value1) > parseInt(value2)) {
                    value2 = value1;
                    $("input#amount_1").val(value2);
                }
                doAjax()
                $("#slider-range").slider("values", 1, value2);
            });


            // фильтрация ввода в поля
            jQuery('#amount, #amount_1').keypress(function (event) {
                var key, keyChar;
                if (!event) var event = window.event;

                if (event.keyCode) key = event.keyCode;
                else if (event.which) key = event.which;

                if (key == null || key == 0 || key == 8 || key == 13 || key == 9 || key == 46 || key == 37 || key == 39) return true;
                keyChar = String.fromCharCode(key);

                if (!/\d/.test(keyChar)) return false;

            });

        });
    </script>

    <%-- <script> <spring:url value="http://code.jquery.com/ui/1.11.4/jquery-ui.js" var="jqueryui"/></script>
     <script> <spring:url value="http://code.jquery.com/jquery-1.10.2.js" var="jqueryuii"/></script>--%>

</head>
<%--<body style="">

<header class="header-area">
    <!-- HEADER-TOP START -->
    <div class="header-top hidden-xs">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="top-menu">
                        <!-- Start Language -->
                        <ul class="language">
                            <li><a href="#"><img class="right-5" src="img/flags/gb.png" alt="#">English<i
                                    class="fa fa-caret-down left-5"></i></a>
                                <ul>
                                    <li><a href="#"><img class="right-5" src="img/flags/fr.png" alt="#">French</a></li>
                                    <li><a href="#"><img class="right-5" src="img/flags/gb.png" alt="#">English</a></li>
                                    <li><a href="#"><img class="right-5" src="img/flags/gb.png" alt="#">English</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- End Language -->
                        <!-- Start Currency -->
                        <ul class="currency">
                            <li><a href="#"><strong>$</strong> USD<i class="fa fa-caret-down left-5"></i></a>
                                <ul>
                                    <li><a href="#">$ EUR</a></li>
                                    <li><a href="#">$ GBP</a></li>
                                    <li><a href="#">$ USD</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- End Currency -->
                        <p class="welcome-msg">Default welcome msg!</p>
                    </div>
                    <!-- Start Top-Link -->
                    <div class="top-link">
                        <ul class="link">

                            <li><a href="/adm"><i class="fa fa-user">Логин</i></a></li>
                            <li><a href="/busketaction" id="busket"><i class="fa fa-heart"></i>Корзина</a></li>
                            <li><a href="checkout.html"><i class="fa fa-share"></i> Checkout</a></li>
                            <li><a href="account.html"><i class="fa fa-unlock-alt"></i> Login</a></li>
                        </ul>
                    </div>
                    <!-- End Top-Link -->
                </div>
            </div>
        </div>
    </div>
    <!-- HEADER-TOP END -->
    <!-- HEADER-MIDDLE START -->
    <div class="header-middle">
        <div class="container">
            <!-- Start Support-Client -->
            <div class="support-client hidden-xs">
                <div class="row">
                    <!-- Start Single-Support -->
                    <div class="col-md-3 hidden-sm">
                        <div class="single-support">
                            <div class="support-content">
                                <i class="fa fa-clock-o"></i>
                                <div class="support-text">
                                    <h1 class="zero gfont-1">working time</h1>
                                    <p>Mon- Sun: 8.00 - 18.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Single-Support -->
                    <!-- Start Single-Support -->
                    <div class="col-md-3 col-sm-4">
                        <div class="single-support">
                            <i class="fa fa-truck"></i>
                            <div class="support-text">
                                <h1 class="zero gfont-1">Free shipping</h1>
                                <p>On order over $199</p>
                            </div>
                        </div>
                    </div>
                    <!-- End Single-Support -->
                    <!-- Start Single-Support -->
                    <div class="col-md-3 col-sm-4">
                        <div class="single-support">
                            <i class="fa fa-money"></i>
                            <div class="support-text">
                                <h1 class="zero gfont-1">Money back 100%</h1>
                                <p>Within 30 Days after delivery</p>
                            </div>
                        </div>
                    </div>
                    <!-- End Single-Support -->
                    <!-- Start Single-Support -->
                    <div class="col-md-3 col-sm-4">
                        <div class="single-support">
                            <i class="fa fa-phone-square"></i>
                            <div class="support-text">
                                <h1 class="zero gfont-1">Phone: 0123456789</h1>
                                <p>Order Online Now !</p>
                            </div>
                        </div>
                    </div>
                    <!-- End Single-Support -->
                </div>
            </div>
            <!-- End Support-Client -->
            <!-- Start logo & Search Box -->
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="logo">
                        <a href="index.html" title="Malias"><img src="img/logo.png" alt="Malias"></a>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12">
                    <div class="header-search">
                        <span id="xxxx"></span>


                        <form action="/search" method="get">
                             <span id="yyyy">

                                <input type="submit" hidden="true" id="hiddenbutton" width="20" height="20"
                                       placeholder="ASASDSADADS">

                        </span>
                            //////////////////////////////////////////////////////////////////////////////////////
                            <input type="text" placeholder="Search" name="srch" id="srch">
                            <button type="submit" id="sub"><img
                                    src="https://thumbs.gfycat.com/WholeFlimsyDarklingbeetle-size_restricted.gif"
                                    width="20"/></button>
                            <div class="masonry">
                                <p>
                                    <label for="amount">Price range:</label>
                                    <input type="text" oninput="doAjax()" name="amount" id="amount">
                                    <input type="text" oninput="doAjax()" name="amount_1" id="amount_1">
                                </p>

                                <div id="slider-range" onclick="doAjax()"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End logo & Search Box -->
        </div>
    </div>
    <!-- HEADER-MIDDLE END -->
    <!-- START MAINMENU-AREA -->
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="mainmenu hidden-sm hidden-xs">
                        <nav>
                            <ul>
                                <li><a href="index.html">Home</a>
                                    <ul>
                                        <li><a href="index.html">Home Versions 1</a></li>
                                        <li><a href="index-2.html">Home Versions 2</a></li>
                                    </ul>
                                </li>
                                <li><a href="about.html">About Us</a></li>
                                <li class="hot"><a href="shop.html">Bestseller Products</a></li>
                                <li class="new"><a href="shop-list.html">New Products</a></li>
                                <li><a href="shop.html">Special Products</a></li>
                                <li><a href="#">Pages</a>
                                    <ul>
                                        <li><a href="cart.html">Cart</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                        <li><a href="account.html">Create Account</a></li>
                                        <li><a href="my-account.html">My Account</a></li>
                                        <li><a href="product-details.html">Product details</a></li>
                                        <li><a href="shop.html">Shop Grid View</a></li>
                                        <li><a href="shop-list.html">Shop List View</a></li>
                                        <li><a href="wishlist.html">Wish List</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MAIN-MENU-AREA -->
    <!-- Start Mobile-menu -->
    <div class="mobile-menu-area hidden-md hidden-lg">
        <div class="container mean-container">
            <div class="mean-bar"><a href="#nav" class="meanmenu-reveal"
                                     style="background:;color:;right:0;left:auto;"><span></span><span></span><span></span></a>
                <nav class="mean-nav">
                    <ul style="display: none;">
                        <li><a href="index.html">Home</a>
                            <ul style="display: none;">
                                <li><a href="index.html">Home Page 1</a></li>
                                <li><a href="index-2.html">Home Page 2</a></li>
                            </ul>
                            <a class="mean-expand" href="#" style="font-size: 18px">+</a></li>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="shop.html">Bestseller Products</a></li>
                        <li><a href="shop-list.html">New Products</a></li>
                        <li><a href="#">Pages</a>
                            <ul style="display: none;">
                                <li><a href="cart.html">Cart</a></li>
                                <li><a href="checkout.html">Checkout</a></li>
                                <li><a href="account.html">Create Account</a></li>
                                <li><a href="login.html">Login</a></li>
                                <li><a href="my-account.html">My Account</a></li>
                                <li><a href="product-details.html">Product details</a></li>
                                <li><a href="shop.html">Shop Grid View</a></li>
                                <li><a href="shop-list.html">Shop List View</a></li>
                                <li><a href="wishlist.html">Wish List</a></li>
                            </ul>
                            <a class="mean-expand" href="#" style="font-size: 18px">+</a></li>
                        <li class="mean-last"><a href="contact.html">Contact Us</a></li>
                    </ul>
                </nav>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="mean-push"></div>
                    <nav id="mobile-menu" style="display: none;">
                        <ul>
                            <li><a href="index.html">Home</a>
                                <ul>
                                    <li><a href="index.html">Home Page 1</a></li>
                                    <li><a href="index-2.html">Home Page 2</a></li>
                                </ul>
                            </li>
                            <li><a href="about.html">About Us</a></li>
                            <li><a href="shop.html">Bestseller Products</a></li>
                            <li><a href="shop-list.html">New Products</a></li>
                            <li><a href="#">Pages</a>
                                <ul>
                                    <li><a href="cart.html">Cart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="account.html">Create Account</a></li>
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="my-account.html">My Account</a></li>
                                    <li><a href="product-details.html">Product details</a></li>
                                    <li><a href="shop.html">Shop Grid View</a></li>
                                    <li><a href="shop-list.html">Shop List View</a></li>
                                    <li><a href="wishlist.html">Wish List</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">Contact Us</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- End Mobile-menu -->
</header>
<div class="small-product-area carosel-navigation">
    <div align="center" class="row">
        <div class="col-md-12">
            <div class="area-title">
                <h3 class="title-group gfont-1">Bestseller</h3>
            </div>
        </div>
    </div>
    <div class="row">
        <div align="center">

            <c:forEach items="${commentlist}" var="comments">
                <table>
                    <tr>
                        <td>
                            <b>${comments.text}</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Гость</b>
                        </td>
                            &lt;%&ndash; <c:if test="${comm.userID.email==sessionScope.get('USERSESSION')}">
                                 <a href="/show/deletecomment/${comm.id}"><spring:message code="delete"/></a>
                             </c:if>&ndash;%&gt;
                    </tr>
                </table>

            </c:forEach>
            <c:if test="${sessionScope.get('GOODSESSION') ne null }">
                <form action="/comment" method="post">
                    <input type="text" name="commenttext" value="Коммент" width="200">
                    <input type="hidden" name="commentgoodname" value="${sessionScope.get('GOODSESSION')}">
                    <input type="hidden" name="commentusername" value="">
                </form>
            </c:if>

        </div>
        <div align="center" class="active-bestseller sidebar owl-carousel owl-theme"
             style="opacity: 1; display: block;">
            <div align="center" class="owl-wrapper-outer">
                <tbody class="owl-wrapper"
                       style="width: 752px; left: 0px; display: block; transition: all 0ms ease 0s; transform: translate3d(0px, 0px, 0px);">

                <div id="xxxxxxx" class="owl-item" style="width: 188px;">
                    <!-- Start Single-Product -->
                    <form action="/sortbyprice" method="get">
                        <button type="submit">Сортировать по цене</button>
                    </form>
                    <div align="center">
                        <form action="/sortbylikes" method="get">
                            <button type="submit">Сортировать по лайкам</button>
                        </form>
                    </div>

                    &lt;%&ndash;
                                        <c:forEach items="${list}" var="list">
                                        <div class="single-product">
                                            <div class="product-img">
                                                <a>
                                                    <img src="<ph:ImageTag imageByte="${list.photo}"/>" width="100"/>

                                                </a>
                                            </div>
                                            <div class="product-description">
                                                <div>
                                                    <input type="button" id="${list.name}" onclick="putBusket(this.id)" width="200"
                                                           height="100" value="В Корзину">

                                                </div>
                                                <h5><a href="#">${list.name}</a></h5>
                                                <div class="price-box">
                                                    <span class="price">${list.price}</span>
                                                    <div>
                                                        <form action="/showcomment">
                                                            <input type="hidden" name="commentname" value="${list.name}">
                                                            <input type="submit" value="ОТКРЫТЬ КОММЕНТАРИИ">
                                                        </form>

                                                    </div>


                                                    <div>

                                                        <div>

                                                        </div>


                                                    </div>

                                                    <span class="rating">${list.likes.size()}

                                                                              <img src="data:image/png;base64,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"
                                                                                   id="${list.name}" type="submit" onclick="doLike(this.id)"
                                                                                   width="20" height="30"> </img>
                                                            &lt;%&ndash;                                   <form action="/like">
                                                            <input type="hidden" name="book" value="${list.name}">
                                                            <input type="submit" value="LIKE">
                                                        </form>&ndash;%&gt;


                                                                      </span>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>&ndash;%&gt;

                    <!-- End Single-Product -->
                </div>
            </div>
        </div>
        ///////////////////////////////////////////////////////////////////////////////TODO
        &lt;%&ndash;    <c:forEach items="${list}" var="list">
            <div class="single-product">
                <div class="col-md-3 col-sm-4 col-xs-12">
                    <div class="label_new">
                        <span class="new">new</span>
                    </div>
                    <div class="sale-off">
                        <span class="sale-percent">-55%</span>
                    </div>
                    <div class="product-img">
                        <a href="#">
                            <img src="<ph:ImageTag imageByte="${list.photo}"/>" alt="Product"/>
                        </a>
                    </div>
                </div>
                <div class="col-md-9 col-sm-8 col-xs-12">
                    <div class="product-description">
                        <h5><a href="#">${list.name}</a></h5>
                        <div class="price-box">
                            <span class="price">${list.price}</span>

                        </div>
                        <span class="rating">${list.likes.size()}

                                                              <img src="data:image/png;base64,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"
                                                                   id="${list.name}" type="submit" onclick="doLike(this.id)"
                                                                   width="20" height="30"> </img>
                        </span>
                        <p class="description">${list.description}</p>
                        <div class="product-action">
                            <div class="button-group">
                                <div class="product-button">
                                    <button id="${list.name}" onclick="putBusket(this.id)"
                                            ><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                                </div>
                                <div class="product-button-2">
                                    <a href="#" data-toggle="tooltip" title="" data-original-title="Wishlist"><i
                                            class="fa fa-heart-o"></i></a>
                                    <a href="#" data-toggle="tooltip" title="" data-original-title="Compare"><i
                                            class="fa fa-signal"></i></a>
                                    <a href="#" class="modal-view" data-toggle="modal" data-target="#productModal"
                                       title="Quickview"><i class="fa fa-search-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
    &ndash;%&gt;
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        <div class="owl-controls clickable">
            <div class="owl-buttons"></div>
        </div>
    </div>
</div>

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
<script src="js/main.js"></script>


</body>--%>


<body id="ooo">

<!-- Add your site or application content here -->

<!-- HEADER-AREA START -->
<header class="header-area">
    <!-- HEADER-TOP START -->
    <div class="header-top hidden-xs">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="top-menu">
                        <!-- Start Language -->
                        <ul class="language">
                            <li><a href="#"><img class="right-5" src="img/flags/gb.png" alt="#">English<i
                                    class="fa fa-caret-down left-5"></i></a>
                                <ul>
                                    <li><a href="#"><img class="right-5" src="img/flags/fr.png" alt="#">French</a></li>
                                    <li><a href="#"><img class="right-5" src="img/flags/gb.png" alt="#">English</a></li>
                                    <li><a href="#"><img class="right-5" src="img/flags/gb.png" alt="#">English</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- End Language -->
                        <!-- Start Currency -->
                        <ul class="currency">
                            <li><a href="#"><strong>$</strong> USD<i class="fa fa-caret-down left-5"></i></a>
                                <ul>
                                    <li><a href="#">$ EUR</a></li>
                                    <li><a href="#">$ GBP</a></li>
                                    <li><a href="#">$ USD</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- End Currency -->
                        <p class="welcome-msg">Default welcome msg!</p>
                    </div>
                    <!-- Start Top-Link -->
                    <div class="top-link">
                        <ul class="link">

                            <li><a href="/adm"><i class="fa fa-user">Логин</i></a></li>
                            <li><a href="/busketaction" id="busket"><i class="fa fa-heart"></i>Корзина</a></li>
                            <li><a href="checkout.html"><i class="fa fa-share"></i> Checkout</a></li>
                            <li><a href="/backoffice"><i class="fa fa-unlock-alt"></i> Login</a></li>
                        </ul>
                    </div>
                    <!-- End Top-Link -->
                </div>
            </div>
        </div>
    </div>
    <!-- HEADER-TOP END -->
    <!-- HEADER-MIDDLE START -->
    <div class="header-middle">
        <div class="container">
            <!-- Start Support-Client -->
            <div class="support-client hidden-xs">
                <div class="row">
                    <!-- Start Single-Support -->
                    <div class="col-md-3 hidden-sm">
                        <div class="single-support">
                            <div class="support-content">
                                <i class="fa fa-clock-o"></i>
                                <div class="support-text">
                                    <h1 class="zero gfont-1">working time</h1>
                                    <p>Mon- Sun: 8.00 - 18.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Single-Support -->
                    <!-- Start Single-Support -->
                    <div class="col-md-3 col-sm-4">
                        <div class="single-support">
                            <i class="fa fa-truck"></i>
                            <div class="support-text">
                                <h1 class="zero gfont-1">Free shipping</h1>
                                <p>On order over $199</p>
                            </div>
                        </div>
                    </div>
                    <!-- End Single-Support -->
                    <!-- Start Single-Support -->
                    <div class="col-md-3 col-sm-4">
                        <div class="single-support">
                            <i class="fa fa-money"></i>
                            <div class="support-text">
                                <h1 class="zero gfont-1">Money back 100%</h1>
                                <p>Within 30 Days after delivery</p>
                            </div>
                        </div>
                    </div>
                    <!-- End Single-Support -->
                    <!-- Start Single-Support -->
                    <div class="col-md-3 col-sm-4">
                        <div class="single-support">
                            <i class="fa fa-phone-square"></i>
                            <div class="support-text">
                                <h1 class="zero gfont-1">Phone: 0123456789</h1>
                                <p>Order Online Now !</p>
                            </div>
                        </div>
                    </div>
                    <!-- End Single-Support -->
                </div>
            </div>
            <!-- End Support-Client -->
            <!-- Start logo & Search Box -->

            <!-- End logo & Search Box -->
        </div>
    </div>
    <!-- HEADER-MIDDLE END -->
    <!-- START MAINMENU-AREA -->
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="mainmenu hidden-sm hidden-xs">
                        <nav>
                            <ul>
                                <li><a href="index.html">Home</a>
                                    <ul>
                                        <li><a href="index.html">Home Versions 1</a></li>
                                        <li><a href="index-2.html">Home Versions 2</a></li>
                                    </ul>
                                </li>
                                <li><a href="about.html">About Us</a></li>
                                <li class="hot"><a href="shop.html">Bestseller Products</a></li>
                                <li class="new"><a href="shop-list.html">New Products</a></li>
                                <li><a href="shop.html">Special Products</a></li>
                                <li><a href="#">Pages</a>
                                    <ul>
                                        <li><a href="cart.html">Cart</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                        <li><a href="account.html">Create Account</a></li>
                                        <li><a href="my-account.html">My Account</a></li>
                                        <li><a href="product-details.html">Product details</a></li>
                                        <li><a href="shop.html">Shop Grid View</a></li>
                                        <li><a href="shop-list.html">Shop List View</a></li>
                                        <li><a href="wishlist.html">Wish List</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MAIN-MENU-AREA -->
    <!-- Start Mobile-menu -->
    <%--<div class="mobile-menu-area hidden-md hidden-lg">
        <div class="container mean-container">
            <div class="mean-bar"><a href="#nav" class="meanmenu-reveal"
                                     style="background:;color:;right:0;left:auto;"><span></span><span></span><span></span></a>
                <nav class="mean-nav">
                    <ul style="display: none;">
                        <li><a href="index.html">Home</a>
                            <ul style="display: none;">
                                <li><a href="index.html">Home Page 1</a></li>
                                <li><a href="index-2.html">Home Page 2</a></li>
                            </ul>
                            <a class="mean-expand" href="#" style="font-size: 18px">+</a></li>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="shop.html">Bestseller Products</a></li>
                        <li><a href="shop-list.html">New Products</a></li>
                        <li><a href="#">Pages</a>
                            <ul style="display: none;">
                                <li><a href="cart.html">Cart</a></li>
                                <li><a href="checkout.html">Checkout</a></li>
                                <li><a href="account.html">Create Account</a></li>
                                <li><a href="login.html">Login</a></li>
                                <li><a href="my-account.html">My Account</a></li>
                                <li><a href="product-details.html">Product details</a></li>
                                <li><a href="shop.html">Shop Grid View</a></li>
                                <li><a href="shop-list.html">Shop List View</a></li>
                                <li><a href="wishlist.html">Wish List</a></li>
                            </ul>
                            <a class="mean-expand" href="#" style="font-size: 18px">+</a></li>
                        <li class="mean-last"><a href="contact.html">Contact Us</a></li>
                    </ul>
                </nav>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="mean-push"></div>
                    <nav id="mobile-menu" style="display: none;">
                        <ul>
                            <li><a href="index.html">Home</a>
                                <ul>
                                    <li><a href="index.html">Home Page 1</a></li>
                                    <li><a href="index-2.html">Home Page 2</a></li>
                                </ul>
                            </li>
                            <li><a href="about.html">About Us</a></li>
                            <li><a href="shop.html">Bestseller Products</a></li>
                            <li><a href="shop-list.html">New Products</a></li>
                            <li><a href="#">Pages</a>
                                <ul>
                                    <li><a href="cart.html">Cart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="account.html">Create Account</a></li>
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="my-account.html">My Account</a></li>
                                    <li><a href="product-details.html">Product details</a></li>
                                    <li><a href="shop.html">Shop Grid View</a></li>
                                    <li><a href="shop-list.html">Shop List View</a></li>
                                    <li><a href="wishlist.html">Wish List</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">Contact Us</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>--%>
    <!-- End Mobile-menu -->
</header>
<!-- HEADER AREA END -->
<!-- START PAGE-CONTENT -->
<section id="xxxxx" class="page-content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="page-menu">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><a href="#">Special Offers</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-9">
                <!-- START PRODUCT-BANNER -->
                <div class="product-banner">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="banner">
                                <a href="#"><img src="img/banner/12.jpg" alt="Product Banner"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PRODUCT-BANNER -->
                <!-- START PRODUCT-AREA -->
                <div class="product-area">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- Start Product-Menu -->
                            <div class="product-menu">
                                <div class="row">
                                    <div class="col-md-3 col-sm-12">
                                        <div class="logo">
                                            <a href="index.html" title="Malias"><img src="img/logo.png"
                                                                                     alt="Malias"></a>
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-12">
                                        <div class="header-search">
                                            <span id="xxxx"></span>


                                            <form action="/search" method="get">
                             <span id="yyyy">

                                <input type="submit" hidden="true" id="hiddenbutton" width="20" height="20"
                                       placeholder="ASASDSADADS">

                        </span>
                                                <button type="submit" id="sub"><img
                                                        src="https://thumbs.gfycat.com/WholeFlimsyDarklingbeetle-size_restricted.gif"
                                                        width="20"/></button>
                                                <div class="masonry">
                                                    <p>
                                                        <label for="amount">Price range:</label>
                                                        <input type="text" oninput="doAjax()" name="amount" id="amount">
                                                        <input type="text" oninput="doAjax()" name="amount_1"
                                                               id="amount_1">
                                                    </p>

                                                    <div id="slider-range" onclick="doAjax()"></div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="product-filter">
                                <ul role="tablist">
                                    <li role="presentation" class="list active">
                                        <a href="#display-1-1" role="tab" data-toggle="tab"></a>
                                    </li>
                                    <li role="presentation" class="grid ">
                                        <a href="#display-1-2" role="tab" data-toggle="tab"></a>
                                    </li>
                                </ul>
                                <div class="sort">
                                    <label>Сортировать</label>
                                    <form action="/sortbyprice" method="get">
                                        <select name="sel" id="sel">
                                            <option>PriceUp</option>
                                            <option>LikeUp</option>
                                            <option>PriceDown</option>
                                            <option>LikeDown</option>
                                        </select>
                                    </form>
                                </div>

                            </div>

                            <!-- End Product-Menu -->
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <!-- Start Product -->
                            <div class="product">
                                <div class="tab-content">
                                    <!-- Product -->
                                    <div role="tabpanel" class="tab-pane fade in active" id="display-1-1">
                                        <div class="row">
                                            <div class="listview">
                                                <!-- Start Single-Product -->
                                                <c:forEach items="${list}" var="list">
                                                    <div class="single-product">
                                                        /////////////////////////////////////////////////////////////////////////
                                                        <div class="col-md-3 col-sm-4 col-xs-12">
                                                            <div class="label_new">
                                                                <span class="new">new</span>
                                                            </div>
                                                            <div class="sale-off">
                                                                <span class="sale-percent">-55%</span>
                                                            </div>
                                                            <div class="product-img">
                                                                <a>

                                                                    <img class="primary-img"
                                                                         src="<ph:ImageTag imageByte="${list.photo}"/>"
                                                                         alt="Product"/>

                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-9 col-sm-8 col-xs-12">
                                                            <div class="product-description">
                                                                <h5><a href="#">${list.name}</a></h5>
                                                                <div class="price-box">
                                                                    <span class="price">${list.price}</span>

                                                                </div>

                                                                <span id="pdct" class="rating">${list.likes.size()}

                                                                              <img src="data:image/png;base64,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"
                                                                                   height="20" width="20"> </img>

                                                                      </span>
                                                                <p class="description">${list.description}</p>


                                                                <div class="product-action">
                                                                    <div class="button-group">

                                                                        <div class="product-button">
                                                                            <button  id="${list.name}"
                                                                                    onclick="putBusket(this.id)">
                                                                                В
                                                                                Корзину
                                                                            </button>
                                                                            <div  hidden=true id="${list.name}hidden">
                                                                                <button id="${list.name}buttonplus" onclick="plus(this.id)" style="cursor: pointer; font-size:14px;  text-decoration: none; padding:8px 14px; color:#1089e0; background-color:#e62929; border-radius:59px; border: 6px solid #5bd99a;">+</button>
                                                                                <span id="${list.name}span">1</span>
                                                                                <button id="${list.name}buttonminus" onclick="minus(this.id)" style="cursor: pointer; font-size:14px; text-decoration: none; padding:8px 14px; color:#1089e0; background-color:#27990b; border-radius:59px; border: 6px solid #5bd99a;">-</button>
                                                                            </div>



                                                                        </div>
                                                                        <div class="product-button-2">
                                                                            <img id="${list.name}like"
                                                                                 onclick="doLike(this.id)"
                                                                                 src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAflBMVEX///8AAADPz8/09PTq6uqurq7h4eHX19f8/PzS0tLk5ORzc3NISEiRkZHs7Oy1tbV/f3/FxcVsbGy/v79kZGQMDAxVVVWfn58zMzMbGxtdXV2pqakpKSnJyckkJCQ5OTlDQ0OVlZWFhYUdHR0UFBRGRkZQUFCBgYGKioouLi4Hz/TDAAAF0UlEQVR4nO2caWPqKhCGG6Mxxjbua12r9dr//wdvbQsMZoPKkvS8z7dzzJSZADMDTHh6AgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHwRJt1Wr9uNYmWJNOr2PkUSdQl/tBaXzSr45nQYdtqVEtvjZTP7kVgt+53IgZa/JZ6sgwzLRaIpcX6pqZHJf1llv5m28iXSa5HEfOJWdxXa/SJtb1xybAyHZRKHutl4LNP2Rv/eibxWSaxTL5bk091UqRsEsxGVaD9XSwQDX/Zk6Cho+8lVSExm1Y9/MvRnk0TpfKKMmUTlCGWsfdrFGd9pdZq+DrZRmPRGi/lK/ukQfkm83Emcx6+TXpS0JoOXZZAr4RXZwMNRjmWt/pn+vL/5m4Uksb9KfjYdTaWfN95NlILEZZt9IJR6bPo5B+m/P3K8SSQN+73nTI72x3mU/0xKe+UaUfU7+RKSp53b016BEdGkxPEVONtpcffQNzcufMo+KXH6Bd3xTXTOmBcEizKJLnFSr2a11oEMv4LUk9FeZQwsfSWyREnubpeB0KFX9Wx60unBG6GIHHsz+moTC3ULfAylJxvYr5ZId/zp4+Pa/gYRBir744bkbi4qMYC4XS9ZeMqbV8yt6GJXbWYJV+0lQx3qvuC2MFB11IlFtYdlf8Ibr3CKgiOTmKlKxHuNeWsaPgt3yiIxcx3q63cxTp3npzGP4Qp+lPETXnTysIuWNzMJj4VaaeNXMnbR6Y4ua2epqeDDHFjLOcuJEpLOUU9ANOTY16TOXi0fLI6HKW/XflbMWnK8o8EXvvZd3NhdUxS2fXiw3xTP9rr22xLwjNHB5OCpkNNlYsvhew0/ftq6Vj9rDj5yXDTGMvZnF40x2KGRcoL5CEOXjTGYf3OyD7ZwOWAYbIPGScY/8GEh60MnG31bHwGRWTh10Rh33NU1AeZgKY2Tecj70OX+Pt/BcNGY09CUadTFa33zYSHf/KzY6jYCO6Zxugbm21Bv9tvieanTrI2vLU72m+JH4m7rT7irqTyweBh+fOF2fcg9uPWYz1tyfVLK2rW+QcR3olxX1/BtDMupKe/ClestYb6PaXkRzLf13Z/N8PPfD5utiPN8l0npN+LE0+L+iTiu8nAy8zTnrds7vpx67EI6E62tobibCV5sNVGKOL60NE5DXszy4acwilQq2CkHEWPUV8GwqDaxUg4i/Ki/IkxRe2AhWpHyFH/10KTqy/hUJHPA+fEvgVRSml5kiGB0MfyX9SD1s2bzRlJj6rdmPxaVWUuTHv0oDNSohLCCiPvB3JyJpCbQ7d5FhTLGVsMt8TcPpv7mA7wJdQzFDDIuzrX4cOYiFDIypGgluNOT7UJIqauJDJkU+Hn3Moz2zKCJaT0KvO+g4+pBExNS8+5gu1kZ4vweq1iOyHDw+RVCloEZE+lgqMdXXYKOCRNJmAjeTWpnBNqLv5yLtJzfaWmJIrQXfxX66WR+9v7JWh7UxF94iS0Rf6/p1QPUxGddHSVhK+qZgGq518sojzX2ohRq4k7nVGrYEAPvPv1RT5vXjTHw7htYxcQ53BOZemUyeVCfr7ZLltAP9+ryCX4Z0veiCkdGW3r7gJ/zCV1SeodEZeiWvl2vz3KpnJh+ij0r9zfS5/x1WfBWE0t6l5QYtDXeRc2QLg0onFw9OmV3Pg5BH0C6SWGdn8JJwbOeuXYZdDUVbPLyG6mf6x8Gs3R31ILMZEylO3iaESXuCd+pDXeRkd434e+M92GkcbijR+Fvhb80DPnKDz5S2wf63wV+qCHINyn8JJ1Sdl6Dw6XHSOm6IVjeYp40Qps7BQXyVXUD2WStZXJtKbnZa9q4MJ9P4YV1PosszBLnXqp4alSmXUXOTVHjPzJCGdH+zsCmLHbVkUfq7k+NUAZZbfio+HVBxJI15RttmsfXttO0wYm2AtH2j7lQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAODf4n8EkzILsltrrQAAAABJRU5ErkJggg=="
                                                                                 height="40" width="40"> </img>

                                                                            <img height="40" width="40"
                                                                                 src="https://cdn0.iconfinder.com/data/icons/free-daily-icon-set/512/Comments-512.png"></img>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                <!-- End Single-Product -->

                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Product -->

                                </div>
                            </div>
                            <!-- End Product -->
                        </div>
                    </div>
                </div>
                <!-- END PRODUCT-AREA -->
            </div>
        </div>
    </div>
    <!-- START BRAND-LOGO-AREA -->
    <div class="brand-logo-area carosel-navigation">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="area-title">
                        <h3 class="title-group border-red gfont-1">Brand Logo</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="active-brand-logo owl-carousel owl-theme" style="opacity: 1; display: block;">
                    <div class="owl-wrapper-outer">
                        <div class="owl-wrapper"
                             style="width: 4050px; left: 0px; display: block; transition: all 0ms ease 0s; transform: translate3d(0px, 0px, 0px);">
                            <div class="owl-item" style="width: 225px;">
                                <div class="col-md-2">
                                    <div class="single-brand-logo">
                                        <a href="#"><img src="img/brand/1.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 225px;">
                                <div class="col-md-2">
                                    <div class="single-brand-logo">
                                        <a href="#"><img src="img/brand/2.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 225px;">
                                <div class="col-md-2">
                                    <div class="single-brand-logo">
                                        <a href="#"><img src="img/brand/3.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 225px;">
                                <div class="col-md-2">
                                    <div class="single-brand-logo">
                                        <a href="#"><img src="img/brand/4.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 225px;">
                                <div class="col-md-2">
                                    <div class="single-brand-logo">
                                        <a href="#"><img src="img/brand/5.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 225px;">
                                <div class="col-md-2">
                                    <div class="single-brand-logo">
                                        <a href="#"><img src="img/brand/6.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 225px;">
                                <div class="col-md-2">
                                    <div class="single-brand-logo">
                                        <a href="#"><img src="img/brand/1.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 225px;">
                                <div class="col-md-2">
                                    <div class="single-brand-logo">
                                        <a href="#"><img src="img/brand/2.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="owl-item" style="width: 225px;">
                                <div class="col-md-2">
                                    <div class="single-brand-logo">
                                        <a href="#"><img src="img/brand/3.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="owl-controls clickable">
                        <div class="owl-buttons">
                            <div class="owl-prev"><i class="fa fa-angle-left"></i></div>
                            <div class="owl-next"><i class="fa fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END BRAND-LOGO-AREA -->
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
                                <i class="fa fa-envelope-o"></i>
                                <p><a href="contact.html">admin@bootexperts.com</a></p>
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
                        <p>Copyright © Взято с <a href="http://bayguzin.ru" target="_blank"> bayguzin.ru</a> All rights
                            reserved.</p>
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
<!-- QUICKVIEW PRODUCT -->
<div id="quickview-wrapper">
    <!-- Modal -->
    <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">×</span></button>
                </div>
                <div class="modal-body">
                    <div class="modal-product">
                        <div class="product-images">
                            <div class="main-image images">
                                <img alt="#" src="img/product/quickview-photo.jpg">
                            </div>
                        </div><!-- .product-images -->

                        <div class="product-info">
                            <h1>Aenean eu tristique</h1>
                            <div class="price-box-3">
                                <hr>
                                <div class="s-price-box">
                                    <span class="new-price">$160.00</span>
                                    <span class="old-price">$190.00</span>
                                </div>
                                <hr>
                            </div>
                            <a href="shop.html" class="see-all">See all features</a>
                            <div class="quick-add-to-cart">
                                <form method="post" class="cart">
                                    <div class="numbers-row">
                                        <input type="number" id="french-hens" value="3">
                                    </div>
                                    <button class="single_add_to_cart_button" type="submit">Add to cart</button>
                                </form>
                            </div>
                            <div class="quick-desc">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est
                                tristique auctor. Donec non est at libero.
                            </div>
                            <div class="social-sharing">
                                <div class="widget widget_socialsharing_widget">
                                    <h3 class="widget-title-modal">Share this product</h3>
                                    <ul class="social-icons">
                                        <li><a target="_blank" title="Facebook" href="#" class="facebook social-icon"><i
                                                class="fa fa-facebook"></i></a></li>
                                        <li><a target="_blank" title="Twitter" href="#" class="twitter social-icon"><i
                                                class="fa fa-twitter"></i></a></li>
                                        <li><a target="_blank" title="Pinterest" href="#" class="pinterest social-icon"><i
                                                class="fa fa-pinterest"></i></a></li>
                                        <li><a target="_blank" title="Google +" href="#" class="gplus social-icon"><i
                                                class="fa fa-google-plus"></i></a></li>
                                        <li><a target="_blank" title="LinkedIn" href="#" class="linkedin social-icon"><i
                                                class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div><!-- .product-info -->
                    </div><!-- .modal-product -->
                </div><!-- .modal-body -->
            </div><!-- .modal-content -->
        </div><!-- .modal-dialog -->
    </div>
    <!-- END Modal -->
</div>
<!-- END QUICKVIEW PRODUCT -->


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
<script src="js/main.js"></script>
<a id="scrollUp" href="#top" style="position: fixed;/* z-index: 2147483647; display: inline;*/"><img width="15"
                                                                                                     height="20"
                                                                                                     src="https://st3.depositphotos.com/5532432/18059/v/1600/depositphotos_180590996-stock-illustration-shopping-cart-vector-outline-icon.jpg"></img></a>


</body>


</html>
