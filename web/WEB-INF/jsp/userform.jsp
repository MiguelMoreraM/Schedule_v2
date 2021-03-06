<%-- 
    Document   : userform
    Created on : 24-ene-2017, 12:05:12
    Author     : nmohamed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/recursos/css/bootstrap.css"/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/estilotabla.css"/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/recursos/css/estilocolegio.css" />"/>
        <script type="text/javascript" src="<c:url value="/recursos/js/jquery-2.2.0.js" />"></script>

        <script type="text/javascript" src="<c:url value="/recursos/js/bootstrap.js" />"></script>

    </head>
    <body>
        <script>
            $(document).ready(function () {
                /* $("form input").prop("disabled", "true");
                 $("form input").first().prop("disabled", "");
                 $(".btn").prop("disabled", "true");*/


            });
            function enviando()
            {
                $('#crearhorario').submit();

                $('#pleaseWaitDialog').modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $('#pleaseWaitDialog').modal('show');


                var start = new Date();
                var maxTime = 80000;
                var timeoutVal = Math.floor(maxTime / 100);
                animateUpdate();

                function updateProgress(percentage) {
                    $('#pbar_innerdiv').css("width", percentage + "%");
                    $('#pbar_innertext').text(percentage + "%");
                }

                function animateUpdate() {
                    var now = new Date();
                    var timeDiff = now.getTime() - start.getTime();
                    var perc = Math.round((timeDiff / maxTime) * 100);
                    console.log(perc);
                    if (perc <= 100) {
                        updateProgress(perc);

                        setTimeout(animateUpdate, timeoutVal);
                    }
                }

            }
        </script>
        <div class="col-sm-12" style="margin-top: 10px;">
            <div class="panel panel-success">
                <div class="panel-body"align="center">
                    <div class="container " style="margin-top: 10%; margin-bottom: 10%;">

                        <div class="panel panel-success" style="max-width: 35%;" align="left">
                            <div class="panel-heading form-group fondoGris">
                                <img class="img-responsive center-block" src="recursos/img/logoeduweb.png" alt="logo"/>
                            </div>
                            <div class="panel-body" >
                                <!--<form id="idForm" name ="form1" action="userform.htm?opcion=login" method="post" >-->
                                <form  name ="form1" action="userform.htm?opcion=login" method="post" >
                                    <div
                                        <c:if test="${message != null}">
                                            <h5 style="color:blue">
                                                <c:out value="${message}"/>
                                            </h5>
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleDistrictCode"><spring:message code="etiq.txtDistrictCode"/></label> 
                                        <select class="form-control" name="selectDistrictCode" id="selectSchoolCode">
                                            <option value="IS-PAN">IS-PAN</option>
                                            <option value="MD-PAN">MD-PAN</option>
                                            <option value="RWI-SPAIN">RWI-SPAIN</option>
                                        </select>                                     
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><spring:message code="etiq.txtuser"/></label> 
                                        <input type="text" class="form-control" name="txtusuario" id="txtusuario" placeholder="<spring:message code='etiq.txtinsertuser'/>" required="required">    
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1"><spring:message code="etiq.txtpassword"/></label> 
                                        <input type="password" class="form-control" name="txtpassword" id="txtpassword" placeholder="<spring:message code='etiq.txtinsertpassword'/>" ><!--required="required"-->
                                    </div>
                                    <button  type="submit" name="submit" value='<spring:message code="etiq.txtlogin"/>' style="width: 100%; font-size:1.1em;" class="btn btn-large btn btn-success btn-lg btn-block" ><b>Login</b></button>
                                    
                                </form>
                                <div class="center-block text-center">
                                    <a class="btn" href="datosIdioma.htm?lenguaje=en"><spring:message code="etiq.txtenglish"/></a>
                                    <a class="btn" href="datosIdioma.htm?lenguaje=es"><spring:message code="etiq.txtspanish"/></a>
                                    <a class="btn" href="datosIdioma.htm?lenguaje=ar"><spring:message code="etiq.txtarabic"/></a>
                                </div> 
                            </div>
                        </div>

                    </div>

                </div>
                <div class="panel-footer" align="center"><font style="color: #111">Copyright @2016, EduWeb Group, All Rights Reserved. </font></div>
            </div>
        </div>                   
    </body>
</html>
