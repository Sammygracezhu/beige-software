<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="entity/?nameRenderer=printEntity&nameAction=print&nameEntity=${param.nameEntity}&idEntity=${entity.itsId}" target="_blank" class="btn btn-sm" >${srvI18n.getMsg("Print")}</a>
<a href="entity/?nameRenderer=printEntity&nameAction=print&actionAdd=full&nameEntity=${param.nameEntity}&idEntity=${entity.itsId}" target="_blank" class="btn btn-sm" >${srvI18n.getMsg("PrintFull")}</a>
<button class="btn btn-sm" onclick="getHtmlByAjax('GET', 'entity/?nameRenderer=editEntityJson&nameAction=edit&nameEntity=${param.nameEntity}&page=${param.page}&idEntity=${entity.itsId}${flyParams}');">${srvI18n.getMsg("Edit")}</button>
<c:if test="${entity.totalDebit.doubleValue() == 0}">
  <button class="btn btn-sm" onclick="getHtmlByAjax('GET', 'entity/?nameRenderer=confirmDeleteEntityJson&nameAction=confirmDelete&nameEntity=${param.nameEntity}&page=${param.page}&idEntity=${entity.itsId}${flyParams}');">${srvI18n.getMsg("Delete")}</button>
</c:if>
