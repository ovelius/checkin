<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'checkIn.label', default: 'CheckIn')}" />
        <title><g:message code="default.welcome.text" /></title>
    </head>
    <body>
        <a href="#create-checkIn" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="create-checkIn" class="content scaffold-create" role="main">
            <h1><g:message code="default.welcome.text" args="${shop}" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${checkInInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${checkInInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form url="[resource:checkInInstance, action:'saveRegistration']" >
                <fieldset class="form">
                    <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'reg', 'error')} required">
                        <label for="reg">
                            <g:message code="customer.reg.label" default="Reg" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="reg" placeholder="ABC123" required="" value="${params?.reg}"/>

                    </div>
                </fieldset>
                <input type="hidden" id="shop" name="shop" value="${params['shop']}" />
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
