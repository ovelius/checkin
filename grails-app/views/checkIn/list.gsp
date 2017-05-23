
<%@ page import="checkin.CheckIn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'checkIn.label', default: 'CheckIn')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-checkIn" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-checkIn" class="content scaffold-list" role="main">
			<h1><g:message code="default.checkin.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="checkIn.customer.label" default="Customer" /></th>
					
						<th><g:message code="checkIn.shop.label" default="Shop" /></th>
					
						<g:sortableColumn property="time" colspan="2" title="${message(code: 'checkIn.time.label', default: 'Time')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${checkInInstanceList}" status="i" var="checkInInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${checkInInstance.id}">${fieldValue(bean: checkInInstance, field: "customer")}</g:link></td>
					
						<td>${checkInInstance.customer.location}</td>
					
						<td><g:formatDate format="yyyy-MM-dd HH:mm" date="${checkInInstance.time}" /></td>
					
                                                <td><g:form url="[resource:checkInInstance, action:'delete']" method="DELETE">
                                                    <fieldset class="buttons">
                                                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                                    </fieldset>
                                                    </g:form>
                                                </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${checkInInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
