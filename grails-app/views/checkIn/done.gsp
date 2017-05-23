
<%@ page import="checkin.CheckIn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'checkIn.label', default: 'CheckIn')}" />
		<title><g:message code="default.done" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-checkIn" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-checkIn" class="content scaffold-show" role="main">
			<h1><g:message code="default.done" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list checkIn">
			
				<g:if test="${checkInInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="checkIn.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label">${checkInInstance?.customer?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${checkInInstance?.shop}">
				<li class="fieldcontain">
					<span id="shop-label" class="property-label"><g:message code="checkIn.shop.label" default="Shop" /></span>
					
						<span class="property-value" aria-labelledby="shop-label">${checkInInstance?.shop?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
			
			</ol>

		</div>
	</body>
</html>
