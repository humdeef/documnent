<%
' ���ܣ�������������˻�-�����ϴ������ļ����ܽӿڽ���ҳ
' �汾��3.3
' ���ڣ�2012-07-17
' ˵����
' ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
' �ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���
	
' /////////////////ע��/////////////////
' ������ڽӿڼ��ɹ������������⣬���԰��������;�������
' 1���̻��������ģ�https://b.alipay.com/support/helperApply.htm?action=consultationApply�����ύ���뼯��Э�������ǻ���רҵ�ļ�������ʦ������ϵ��Э�����
' 2���̻��������ģ�http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9��
' 3��֧������̳��http://club.alipay.com/read-htm-tid-8681712.html��
' /////////////////////////////////////

%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
<title>֧����������������˻�-�����ϴ������ļ����ܽӿ�</title>
</head>
<body>

<!--#include file="class/alipay_submit.asp"-->

<%
'/////////////////////�������/////////////////////

        '�������첽֪ͨҳ��·��
        notify_url = "http://�̻����ص�ַ/bptb_user_confirm-ASP-GBK/notify_url.asp"
        '��http://��ʽ������·�����������?id=123�����Զ������
        'ҳ����תͬ��֪ͨҳ��·��
        return_url = "http://�̻����ص�ַ/bptb_user_confirm-ASP-GBK/return_url.asp"
        '��http://��ʽ������·�����������?id=123�����Զ������
        '������֧�����˻�
        email = Request.Form("WIDemail")
        '����
        '��Ҫ���˵��ļ���
        file_name = Request.Form("WIDfile_name")
        '������뺬��չ�����磺20120711001.csv

'/////////////////////�������/////////////////////

'���������������
sParaTemp = Array("service=bptb_user_confirm","partner="&partner,"_input_charset="&input_charset  ,"notify_url="&notify_url   ,"return_url="&return_url   ,"email="&email   ,"file_name="&file_name  )

'��������
Set objSubmit = New AlipaySubmit
sHtml = objSubmit.BuildRequestForm(sParaTemp, "get", "ȷ��")
response.Write sHtml


%>
</body>
</html>
