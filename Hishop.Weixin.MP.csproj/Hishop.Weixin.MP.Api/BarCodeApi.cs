namespace Hishop.Weixin.MP.Api
{
    using Hishop.Weixin.MP.Util;
    using Newtonsoft.Json;
    using System;
    using System.Runtime.InteropServices;
    using System.Text;
    using System.Web;

    public class BarCodeApi
    {
        public static string CreateTicket(string TOKEN, string scene_id = "12399", string QRType = "QR_LIMIT_SCENE", string exSecond = "2592000")
        {
            string str2 = "{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_id\":" + scene_id + "}}}";
            if (QRType == "QR_SCENE")
            {
                str2 = "{\"expire_seconds\":" + exSecond + ", \"action_name\": \"QR_SCENE\", \"action_info\": {\"scene\": {\"scene_id\":" + scene_id + "}}}";
            }
            string url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" + TOKEN;
            string str4 = new WebUtils().DoPost(url, str2);
            var type = new {
                ticket = "",
                url = ""
            };
            string str5 = JsonConvert.SerializeObject(type);
            return JsonConvert.DeserializeAnonymousType(str4, type).ticket;
        }

        public static string CreateTicketWifi(string token, string wifiInfo)
        {
            string str2 = "{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_id\":" + wifiInfo + "}}}";
            string url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" + token;
            string str4 = new WebUtils().DoPost(url, str2);
            var type = new {
                ticket = "",
                url = ""
            };
            string str5 = JsonConvert.SerializeObject(type);
            return JsonConvert.DeserializeAnonymousType(str4, type).ticket;
        }

        public static bool GetHeadImageUrlByOpenID(string TOKEN, string OpenID, out string RetInfo, out string NickName, out string HeadImageUrl)
        {
            NickName = "";
            HeadImageUrl = "";
            RetInfo = "";
            if (string.IsNullOrEmpty(OpenID))
            {
                RetInfo = "{\"errcode\":40013,\"errmsg\":\"openId??????\"}";
                return false;
            }
            string url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=" + TOKEN + "&openid=" + OpenID + "&lang=zh_CN";
            string str3 = new WebUtils().DoGet(url, null);
            if (str3.Contains("errcode"))
            {
                return false;
            }
            var type = new {
                subscribe = "",
                nickname = "",
                headimgurl = ""
            };
            string str4 = JsonConvert.SerializeObject(type);
            type = JsonConvert.DeserializeAnonymousType(str3, type);
            NickName = type.nickname;
            HeadImageUrl = type.headimgurl;
            if (type.subscribe.Trim() != "1")
            {
                RetInfo = "?????????????????????????????????????????????????????????";
            }
            return (type.subscribe.Trim() == "1");
        }

        public static string GetQRImageUrlByTicket(string TICKET)
        {
            return ("https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + HttpUtility.UrlEncode(TICKET, Encoding.UTF8));
        }

        public static string GetUserInfosByOpenID(string TOKEN, string OpenID)
        {
            if (string.IsNullOrEmpty(OpenID))
            {
                return "OpenID?????????";
            }
            string url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=" + TOKEN + "&openid=" + OpenID + "&lang=zh_CN";
            return new WebUtils().DoGet(url, null);
        }
    }
}
