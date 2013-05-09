<%@ page import="com.nic.SparePart" %>



<div class="fieldcontain ${hasErrors(bean: sparePartInstance, field: 'desc', 'error')} ">
	<label for="desc">
		<g:message code="sparePart.desc.label" default="Desc" />
		
	</label>
	<g:textField name="desc" value="${sparePartInstance?.desc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sparePartInstance, field: 'enable', 'error')} ">
	<label for="enable">
		<g:message code="sparePart.enable.label" default="Enable" />
		
	</label>
	<g:checkBox name="enable" value="${sparePartInstance?.enable}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sparePartInstance, field: 'matCode', 'error')} ">
	<label for="matCode">
		<g:message code="sparePart.matCode.label" default="Mat Code" />
		
	</label>
	<g:textField name="matCode" value="${sparePartInstance?.matCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sparePartInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="sparePart.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${sparePartInstance?.name}"/>
</div>

