<%@ tag body-content="scriptless" language="java" pageEncoding="EUC-KR"%>
<%@ attribute name="count" type="java.lang.Integer" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach begin="1" end="${count}">
<jsp:doBody></jsp:doBody>
</c:forEach>