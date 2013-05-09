
<%@ page import="com.nic.SparePart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sparePart.label', default: 'SparePart')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sparePart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sparePart" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sparePart">
			
				<g:if test="${sparePartInstance?.desc}">
				<li class="fieldcontain">
					<span id="desc-label" class="property-label"><g:message code="sparePart.desc.label" default="Desc" /></span>
					
						<span class="property-value" aria-labelledby="desc-label"><g:fieldValue bean="${sparePartInstance}" field="desc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sparePartInstance?.enable}">
				<li class="fieldcontain">
					<span id="enable-label" class="property-label"><g:message code="sparePart.enable.label" default="Enable" /></span>
					
						<span class="property-value" aria-labelledby="enable-label"><g:formatBoolean boolean="${sparePartInstance?.enable}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sparePartInstance?.matCode}">
				<li class="fieldcontain">
					<span id="matCode-label" class="property-label"><g:message code="sparePart.matCode.label" default="Mat Code" /></span>
					
						<span class="property-value" aria-labelledby="matCode-label"><g:fieldValue bean="${sparePartInstance}" field="matCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sparePartInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="sparePart.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${sparePartInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${sparePartInstance?.id}" />
					<g:link class="edit" action="edit" id="${sparePartInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
