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
        <c:url value="/css/expandable.css" var="jstlCss" />
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
            <div class="error_msg">
                ${errorMessage}
            </div>

            <c:forEach items="${elections}" var="election">
                <button class="accordion">${election.name}</button>
                <div class="panel">
                    <input class="search_box" type="text" id="myInput${election.id}" onkeyup="candidateFilterTable(2,${election.id})" placeholder='   جستجو...'/>
                    <table id="myTable${election.id}" class="table_total">
                        <tr>
                                <th class="table_header" >کد نامزد</th>
                                <th class="table_header" >نام</th>
                                <th class="table_header" >نام خانوادگی</th>
                                <th class="table_header" >کد پرسنلی</th>
                                <th class="table_header" >استان</th>
                                <th class="table_header" >شعبه</th>
                                <th class="table_header" >جزییات</th>
                        </tr>
                          <c:forEach items="${election.candidates}" var="candidate">
                            <tr>
                                <td>${candidate.candidateCode}</td>
                                <td>${candidate.firstName}</td>
                                <td>${candidate.lastName}</td>
                                <td>${candidate.personalCode}</td>
                                <td>${candidate.provinceName}</td>
                                <td>${candidate.branchName}</td>
                                <td><a href="/files?filename=${candidate.candidateCode}.pdf">جزییات</a></td>
                            </tr>
                          </c:forEach>
                    </table>
                </div>
            </c:forEach>

            <script>
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function() {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.display === "block") {
                        panel.style.display = "none";
                    } else {
                        panel.style.display = "block";
                    }
                });
            }
            </script>

    </body>
</html>