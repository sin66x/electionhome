<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

    	<!--
    	<spring:url value="/css/main.css" var="springCss" />
    	<link href="${springCss}" rel="stylesheet" />
    	 -->
    	<c:url value="/css/main.css" var="jstlCss" />
    	<link href="${jstlCss}" rel="stylesheet" />

        <script src="/script/jquery-3.3.1.min.js"></script>
    	<script src="/script/main.js"></script>

    </head>

    <body dir="rtl">
            <nav class="navbar navbar-inverse">
                <div class="container" style='float:right'>
                    <div class="navbar-header" style="float:inherit">
                        <a class="navbar-brand" href="/"><img src="/images/home.png"></a>
                    </div>
                    <div id="navbar" class="collapse navbar-collapse" style="float:inherit">
                        <ul class="nav navbar-nav">

                                <li id="terms"><a href="/terms">قوانین و مقررات</a></li>
                                <li ><a href="http://localhost:8080/">رای گیری</a></li>
                                <li id="advertise"><a href="/">تبلیغات</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
    </body>
</html>