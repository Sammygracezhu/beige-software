<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="${entity.getClass().simpleName}.${fieldName}">${srvI18n.getMsg(fieldName)}</label>
  </td>
  <td>
    <div class="input-line">
      <c:set var="required" value=""/>
      <c:if test="${srvOrm.tablesMap[entity.getClass().simpleName].fieldsMap[fieldName].definition.contains('not null')}">
        <c:set var="required" value="required"/>
      </c:if>
      <input type="date" ${autofocus} ${required} name="${entity.getClass().simpleName}.${fieldName}" value="${utlJsp.dateToIso8601(entity[fieldName])}" onchange="inputHasBeenChanged(this);"/> 
      <c:set var="autofocus" value="" scope="request"/>
    </div>
  </td>
</tr>
