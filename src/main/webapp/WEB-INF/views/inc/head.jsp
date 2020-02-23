<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="canonical" href="http://www.manseong.com">
<meta name="apple-mobile-web-app-title" content="만성닷컴">
<meta name="robots" content="index,follow">
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate value="${today}" pattern="yyyyMMdd-HHmm" var="nowDate"/>

<title>만성닷컴</title>
<meta name="description" content="만성동 가게 찾을 때는, 역시 만성닷컴!">
<link rel="icon" href="<c:url value="/resources/img/comm/favicon.ico"/>">
<link rel=" shortcut icon" href="<c:url value="/resources/img/comm/favicon.ico"/>">

<meta property="og:title" content="만성닷컴">
<meta property="og:url" content="http://www.manseong.com">
<meta property="og:image" content="<c:url value="/resources/img/comm/og.jpg"/>">
<meta property="og:description" content="만성동 가게 찾을 때는, 역시 만성닷컴!">

<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="만성닷컴">
<meta name="twitter:url" content="http://www.manseong.com">
<meta name="twitter:image" content="<c:url value="/resources/img/comm/og.jpg"/>">
<meta name="twitter:description" content="만성동 가게 찾을 때는, 역시 만성닷컴!">

<link rel="stylesheet" href="<c:url value="/resources/css/reset.css"><c:param name="dt" value="${nowDate }"/></c:url>">
<link rel="stylesheet" href="<c:url value="/resources/css/common.css"><c:param name="dt" value="${nowDate }"/></c:url>">
<link rel="stylesheet" href="<c:url value="/resources/css/layout.css"><c:param name="dt" value="${nowDate }"/></c:url>">
<link rel="stylesheet" href="<c:url value="/resources/css/contents.css"><c:param name="dt" value="${nowDate }"/></c:url>">
<link rel="stylesheet" href="<c:url value="/resources/css/login.css"><c:param name="dt" value="${nowDate }"/></c:url>">
<script src="<c:url value="/resources/js/jquery-1.12.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.bxslider.min.js"/>"></script>
<script src="<c:url value="/resources/js/common.js"><c:param name="dt" value="${nowDate }"/></c:url>"></script>

<meta name="naver-site-verification" content="82901f76e37c1d0eb569afcfb4b880145299a9af"/>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-158790823-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-158790823-1');
</script>