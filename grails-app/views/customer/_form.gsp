<%@ page import="checkin.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="customer.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${customerInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'reg', 'error')} required">
	<label for="reg">
		<g:message code="customer.reg.label" default="Reg" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="reg" required="" value="${customerInstance?.reg}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="customer.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${customerInstance?.location}"/>

</div>

