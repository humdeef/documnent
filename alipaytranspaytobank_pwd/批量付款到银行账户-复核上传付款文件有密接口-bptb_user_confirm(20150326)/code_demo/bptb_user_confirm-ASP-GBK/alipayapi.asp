<%
' 功能：批量付款到银行账户-复核上传付款文件有密接口接入页
' 版本：3.3
' 日期：2012-07-17
' 说明：
' 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
' 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
	
' /////////////////注意/////////////////
' 如果您在接口集成过程中遇到问题，可以按照下面的途径来解决
' 1、商户服务中心（https://b.alipay.com/support/helperApply.htm?action=consultationApply），提交申请集成协助，我们会有专业的技术工程师主动联系您协助解决
' 2、商户帮助中心（http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9）
' 3、支付宝论坛（http://club.alipay.com/read-htm-tid-8681712.html）
' /////////////////////////////////////

%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
<title>支付宝批量付款到银行账户-复核上传付款文件有密接口</title>
</head>
<body>

<!--#include file="class/alipay_submit.asp"-->

<%
'/////////////////////请求参数/////////////////////

        '服务器异步通知页面路径
        notify_url = "http://商户网关地址/bptb_user_confirm-ASP-GBK/notify_url.asp"
        '需http://格式的完整路径，不允许加?id=123这类自定义参数
        '页面跳转同步通知页面路径
        return_url = "http://商户网关地址/bptb_user_confirm-ASP-GBK/return_url.asp"
        '需http://格式的完整路径，不允许加?id=123这类自定义参数
        '付款人支付宝账户
        email = Request.Form("WIDemail")
        '必填
        '需要复核的文件名
        file_name = Request.Form("WIDfile_name")
        '必填，必须含扩展名，如：20120711001.csv

'/////////////////////请求参数/////////////////////

'构造请求参数数组
sParaTemp = Array("service=bptb_user_confirm","partner="&partner,"_input_charset="&input_charset  ,"notify_url="&notify_url   ,"return_url="&return_url   ,"email="&email   ,"file_name="&file_name  )

'建立请求
Set objSubmit = New AlipaySubmit
sHtml = objSubmit.BuildRequestForm(sParaTemp, "get", "确认")
response.Write sHtml


%>
</body>
</html>
