<%
/* *
 *���ܣ�������������˻�-�ϴ������ļ����ܽӿڽ���ҳ
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
		<title>֧����������������˻�-�ϴ������ļ����ܽӿ�</title>
	</head>
	<%
		////////////////////////////////////�������//////////////////////////////////////

		
		//�ϴ������ļ�
		String bptb_pay_file = new String(request.getParameter("WIDbptb_pay_file").getBytes("ISO-8859-1"),"GBK");
		//�����Ǿ���·�����ļ����������ظ�

		//�ļ�ժҪ�㷨,MD5��SHA
		String file_digest_type = "MD5";
		
		//�ļ�ժҪ
		String digest_bptb_pay_file = AlipayCore.getAbstract(bptb_pay_file,file_digest_type);
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//������������������
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "bptb_pay_file_confirm");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("file_digest_type", file_digest_type);
		sParaTemp.put("digest_bptb_pay_file", digest_bptb_pay_file);
		
		//��������
		String sHtmlText = AlipaySubmit.buildRequest("bptb_pay_file", bptb_pay_file, sParaTemp);
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>
