<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
    <!-- java.util�� ���� �� ���ڴٴ� �Ҹ� -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<!-- el�� �ϴ� �ѹ� �������� �ϰ� ����ȴ� 
�׷��� �������� ��������� ���� �ε��Ҽ������� �ε��Ҽ��� ������ �� �� -->
<body>
<%
//��Ÿ���� ���� �ʿ� ����ִ� ���� � ���� �ְ� �� �ָ� �ҷ��;��ϴµ� ���⼭�� �׳� �ʿ��� �ٷ� ���� �� �־ ����
Map<String, String> map = new HashMap<>();
map.put("one", "hello");
map.put("two", "World");
/* map.put("3", "c");
String a = map.get("1"); */
pageContext.setAttribute("map", map);
//pageContext�� �޸𸮶�� �����ϸ� �� page�� page ���� ���� ������ ���� �͵� : ��Ű(�������� ������)/����(������ ������)
//���ٿ� page �ȿ����� �����Ǿ�� �ϴ� �͵��� �ִµ� �̰� pageContext ��� �ٸ� �������� �̵� �Ǵ� ���� �����
//application �޸𸮴� ��Ű/���Ǻ��ٵ� �� ���� ������ ��
%>
<%-- map[1] : <%= a %><br/>
${map["1"]}<br/>
${10 + 20}<br/>
<!-- �� ���ο��� ���� ������ �Ǹ鼭 ����� ���� ���������� ��µǰ� �� -->
${true&&false}<br/>
<!-- �� ���� ��� ������������ a�� ��� --> --%>
${map.get("one")}, ${map["one"]}, ${map.one}

${(10*10) ne 100} <br/>
${pageContext.request.contextPath}<br/>
</body>
</html>