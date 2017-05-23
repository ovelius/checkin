<%@ page import="checkin.Shop" %>



<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="shop.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${shopInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shopInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="shop.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${shopInstance?.location}"/>

</div>

