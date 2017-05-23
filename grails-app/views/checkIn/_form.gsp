<%@ page import="checkin.CheckIn" %>



<div class="fieldcontain ${hasErrors(bean: checkInInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="checkIn.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="customer" name="customer.id" from="${checkin.Customer.list()}" optionKey="id" required="" value="${checkInInstance?.customer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: checkInInstance, field: 'shop', 'error')} required">
	<label for="shop">
		<g:message code="checkIn.shop.label" default="Shop" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="shop" name="shop.id" from="${checkin.Shop.list()}" optionKey="id" required="" value="${checkInInstance?.shop?.id}" class="many-to-one"/>

</div>

<!--
<div class="fieldcontain ${hasErrors(bean: checkInInstance, field: 'time', 'error')} required">
	<label for="time">
		<g:message code="checkIn.time.label" default="Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="time" precision="day"  value="${checkInInstance?.time}"  />

</div>
-->

