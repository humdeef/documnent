using System;
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
/// 功能：批量付款到银行账户-上传付款文件有密接口接入页
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


        //手动上传文件

        //上传付款文件
        HttpPostedFile bptb_pay_file = Filebptb_pay_file.PostedFile;
        int lengthFile = bptb_pay_file.ContentLength;
        string contentType = bptb_pay_file.ContentType;
        byte[] dataFile = Filebptb_pay_file.FileBytes;
        string strFileName = bptb_pay_file.FileName;

        //文件摘要算法
        string file_digest_type = "MD5";

        //文件摘要
        string digest_bptb_pay_file = "";

        if(lengthFile != 0)
        {
            //文件摘要
            digest_bptb_pay_file = Core.GetAbstractToMD5(bptb_pay_file.InputStream);
        }
        else
        {
            //读取指定文件夹下的文件

            //输入要上传文件的完整的绝对路径，例如：E:\Web\SelfFun\withhold_file_vs2005_utf8\file\20120206_000002.csv
            strFileName = @HttpContext.Current.Server.MapPath("") + "\\" + WIDbptb_pay_file.Text.Trim();
            //文件网络传输类型，统一使用".*"类型。如需要使用特定类型，要自己做类型映射，参考http://www.sudu.cn/info/index.php?op=article&id=268724
            contentType = "application/octet-stream";

            FileStream fsFile = new FileStream(strFileName, FileMode.Open, FileAccess.Read);

            //文件byte数组
            //文件长度
            int numBytesToRead = (int)fsFile.Length;
            lengthFile = numBytesToRead;
            //读取文件到byte数组中
            dataFile = new byte[fsFile.Length];
            int numBytesRead = 0;
            while (numBytesToRead > 0)
            {
                int n = fsFile.Read(dataFile, numBytesRead, numBytesToRead);
                if (n == 0)
                    break;
                numBytesRead += n;
                numBytesToRead -= n;
            }
            fsFile.Close();

            //文件摘要
            digest_bptb_pay_file = Core.GetAbstractToMD5(dataFile);
        }

        ////////////////////////////////////////////////////////////////////////////////////////////////

        //把请求参数打包成数组
        SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
        sParaTemp.Add("partner", Config.Partner);
        sParaTemp.Add("_input_charset", Config.Input_charset.ToLower());
        sParaTemp.Add("service", "bptb_pay_file_confirm");
        sParaTemp.Add("file_digest_type", file_digest_type);
        sParaTemp.Add("digest_bptb_pay_file", digest_bptb_pay_file);

        //建立请求
        string sHtmlText = Submit.BuildRequest(sParaTemp,"post", strFileName, dataFile, contentType, lengthFile);

        //请在这里加上商户的业务逻辑程序代码

        //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——

        Response.Write(sHtmlText);

        //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

        
    }
}
