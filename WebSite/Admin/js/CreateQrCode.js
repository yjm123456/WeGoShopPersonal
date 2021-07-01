function CreateQrcode(url, Name) {
    // window.location.href("QrCodeCreate.aspx?Url=" + url + "&Name=" + Name);
    $.ajax({
        type: "GET",
        url: "/admin/shop/QrCodeCreate.aspx?Url=" + url + "&Name=" + Name,
        success: function (data) {
            return data;
        },
        error: function (jqXHR) {
            //console.log(jqXHR);
            return "Fail";
        }
    });
}