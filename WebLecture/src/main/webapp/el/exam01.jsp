<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- jsp�� ���� �׷��� ���� �ڵ� ������ h?d? �����̶�� �ָ� ��ӹ޾Ƽ� ��?
sd���������� ���� ���������� �� �� �� ���� tomcat�������� ���� lib���� �ٿ��� ����� 
io�� �����ͼ� ���� ��....�������� �� ����� �޾Ƽ� ���� �ִ� ��(���� �ִ� import) �̰� �ʹ� �����Ƽ� �Ⱦ��� ������ �ʹ� �Բ� �־���ϴ�
��Ģ�� �ʹ����� ������ �׷��� ASP�� ���� ������ �װ� �ؼ��ϱ� ���ؼ� jsp�� ������� .jsp�̱⸸ �ϸ� �� �� �ֵ��� ����� ��
�ٵ� ���� jsp�� ȭ���� tomcat �������� jsp�� �������� ��û�� �ؾ� �н��� ã�� �� exam.jsp�� ã�µ� ������ �����ٶ� �̰� �ִ� servlet�� ã�ƾ� �갡 jsp�� ����ȭ�ؼ� ������ �� ����
�׷��� �ε��� �̳� ���� jsp ������ ������ �ֳ� ������ ��Ī�ϱ� ���� 
����Ʈ �ּ�(���� �̰��� ���� �ּ�)�� Ŭ���̾�Ʈ���� ���̰� ������������ f12 �ϸ� ���̴� ���� ȭ�鿡���� �Ⱥ���
-->
	Hello!!
	<br>
	<%--
	jsp���� ������ ���� ������ ������ �ʴ� �ּ��� �׷��� �����ڴ� �ݵ�� jsp �ּ��� �����
	  http://localhost:8080/WebLecture/el/exam01.jsp?name=hong �Է½� hong�� ����ϰ� ����
	  http://localhost:8080/WebLecture/el/exam01.jsp?name=hong&id=kkk
	 --%>
	
	�̸� : <%= request.getParameter("name") %><br/>
	�̸� : ${ param.name } <br>
	ID : ${ param.id }
</body>
</html>