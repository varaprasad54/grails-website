

<%@ page import="org.grails.wiki.WikiPage" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'wikiPage.label', default: 'WikiPage')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <r:require modules="codeMirror, fancyBox"/>
</head>

<body>

<h1 class="page-header">
    <g:message code="default.edit.label" args="[entityName]"/>
    <span class="pull-right">
        <g:link class="btn" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link>
        <g:link class="btn" action="create"><g:message code="default.create.label" args="[entityName]"/></g:link>
    </span>
</h1>

<g:if test="${flash.message}">
    <div class="alert alert-info">${flash.message}</div>
</g:if>

<g:hasErrors bean="${wikiPageInstance}">
    <div class="alert alert-error">
        <g:renderErrors bean="${wikiPageInstance}" as="list"/>
    </div>
</g:hasErrors>

<g:form method="post" class="form-horizontal" url="[controller:'wikiPage', action:'update', id:wikiPageInstance.id]" >

<g:hiddenField name="id" value="${wikiPageInstance?.id}"/>
<g:hiddenField name="version" value="${wikiPageInstance?.version}"/>



<div class="control-group ${hasErrors(bean: wikiPageInstance, field: 'title', 'error')}">
    <label class="control-label" for="title">
        <g:message code="wikiPage.title.label" default="Title"/>
    </label>

    <div class="controls">
        <g:textField name="title" pattern="${wikiPageInstance.constraints.title.matches}" required="" value="${wikiPageInstance?.title}"/>
    </div>
</div>


<div class="control-group ${hasErrors(bean: wikiPageInstance, field: 'body', 'error')}">
    <label class="control-label" for="body">
        <g:message code="wikiPage.body.label" default="Body"/>
    </label>

    <div class="controls">
               <g:textArea cols="30" rows="20" id="wikiPageBody" name="body"
                            value="${wikiPageInstance?.body}" class="input-fullsize"/>
    </div>
</div>


<div class="control-group ${hasErrors(bean: wikiPageInstance, field: 'locked', 'error')}">
    <label class="control-label" for="locked">
        <g:message code="wikiPage.locked.label" default="Locked"/>
    </label>

    <div class="controls">
        <g:checkBox name="locked" value="${wikiPageInstance?.locked}" />
    </div>
</div>


<div class="control-group ${hasErrors(bean: wikiPageInstance, field: 'deprecatedUri', 'error')}">
    <label class="control-label" for="deprecatedUri">
        <g:message code="wikiPage.deprecatedUri.label" default="Deprecated Uri"/>
    </label>

    <div class="controls">
        <g:textField name="deprecatedUri" value="${wikiPageInstance?.deprecatedUri}"/>
    </div>
</div>


<div class="control-group ${hasErrors(bean: wikiPageInstance, field: 'deprecated', 'error')}">
    <label class="control-label" for="deprecated">
        <g:message code="wikiPage.deprecated.label" default="Deprecated"/>
    </label>

    <div class="controls">
        <g:checkBox name="deprecated" value="${wikiPageInstance?.deprecated}" />
    </div>
</div>


<div class="control-group ${hasErrors(bean: wikiPageInstance, field: 'versions', 'error')}">
    <label class="control-label" for="versions">
        <g:message code="wikiPage.versions.label" default="Versions"/>
    </label>

    <div class="controls">
        
<ul class="one-to-many">
<g:each in="${wikiPageInstance?.versions?}" var="v">
    <li><g:link controller="version" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="version" action="create" params="['wikiPage.id': wikiPageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'version.label', default: 'Version')])}</g:link>
</li>
</ul>

    </div>
</div>


<div class="form-actions">
    <g:submitButton name="update" class="btn btn-primary"
                    value="${message(code: 'default.button.update.label', default: 'Update')}"/>
    <g:actionSubmit class="btn btn-danger" action="delete"
                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
    <g:link class="btn" action="list">Cancel</g:link>
</div>

</g:form>
<g:render template="/content/wikiCodeMirrorJavaScript"></g:render>
</body>
</html>
