﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ServicesRequestsAllUserControl.ascx.cs" Inherits="ServicesDeptTabs.ServicesRequestsAll.ServicesRequestsAllUserControl" %>


<div id="container" dir="rtl" style="border: none !important; text-align: right">

    <div id="page_head">
        <h1 runat="server" id="PageTitle">طلبات إدارة الخدمات </h1>
    </div>
    <div class="divAddGoal" runat="server" id="div_of_AddingGoal">
        <div class="Form_Table_css">
                    <table>
                        <tr>
                            <td style="width: 36% !important;">مجموعة الصنف</td>
                            <td>
                                <select id="ddlCat" style="width:200px" onchange="GetItemsOfSelectedCat()" >
                                    <option  value="اختر مجموعة الصنف">اختر مجموعة الصنف</option>
                                </select>
                            </td>
                            <td colspan="3">
                                
                            </td>
                        </tr>
                        <tr>
                            <td>الصنف المطلوب</td>
                            <td>
                                <%--<asp:DropDownList ID="ddlPrimaryGoal" runat="server" Width="300px" AppendDataBoundItems="True" ValidationGroup="vg1">
                                    <asp:ListItem Selected="True" Value="0">اختر الصنف المطلوب</asp:ListItem>
                                </asp:DropDownList>--%>
                                 <select id="ddlItem" style="width:350px" >
                                    <option  value="اختر الصنف المطلوب">اختر الصنف المطلوب</option>
                                </select>
                                <%--<asp:RequiredFieldValidator ID="rfv_ddlPrimaryGoal" runat="server" Display="Dynamic" ErrorMessage="الرجاء اختيار الصنف المطلوب" ControlToValidate="ddlPrimaryGoal" ForeColor="Red" ValidationGroup="vg1"
            InitialValue="0">*</asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                    </table>

             
            <table class="Form_Table_css">

                <tr>
                    <td>الكمية</td>
                    <td>
                        <div id="txtQuantity"></div>
                        <%--<asp:TextBox ID="txtQuantity" runat="server" MaxLength="3" Width="50px" ValidationGroup="vg1" Text="1"></asp:TextBox>--%>
                        <%--<asp:RequiredFieldValidator ID="rfv_txtQuantity" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="الرجاء ادخال الكمية المطلوبة" ForeColor="Red" ValidationGroup="vg1">*</asp:RequiredFieldValidator>--%>
                        <%--<asp:RangeValidator ID="rgv_txtQuantity" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="لابد ان تكون القيمة المدخلة رقما صحيحا من 1 إلى 999" ForeColor="Red" ValidationGroup="vg1" MaximumValue="999" MinimumValue="1" Type="Integer">*</asp:RangeValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>ملاحظات</td>
                    <td>
                        <input id="txtNotes" type="text" style="width:500px;" maxlength="255" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input id="btnAddStationeryItemToGrid" type="Button" value="إضافة" />
                        <%--<asp:Button ID="btnAddItem" runat="server" Text="إضافة" OnClick="btnAddItem_Click" ValidationGroup="vg1" Font-Size="Large" Height="50px" Width="100px" Style="margin-top: 20px;" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="vg1" />--%>
                    </td>
                </tr>
            </table>

        </div>
    </div>
    <div id="jqxgrid">
    </div>
    <input id="deleterowbutton" type="button" value="حذف صنف" />

    <div style="width:50%; text-align:center">
          <input id="btnSaveAllRowsToServer" type="button" value="إرسال"  style="font-size:x-large;"/>
    </div>
</div>

<!-- ===========================Ref=============================================================================== -->
<style>
    .GridCellStyle{
        direction:rtl;
    }
</style>

<link rel="stylesheet" href="/Style%20Library/jQueryUI/base/jquery-ui.css">
<script type="text/javascript" src="/Style%20Library/jQueryUI/base/jquery-ui.js"></script>
<link rel="stylesheet" href="/_layouts/15/ServicesDeptTabs/jqwidgets/styles/jqx.base.css" type="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqscripts/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxmenu.js"></script>

<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxgrid.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxgrid.edit.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxgrid.selection.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxgrid.columnsresize.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxgrid.filter.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxgrid.sort.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxgrid.pager.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxgrid.grouping.js"></script>

<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxlistbox.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxdropdownlist.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxcheckbox.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxcalendar.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxnumberinput.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/jqxdatetimeinput.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/globalization/globalize.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/jqwidgets/generatedata.js"></script>

<script src="/_layouts/MicrosoftAjax.js" type="text/javascript"></script>
<script src="/_layouts/sp.core.js" type="text/javascript"></script>
<script src="/_layouts/sp.runtime.js" type="text/javascript"></script>
<script src="/_layouts/sp.js" type="text/javascript"></script>

<script src="/_layouts/15/ServicesDeptTabs/sweetalert2.all.min.js"></script>

<!-- ===========================MyJS=============================================================================== -->
<script src="/_layouts/15/ServicesDeptTabs/MyJS/sendEmail.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/MyJS/ReadCategories.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/MyJS/PageLoad.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/MyJS/AddStationeryItemToGrid.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/MyJS/SaveAllRowsToServer.js"></script>
<script type="text/javascript" src="/_layouts/15/ServicesDeptTabs/MyJS/DeleteGridRow.js"></script>

<!-- ===========================End of MyJS=============================================================================== -->

<script src="/_layouts/15/ServicesDeptTabs/polyfill.min.js"></script>



