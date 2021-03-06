<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="ProductSelect.aspx.cs" Inherits="Hidistro.UI.Web.Admin.Oneyuan.ProductSelect" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.ControlPanel.Utility" Assembly="Hidistro.UI.ControlPanel.Utility" %>
<%@ Import Namespace="Hidistro.Core" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="icon" href="../../images/hi.ico" />
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.min.css" />
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" type="text/javascript"></script>
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/admin/js/jquery.nicescroll.min.js"></script>
    <script src="../../Utility/globals.js"></script>
    <link rel="stylesheet" href="../css/common.css?20160818" />
     <style>
        .tableRow{border:1px solid #ccc}
        .tableRow tr td{padding-left:5px!important}
        .table th{text-align:left!important;padding-left:5px!important}
        .selRow{background:#def3e1}
    </style>
    <script>
       
        var IsMultil = <%=IsMultil%>;

        /// 单选时触发
        function gotovalue(jsonData) {
            if (window.parent.divmyIframeModalClose != null) {

                window.parent.$DialogFrame_ReturnValue = "";

                if($(".btn-success").length>0){
                    window.parent.$DialogFrame_ReturnValue=$(".btn-success").attr("jsonData");
                }

                window.parent.divmyIframeModalClose();
            }
        }

        function MultilSel(){
            //获取多选数据
            if(IsMultil==1 && window.parent.$DialogFrame_ReturnValue!=null){
                var tempList=[];
                $(".btn-success").each(function(){
                    if($(this).attr("jsonData")!=null)
                        tempList.push($(this).attr("jsonData"));
                });
                window.parent.$DialogFrame_ReturnValue=tempList;
            }

        }

        $(function () {
            $(".selectBtn").click(function () {

                if ($(this).hasClass("btn-primary")) {
                    $(this).removeClass("btn-primary").addClass("btn-success");
                    $(this).parents("tr").addClass("selRow");
                    if (IsMultil == 0)
                        gotovalue();
                } else {
                    $(this).removeClass("btn-success").addClass("btn-primary");
                    $(this).parents("tr").removeClass("selRow");
                }
                ;
                MultilSel();

            });

        });
       
    </script>
</head>
<body>
    <form id="form1" runat="server">
<div style="width:715px;margin:0px auto 0px auto">

    
                    <div class="set-switch" style="margin-bottom:5px">
                        
                        <div class="form-inline">
                            <div class="form-group mr20">
                                <label for="sellshop4">商品名称：</label>
                                <asp:TextBox ID="txtSearchText" CssClass="form-control  resetSize  inputw150" runat="server" />
                            </div>
                            <div class="form-group">
                                <label for="sellshop6">商品分类：</label>
                               <Hi:ProductCategoriesDropDownList ID="dropCategories" CssClass="form-control resetSize inputw150" runat="server" NullToDisplay="请选择商品分类"
                                    Width="150" />
                                </div>
                             <div class="form-group" style="margin-left :60px; margin-top:2px">
                            <asp:Button ID="btnSearch" runat="server" Text="查询"  CssClass="btn btn-primary  resetSize " /> 
                              </div>
                        </div>
                    </div>
     <div class="title-table" >
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th width="2%"></th>
                                        <th width="30%" colspan="2">商品名称</th>
                                        <th width="20%">价格</th>
                                        <th width="10%">总库存</th>
                                        <th width="15%">总销售量</th>
                                        <th width="10%" style="text-align:center">操作</th>
                                    </tr>
                                </thead>
                                <tbody  class="tableRow">
                                     <asp:Repeater ID="grdProducts" runat="server">
                                          <ItemTemplate>
                                   <tr>
                                       <td>　</td>
                                       <td  width="8%">
                                           <Hi:ListImage ID="ListImage1" runat="server" DataField="ThumbnailUrl60"  Width="40" Height="40"/>
                                       </td>
                                        <td ><div style="height:40px;overflow:hidden;color:#044c56;width:95%">
                                            <%# Eval("ProductName") %></div></td>
                                        <td>
                                            <p style="height:20px;overflow:hidden">原价：<span>￥<%#Eval("MarketPrice", "{0:f2}")%></span></p>
                                            <p style="height:20px;overflow:hidden">现价：<span style="color:#ff0000">￥<%# Eval("SalePrice", "{0:f2}")%></span></p>
                                        </td>
                                        <td ><%# Eval("Stock") %></td>
                                        <td><%# Eval("SaleCounts") %></td>
                                        <td  style="vertical-align:middle">

                                             <a class="btn btn-primary btn-xs selectBtn"
                                                
        jsonData="<%# Eval("productid")+"^"+Eval("ProductName")+"^"+Eval("SalePrice", "{0:f2}")+"^" +Eval("MaxShowPrice", "{0:f2}")+"^" +Eval("ThumbnailUrl60")+"^" +Eval("Stock")+"^" +Eval("SaleCounts")  %>"


                                                 >选择</a>
                                         
                                        </td>
                                     </tr>
                                               </ItemTemplate>
                                  </asp:Repeater>
                                </tbody>
                            </table>
</div>

         <div class="page">
                        <div class="bottomPageNumber clearfix">
                            <div class="pageNumber">
                                <div class="pagination" style="margin-top:0px">
                                    <UI:Pager runat="server" ShowTotalPages="true" DefaultPageSize="6" ID="pager"  />
                                </div>
                            </div>
                        </div>
                    </div>
           
</div>
    </form>
</body>
</html>