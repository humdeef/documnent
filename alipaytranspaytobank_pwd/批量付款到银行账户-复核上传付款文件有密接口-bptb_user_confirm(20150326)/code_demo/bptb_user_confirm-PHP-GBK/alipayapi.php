<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>֧����������������˻�-�����ϴ������ļ����ܽӿڽӿ�</title>
</head>
<?php
/* *
 * ���ܣ�������������˻�-�����ϴ������ļ����ܽӿڽ���ҳ
 * �汾��3.3
 * �޸����ڣ�2012-07-23
 * ˵����
 * ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 * �ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

 *************************ע��*************************
 * ������ڽӿڼ��ɹ������������⣬���԰��������;�������
 * 1���̻��������ģ�https://b.alipay.com/support/helperApply.htm?action=consultationApply�����ύ���뼯��Э�������ǻ���רҵ�ļ�������ʦ������ϵ��Э�����
 * 2���̻��������ģ�http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9��
 * 3��֧������̳��http://club.alipay.com/read-htm-tid-8681712.html��
 * �������ʹ����չ���������չ���ܲ�������ֵ��
 */

require_once("alipay.config.php");
require_once("lib/alipay_submit.class.php");

/**************************�������**************************/

        //�������첽֪ͨҳ��·��
        $notify_url = "http://�̻����ص�ַ/bptb_user_confirm-PHP-GBK/notify_url.php";
        //��http://��ʽ������·�����������?id=123�����Զ������
        //ҳ����תͬ��֪ͨҳ��·��
        $return_url = "http://�̻����ص�ַ/bptb_user_confirm-PHP-GBK/return_url.php";
        //��http://��ʽ������·�����������?id=123�����Զ������
        //������֧�����˻�
        $email = $_POST['WIDemail'];
        //����
        //��Ҫ���˵��ļ���
        $file_name = $_POST['WIDfile_name'];
        //������뺬��չ�����磺20120711001.csv


/************************************************************/

//����Ҫ����Ĳ������飬����Ķ�
$parameter = array(
		"service" => "bptb_user_confirm",
		"partner" => trim($alipay_config['partner']),
		"notify_url"	=> $notify_url,
		"return_url"	=> $return_url,
		"email"	=> $email,
		"file_name"	=> $file_name,
		"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
);

//��������
$alipaySubmit = new AlipaySubmit($alipay_config);
$html_text = $alipaySubmit->buildRequestForm($parameter,"get", "ȷ��");
echo $html_text;

?>
</body>
</html>