<%-- 
    Document   : multilanguage
    Created on : May 14, 2018, 8:21:37 PM
    Author     : Kuro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${param.language}" scope="session" />
<c:if test="${not empty language}">
    <fmt:setLocale value="${language}" />
</c:if>
<fmt:setBundle basename="text" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MultiLanguage</title>
    </head>
    <body>
        <form>
            <select name="language" onchange="submit()">
                <option disabled selected value> -- select language -- </option>
                <option value="en_US"><fmt:message key="EN"/></option>
                <option value="fr_FR"><fmt:message key="FR"/></option>
                <option value="vi_VN"><fmt:message key="VN"/></option>
            </select>
        </form>
    </body>
</html>
