<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>֧����������������˻�-�ϴ������ļ����ܽӿڽӿ�</title>
</head>
<?php
/* *
 * ���ܣ�������������˻�-�ϴ������ļ����ܽӿڽ���ҳ
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


        //�ϴ������ļ�
        $bptb_pay_file = str_replace("\\","/",dirname(__FILE__))."/".$_POST['WIDbptb_pay_file'];
        //�����Ǿ���·�����ļ����������ظ�

        //�ļ�ժҪ�㷨,MD5��SHA
        $file_digest_type = "MD5";

        //�ļ�ժҪ
        $digest_bptb_pay_file = md5_file($bptb_pay_file);

/************************************************************/

//����Ҫ����Ĳ������飬����Ķ�
$parameter = array(
		"service" => "bptb_pay_file_confirm",
		"partner" => trim($alipay_config['partner']),
		"file_digest_type"	=> $file_digest_type,
		"digest_bptb_pay_file" => $digest_bptb_pay_file,
		"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
);

//��������
$alipaySubmit = new AlipaySubmit($alipay_config);
$html_text = $alipaySubmit->buildRequestHttpInFile($parameter, 'bptb_pay_file', $bptb_pay_file);

//������������̻���ҵ���߼��������

//�������������ҵ���߼�����д�������´�������ο�������

	echo $html_text;
	
//�������������ҵ���߼�����д�������ϴ�������ο�������

?>
</body>
</html>