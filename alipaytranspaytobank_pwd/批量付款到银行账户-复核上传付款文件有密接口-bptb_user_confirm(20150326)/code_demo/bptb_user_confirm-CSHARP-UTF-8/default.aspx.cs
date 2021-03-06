﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Xml;
using Com.Alipay;

/// <summary>
/// 功能：批量付款到银行账户-复核上传付款文件有密接口接入页
/// 版本：3.3
/// 日期：2012-07-05
/// 说明：
/// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
/// 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
/// 
/// /////////////////注意///////////////////////////////////////////////////////////////
/// 如果您在接口集成过程中遇到问题，可以按照下面的途径来解决
/// 1、商户服务中心（https://b.alipay.com/support/helperApply.htm?action=consultationApply），提交申请集成协助，我们会有专业的技术工程师主动联系您协助解决
/// 2、商户帮助中心（http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9）
/// 3、支付宝论坛（http://club.alipay.com/read-htm-tid-8681712.html）
/// 
/// 如果不想使用扩展功能请把扩展功能参数赋空值。
/// </summary>
public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void BtnAlipay_Click(object sender, EventArgs e)
    {
        ////////////////////////////////////////////请求参数////////////////////////////////////////////

        //服务器异步通知页面路径
        string notify_url = "http://商户网关地址/bptb_user_confirm-CSHARP-UTF-8/notify_url.aspx";
        //需http://格式的完整路径，不允许加?id=123这类自定义参数
        //页面跳转同步通知页面路径
        string return_url = "http://商户网关地址/bptb_user_confirm-CSHARP-UTF-8/return_url.aspx";
        //需http://格式的完整路径，不允许加?id=123这类自定义参数
        //付款人支付宝账户
        string email = WIDemail.Text.Trim();
        //必填
        //需要复核的文件名
        string file_name = WIDfile_name.Text.Trim();
        //必填，必须含扩展名，如：20120711001.csv


        ////////////////////////////////////////////////////////////////////////////////////////////////

        //把请求参数打包成数组
        SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
        sParaTemp.Add("partner", Config.Partner);
        sParaTemp.Add("_input_charset", Config.Input_charset.ToLower());
        sParaTemp.Add("service", "bptb_user_confirm");
        sParaTemp.Add("notify_url", notify_url);
        sParaTemp.Add("return_url", return_url);
        sParaTemp.Add("email", email);
        sParaTemp.Add("file_name", file_name);

        //建立请求
        string sHtmlText = Submit.BuildRequest(sParaTemp, "get", "确认");
        Response.Write(sHtmlText);
        
    }
}
