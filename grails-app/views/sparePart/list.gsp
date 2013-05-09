
<%@ page import="com.nic.SparePart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sparePart.label', default: 'SparePart')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sparePart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sparePart" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="desc" title="${message(code: 'sparePart.desc.label', default: 'Desc')}" />
					
						<g:sortableColumn property="enable" title="${message(code: 'sparePart.enable.label', default: 'Enable')}" />
					
						<g:sortableColumn property="matCode" title="${message(code: 'sparePart.matCode.label', default: 'Mat Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'sparePart.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sparePartInstanceList}" status="i" var="sparePartInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sparePartInstance.id}">${fieldValue(bean: sparePartInstance, field: "desc")}</g:link></td>
					
						<td><g:formatBoolean boolean="${sparePartInstance.enable}" /></td>
					
						<td>${fieldValue(bean: sparePartInstance, field: "matCode")}</td>
					
						<td>${fieldValue(bean: sparePartInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sparePartInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
