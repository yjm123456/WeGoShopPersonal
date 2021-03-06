<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminNew.Master"
    AutoEventWireup="true" CodeBehind="ProductSaleRanking.aspx.cs"
    Inherits="Hidistro.UI.Web.Admin.Sales.ProductSaleRanking" %>

<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.Common.Controls" Assembly="Hidistro.UI.Common.Controls" %>
<%@ Register TagPrefix="Hi" Namespace="Hidistro.UI.ControlPanel.Utility" Assembly="Hidistro.UI.ControlPanel.Utility" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<%@ Register Src="~/Admin/Ascx/ucDateTimePicker.ascx" TagPrefix="uc1" TagName="ucDateTimePicker" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../css/common.css?20160818" />
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
        $(document).ready(function () {
            //导出
            var status = 1;
            $("#clickTopDown").click(function () {
                $("#dataArea").toggle(500, changeClass)
            })

            changeClass = function () {
                if (status == 1) {
                    status = 0;
                }
                else {
                    status = 1;
                }
            }
        })

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page-header">
            <h2>商品销售排行榜</h2>
        </div>
        <div class="set-switch">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-xs-1 pad resetSize control-label" for="setdate">操作时间：</label>
                    <div class="form-inline journal-query">
                        <div class="form-group">
                            <%--<input type="text" id="setdate" placeholder="创建日期">--%>
                            <uc1:ucDateTimePicker ID="txtBeginDate" runat="server" CssClass="form-control resetSize" />
                            &nbsp;&nbsp;至&nbsp;
                                    <%--<input type="text" class="form-control resetSize" placeholder="创建日期">--%>
                            <uc1:ucDateTimePicker ID="txtEndDate" runat="server" CssClass="form-control resetSize" />
                        </div>

                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="btn resetSize btn-primary" />
                        <div class="form-group">
                            <label for="exampleInputName2">查询日期</label>
                            <%--                                    <a href="javascript:void(0)" class="btn resetSize btn-default">最近7天</a>
                                    <a href="javascript:void(0)" class="btn resetSize btn-default">最近1个月</a>--%>
                            <asp:Button ID="btnWeekView" runat="server" class="btn resetSize btn-default" Text="最近7天"
                                OnClick="btnWeekView_Click" />
                            <asp:Button ID="btnMonthView" runat="server" class="btn resetSize btn-default" Text="最近1个月"
                                OnClick="btnMonthView_Click" />

                        </div>
                     <%--   <p class="form-group reportForm"><span class="glyphicon glyphicon-th"></span></p>--%>
                        <%-- <a href="javascript:void(0)">下载报表</a>--%>
                    </div>
                </div>
            </div>
        </div>


        <div>
            <!--导出数据-->
            <div class="form-inline clearfix" id="clickTopDown">
                <span style="display:inline-block; float:left; width:25px;height:25px; background:url(../images/top.gif) no-repeat center;"></span>
                <strong class="fonts fl" style="line-height:30px;">导出数据</strong>
            </div>
            <table id="dataArea" class="form-group" style="display: none; width: 100%; line-height: 25px;">
                <tr class="form-group">
                    <td style="text-align: right; width: 200px;">
                        <label style="width: 200px;">请选择需要导出的信息：</label>
                    </td>
                    <td style="text-align: left;">
                        <Hi:ExportFieldsCheckBoxList ID="exportFieldsCheckBoxList" runat="server"  Width="400px"></Hi:ExportFieldsCheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td class="form-group" style="text-align: right;">
                        <label style="width: 200px;">请选择导出格式：</label>
                    </td>
                    <td style="text-align: left;">
                        <Hi:ExportFormatRadioButtonList ID="exportFormatRadioButtonList" runat="server"  Width="200px" />
                        <asp:Button ID="btnExport" runat="server" CssClass="btn btn-success bigsize" Style="float: right;"
                            Text="导出" />
                    </td>
                </tr>
            </table>


        </div>

        <div class="topListTable">
            <table class="table">
                <thead>
                    <tr>
                        <th width="5%">排名</th>
                        <th width="5%" style="text-align: left"></th>
                        <th width="30%" style="text-align: left">商品名称</th>
                        <th width="8%">销售量</th>
                        <th width="13%">销售额</th>
                        <th width="13%">访问次数</th>
                        <th width="13%">购买人数</th>
                        <th width="13%">转化率</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%--  <img src="../images/0001.gif" runat="server" id="rank1" visible='<%# Eval("RowNumber").ToString()=="1"%>' >
                                            <img src="../images/0002.gif" runat="server" id="rank2" visible='<%# Eval("RowNumber").ToString()=="2"%>' >
                                            <img src="../images/0003.gif" runat="server" id="rank3" visible='<%# Eval("RowNumber").ToString()=="3"%>' >--%>
                                    <asp:Literal runat="server" ID="lbRank" Text='<%# Eval("RankIndex")%>' Visible='<%#  1==1 ||  Convert.ToInt32( Eval("RowNumber").ToString()) >3 %>' />
                                </td>
                                <td style="text-align: left">
                                    <div class="img fl mr10">
                                        <%--<img src="http://fpoimg.com/60x60">--%>
                                        <Hi:ListImage ID="ListImage1" runat="server" DataField="ThumbnailUrl60" Width="60"
                                            Height="60" />
                                    </div>


                                </td>
                                <td style="text-align: left"><%# Eval("ProductName")  %>
                                </td>
                                <td><em><%# Eval("SaleQty") %></em></td>
                                <td><em>￥<%#Decimal.Parse( Eval("SaleAmountFee").ToString()).ToString("N2") %></em></td>
                                <td><em><%# Eval("TotalVisits") %></em></td>
                                <td><em><%# Eval("BuyerNumber") %></em></td>
                                <td><em><%#Decimal.Parse( Eval("ConversionRate").ToString()).ToString("N2") %>%</em>
                                </td>

                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>


                </tbody>
            </table>
        </div>


        <br />

        <div class="select-page clearfix">
            <div class="form-horizontal fl">
                &nbsp; 
            </div>
            <div class="page fr">
                <div class="pageNumber">
                    <div class="pagination" style="margin: 0px">
                        <UI:Pager runat="server" ShowTotalPages="true" ID="pager" />
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix" style="height: 30px"></div>
        <hr />



    </form>
</asp:Content>
