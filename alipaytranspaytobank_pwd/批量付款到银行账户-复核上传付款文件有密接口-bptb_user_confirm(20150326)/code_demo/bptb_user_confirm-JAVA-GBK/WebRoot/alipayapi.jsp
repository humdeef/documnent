<%
/* *
 *���ܣ�������������˻�-�����ϴ������ļ����ܽӿڽ���ҳ
 *�汾��3.3
 *���ڣ�2012-08-14
 *˵����
 *���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 *�ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

 *************************ע��*****************
 *������ڽӿڼ��ɹ������������⣬���԰��������;�������
 *1���̻��������ģ�https://b.alipay.com/support/helperApply.htm?action=consultationApply�����ύ���뼯��Э�������ǻ���רҵ�ļ�������ʦ������ϵ��Э�����
 *2���̻��������ģ�http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9��
 *3��֧������̳��http://club.alipay.com/read-htm-tid-8681712.html��
 *�������ʹ����չ���������չ���ܲ�������ֵ��
 **********************************************
 */
%>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>֧����������������˻�-�����ϴ������ļ����ܽӿ�</title>
	</head>
	<%
		////////////////////////////////////�������//////////////////////////////////////

		//�������첽֪ͨҳ��·��
		String notify_url = "http://�̻����ص�ַ/bptb_user_confirm-JAVA-GBK/notify_url.jsp";
		//��http://��ʽ������·�����������?id=123�����Զ������
		//ҳ����תͬ��֪ͨҳ��·��
		String return_url = "http://�̻����ص�ַ/bptb_user_confirm-JAVA-GBK/return_url.jsp";
		//��http://��ʽ������·�����������?id=123�����Զ������
		//������֧�����˻�
		String email = new String(request.getParameter("WIDemail").getBytes("ISO-8859-1"),"GBK");
		//����
		//��Ҫ���˵��ļ���
		String file_name = new String(request.getParameter("WIDfile_name").getBytes("ISO-8859-1"),"GBK");
		//������뺬��չ�����磺20120711001.csv
		
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//������������������
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "bptb_user_confirm");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("notify_url", notify_url);
		sParaTemp.put("return_url", return_url);
		sParaTemp.put("email", email);
		sParaTemp.put("file_name", file_name);
		
		//��������
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","ȷ��");
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>
