<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EP_TRA.aspx.cs"  Inherits="Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

  


<script runat="server" herf="EP_TRA.aspx.cs" >

    List<string> temp = new List<string>();

    string sql1 = "select Im_Value from npiimportdata where SType='DIF' AND Im_Pos='D4' ";
    string sql2 = "select Im_Value from npiimportdata where SType='DIF' AND Im_Pos='D5' ";
    string sql3 = "select Im_Value from npiimportdata where SType='DIF' AND Im_Pos='D19' ";
    string sql4 = "select Im_Value from npiimportdata where SType='DIF' AND Im_Pos='G19' ";
    string sql5 = "select Im_Value from npiimportdata where SType='Q_R' AND Im_Pos='D16' ";
    string sql6 = "select Im_Value from npiimportdata where SType='Q_R' AND Im_Pos='D13' ";
    string sql7 = "select Im_Value from npiimportdata where SType='Q_R' AND Im_Pos='D7' ";
    string sql8 = "select Im_Value from npiimportdata where SType='Q_R' AND Im_Pos='D8' ";
    string sql9 = "select Im_Value from npiimportdata where SType='Q_R' AND Im_Pos='D9' ";
    string sql10 = "select Im_Value from npiimportdata where SType='DIF' AND Im_Pos='F11' ";
    string sql11 = "select Im_Value from npiimportdata where SType='Q_R' AND Im_Pos='D11' ";
    string sql12 = "select Im_Value from npiimportdata where SType='Q_R' AND Im_Pos='D12' ";
    string sql13 = "select Im_Value from npiimportdata where SType='Q_R' AND Im_Pos='D26' ";
    string sql14 = "select Im_Value from npiimportdata where SType='DRC' AND Im_Pos='F38' ";
    string sql15 = "select Im_Value from npiimportdata where SType='DRC' AND Im_Pos='F39' ";
    string sql16 = "select Im_Value from npiimportdata where SType='DRC' AND Im_Pos='F35' ";
    string sql17 = "select Im_Value from npiimportdata where SType='DRC' AND Im_Pos='F34' ";
    string sql18 = "select Im_Value from npiimportdata where SType='DIF' AND Im_Pos='D29' ";
    string sql19 = "select Im_Value from npiimportdata where SType='Q_R' AND Im_Pos='E26' ";
    string sql20 = "select Im_Value from npiimportdata where SType='Q_R' AND Im_Pos='D30' ";
    string sql21 = "select Im_Value from npiimportdata where SType='DIF' AND Im_Pos='D30' ";

   




    protected void Search_Device_Butt1_Click(object sender, EventArgs e)
    {

        string SQL_Customer = "SELECT DISTINCT npiimportdata.New_Customer FROM npiimportdata";
        string SQL_NewDevice = "SELECT DISTINCT npiimportdata.New_Device FROM npiimportdata";

        if(Customer_TB.Text.Trim() != "" && ND_TB.Text.Trim() != "")
        {
            if(check_Customer_data(SQL_Customer,Conninf) && check_NewDevice_data(SQL_NewDevice,Conninf) )
            {
                receive_npiappmanualdata();
            }
            else
            {
                if( (!check_NewDevice_data(SQL_NewDevice,Conninf)) && (!check_Customer_data(SQL_Customer,Conninf)))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('DIF/Q&R/DRC/Application/Mamual File中的New_Customer 與 New_Device欄位無此資料，請重新填寫!')",true);
                }
                if(!check_Customer_data(SQL_Customer,Conninf))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('DIF/Q&R/DRC/Application/Mamual File中的New_Customer欄位無此資料，請重新填寫!')", true);
                }
                if(!check_NewDevice_data(SQL_NewDevice,Conninf))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('DIF/Q&R/DRC/Application/Mamual File中的New_Device欄位無此資料，請重新填寫!')", true);
                }

            }

        }
        else {
            if(Customer_TB.Text.Trim() == "" && ND_TB.Text.Trim() == "")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('New_Customer與New_Device條件必須填寫')", true);
            if (Customer_TB.Text.Trim() == "")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('New_Customer條件必須填寫')", true);
            if(ND_TB.Text.Trim() == "")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('New_Device條件必須填寫')", true);

        }

    }




</script>



  
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>EP_TRA</title>
<link rel="stylesheet" href="..\css\styles.css" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://jqueryui.com/resources/demos/external/jquery.bgiframe-2.1.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript">
    function AddWork()
    {
        $(function () {
            $("#dialog").dialog({
                autoOpen: false,
                width: 1300,
                height: 1300,
                title: "Select POR_Golden",
            });
            $("#dialogFrame").attr('src', 'POR_Golden.aspx');
            $("#dialog").dialog("open");
            return false;
        });
    }   
    
</script> 
    <style type="text/css">
        .auto-style79 {
            height: 17pt;
            color: windowtext;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border: .5pt solid white;
            padding: 0px;
            background: #E5E0EC;
        }
        .auto-style80 {
            color: windowtext;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap;
            border-left: .5pt solid white;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top: .5pt solid white;
            border-bottom: .5pt solid white;
            padding: 0px;
            background: #E5E0EC;
            height: 17pt;
        }
        .auto-style81 {
            color: windowtext;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border: .5pt solid white;
            padding: 0px;
            background: #D8D8D8;
            height: 17pt;
        }
        .auto-style82 {
            color: blue;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border: .5pt solid white;
            padding: 0px;
            background: #D8D8D8;
            height: 17pt;
        }
        .auto-style83 {
            height: 17pt;
            color: windowtext;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border: .5pt solid white;
            padding: 0px;
            background: #CCCCFF;
        }
        .auto-style84 {
            color: windowtext;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap;
            border-left: .5pt solid white;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top: .5pt solid white;
            border-bottom: .5pt solid white;
            padding: 0px;
            background: #CCCCFF;
            height: 17pt;
        }
    .shape {behavior:url(#default#VML);}
        .auto-style112 {
            margin-top: 14px;
        }
        .auto-style117 {
            font-family: 微軟正黑體;
            font-size: large;
            vertical-align: medium;
            color: yellow;
            font-weight: bold;
            text-transform: capitalize;
        }
        .auto-style121 {
            padding: 0;
            width: 162pt;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border-right-color: inherit;
            border-left-color: #E46D0A;
            border-top-color: #E46D0A;
            border-bottom-color: #E46D0A;
        }
        .auto-style122 {
            width: 112pt;
            color: white;
            font-size: large;
            font-weight: bold;
            font-style: normal;
            text-decoration: none;
            font-family: 微軟正黑體;
            text-align: center;
            vertical-align: medium;
            white-space: nowrap;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
             background: #538ED5;
            text-transform: capitalize;
            border-right-color: #E46D0A;
            border-right-width: 1.5pt;
        }
        .auto-style123 {
            border-color: #E46D0A;
            padding: 0;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap;
            height: 32pt;
        }
        .auto-style125 {
            border-style: none;
            width: 270pt;
            padding: 1px 4px;
        }
        .auto-style126 {
            height: 29pt;
            width: 119pt;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border-right-color: inherit;
            background: #538ED5;
            border-left-color: #E46D0A;
            border-top-color: #E46D0A;
            border-bottom-color: #E46D0A;
        }
        .auto-style129 {
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border-right-color: inherit;
            border-left-color: #E46D0A;
            border-top-color: #E46D0A;
            border-bottom-color: #E46D0A;
        }
        .auto-style130 {
            width: 108pt;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border-right-color: inherit;
            height: 29pt;
            border-left-color: #E46D0A;
            border-top-color: #E46D0A;
            border-bottom-color: #E46D0A;
        }
        .auto-style131 {
            height: 29.25pt;
            color: windowtext;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border-right-color: inherit;
            background: #538ED5;
            width: 119pt;
            border-left-color: #E46D0A;
            border-top-color: #E46D0A;
            border-bottom-color: #E46D0A;
        }
        .auto-style132 {
            width: 378pt;
            border-right-style: solid;
            border-right-width: 0;
        }
        .auto-style145 {
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 0px;
        }
        .auto-style150 {
            height: 82.5pt;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 0px;
        }
        .auto-style151 {
            width: 100%;
            height: 9px;
            margin-bottom: 0px;
        }
        .auto-style152 {
            width: 1057px;
        }
        .auto-style153 {
            width: 272px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            color: #FF0000;
        }
        .auto-style154 {
            width: 749pt;
        }
        .auto-style164 {
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border-left: .5pt solid #F2F2F2;
            border-right: .5pt solid #F2F2F2;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
            border-bottom: .5pt solid #F2F2F2;
            padding: 0px;
            background: #EAF1DD;
        }
        .auto-style166 {
            height: 33pt;
            width: 76pt;
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border-left: 1.0pt solid windowtext;
            border-right: .5pt solid white;
            border-top: 1.0pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #254061;
        }
        .auto-style168 {
            width: 93pt;
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border-left: .5pt solid white;
            border-right: .5pt solid white;
            border-top: 1.0pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #254061;
            height: 33pt;
        }
        .auto-style169 {
            width: 76pt;
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border-left: .5pt solid white;
            border-right: 1.0pt solid windowtext;
            border-top: 1.0pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #254061;
            height: 33pt;
        }
        .auto-style171 {
            width: 162pt;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border-right-color: inherit;
            height: 29pt;
            border-left-color: #E46D0A;
            border-top-color: #E46D0A;
            border-bottom-color: #E46D0A;
        }
        .auto-style172 {
            font-family: 微軟正黑體;
            font-size: large;
            vertical-align: medium;
            color: white;
            font-weight: bold;
            text-transform: capitalize;
        }
        .auto-style173 {
            width: 768pt;
        }
        .auto-style174 {
            width: 76pt;
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border-left: .5pt solid white;
            border-right: .5pt solid white;
            border-top: 1.0pt solid windowtext;
            border-bottom: 1.0pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #254061;
            height: 33pt;
        }
        </style>
</head>
<link href="EP_TRA.css" rel="stylesheet" type="text/css" />
<body style="width: 100%; height:100%">
  
   
    
    <form id="form1" runat="server">
       
            
        

        <asp:Panel ID="POR_Panel" runat="server" Width="1494px">
        
        <fieldset class="auto-style152">
            <legend style="font-size: large;" class="auto-style153"><strong>POR Golden &amp; New Device</strong></legend>
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;" class="auto-style154">
                <tr height="22">
                    <td class="auto-style150" height="110">
                        <table cellpadding="0" cellspacing="0" class="auto-style125" style="border-collapse: collapse;" width="360">
                            <colgroup>
                                <col span="1" />
                                <col span="1" width="72" />
                            </colgroup>
                            <tr height="39">
                                <td class="auto-style122" height="39" rowspan="2">Device:</td>
                                <td class="auto-style121" width="216">
                                    <asp:Button ID="POR_Butt4" runat="server" CausesValidation="False" ClientIDMode="Predictable" CommandName="Insert" CssClass="auto-style1" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" ForeColor="Black" Height="29px" OnClick="POR_Butt_Click1" Text="選擇 POR Golden" Width="211px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style123">
                                    <asp:TextBox ID="TextBox2" runat="server" Height="27px" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style145">
                        <table cellpadding="0" cellspacing="0" class="auto-style132" style="border-collapse:collapse;" width="504">
                            <colgroup>
                                <col span="4" width="72" />
                            </colgroup>
                            <tr>
                                <td class="auto-style126"><span class="auto-style172">Customer</span><span class="auto-style117">:</span></td>
                                <td class="auto-style171" width="216">
                                    <asp:TextBox ID="Customer_TB" runat="server" Height="27px" OnTextChanged="Customer_TB_TextChanged" Width="200px"></asp:TextBox>
                                </td>
                                <td class="auto-style130" width="144">
                                    <asp:Button ID="Search_Device_Butt1" runat="server" CssClass="auto-style1" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" ForeColor="Black" Height="29px" OnClick="Search_Device_Butt1_Click" Text="查詢NewDevice" Width="139px" />
                                </td>
                            </tr>
                            <tr height="39">
                                <td class="auto-style131" height="39"><span class="auto-style117">&nbsp;</span><span class="auto-style172"> New_Device: </span></td>
                                <td class="auto-style129">
                                    <asp:TextBox ID="ND_TB" runat="server" Height="27px" Width="200px"></asp:TextBox>
                                </td>
                                <td class="auto-style129">
                                    <asp:Button ID="GAP_Butt" runat="server" CssClass="auto-style1" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" ForeColor="Black" Height="29px" Text="GAP比對" Width="139px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;" class="auto-style173">
                <colgroup>
                    <col span="5" width="101" />
                    <col width="124" />
                    <col span="2" width="101" />
                </colgroup>
                <tr>
                    <td class="auto-style166" width="101">Device</td>
                    <td class="auto-style174" width="101">*Production Site</td>
                    <td class="auto-style174" width="101">*PKG<span style="mso-spacerun:yes">&nbsp;</span></td>
                    <td class="auto-style174" width="101">*Wafer Tech.(nm)</td>
                    <td class="auto-style174" width="101">*FAB</td>
                    <td class="auto-style168" width="124">*Wafer PSV type / Thickness</td>
                    <td class="auto-style174" width="101">*RVSI(Y/N)</td>
                    <td class="auto-style169" width="101">*Customer</td>
                </tr>
                <tr height="22">
                    <td class="auto-style164" height="44" id="td1">　<asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style164" id="td2">　<asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style164" id="td3">　<asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style164" id="td4">　<asp:Label ID="Label4" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style164" id="td5">　<asp:Label ID="Label5" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style164" id="td6">　<asp:Label ID="Label6" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style164" id="td7">
                        <asp:Label ID="Label7" runat="server"></asp:Label>
                        　</td>
                    <td class="auto-style164" id="td8">　<asp:Label ID="Label8" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Button ID="cmdFilter" runat="server" OnClick="cmdFilter_Click" Text="Button" ClientIDMode="Static" Style="display: none;" /> 
            <br />
            <br />
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label>
        <hr size="5px" align="left" color="#FFFFFF" class="auto-style151"  >
     </fieldset>
             
     <br />
        </asp:Panel>
        <br />
      
      
         
            
            
       <asp:Repeater ID="EPTRA_Repeater" runat="server" >
  <HeaderTemplate>
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:1033pt" width="1376">
        <colgroup>
            <col style="mso-width-source:userset;mso-width-alt:1632;width:38pt" width="51" />
            <col style="mso-width-source:userset;mso-width-alt:1024;width:24pt" width="32" />
            <col style="mso-width-source:userset;mso-width-alt:4128;width:97pt" width="129" />
            <col style="mso-width-source:userset;mso-width-alt:6144;width:144pt" width="192" />
            <col style="mso-width-source:userset;mso-width-alt:5120;width:120pt" width="160" />
            <col style="mso-width-source:userset;mso-width-alt:3648;width:86pt" width="114" />
            <col style="mso-width-source:userset;mso-width-alt:5536;width:130pt" width="173" />
            <col span="4" style="width:54pt" width="72" />
            <col style="mso-width-source:userset;mso-width-alt:2976;width:70pt" width="93" />
            <col span="2" style="width:54pt" width="72" />
        </colgroup>
        
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            
            <td class="auto-style2" colspan="4" height="62" rowspan="2" width="404">Key item</td>
            <td class="auto-style3" rowspan="2" width="160">Capability<span style="mso-spacerun:yes">&nbsp;</span></td>
            <td class="auto-style4" rowspan="2" width="114">POR (Baseline)</td>
            <td class="auto-style5" rowspan="2" width="173">New Device</td>
            <td class="auto-style6" rowspan="2" width="72">Gap<br />
                (Y/N)</td>
            <td class="auto-style7" colspan="6" width="453">Package/ProcessTRA</td>
        </tr>
            
       
         
            
        
        <tr height="40" style="height:30.0pt">
            <td class="auto-style8" height="40" width="72">Effect stage</td>
            <td class="auto-style6" width="72">Potential Effect</td>
            <td class="auto-style6" width="72">TRA Lv.</td>
            <td class="auto-style9" width="93">Recommend action</td>
            <td class="auto-style10">Owner</td>
            <td class="auto-style6" width="72">Due Date</td>
        </tr>
    </HeaderTemplate>
        <ItemTemplate>
        <tr>
            <td class="auto-style75" colspan="4">PROD</td>
            <td class="auto-style76" width="160">-</td>
            <td class="auto-style77"></td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
        </tr>
             
            
        <tr>
            <td class="auto-style15" height="126" rowspan="5" width="51">Device Information</td>
            <td class="auto-style79">1</td>
            <td class="auto-style80" colspan="2">Customer<span style="mso-spacerun:yes">&nbsp;</span></td>
            <td class="auto-style81">-</td>
            <td class="auto-style78">iiiiii</td>
            <td class="auto-style82"><% =receive_npiimportdata(sql1,Conninf,0) %></td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
        </tr>
        <tr>
            <td class="auto-style79">2</td>
            <td class="auto-style80" colspan="2">Device<span style="mso-spacerun:yes">&nbsp;</span></td>
            <td class="auto-style81">-</td>
            <td class="auto-style78">　</td>
            <td class="auto-style82"><% =receive_npiimportdata(sql2,Conninf,1) %></td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style20" height="22">3</td>
            <td class="auto-style17" colspan="2">Die size(mm*mm)</td>
            <td class="auto-style12" width="160">4*4~23*23</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql3,Conninf,2) %> x <% =receive_npiimportdata(sql4,Conninf,3) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="38" style="height:28.5pt">
            <td class="auto-style21" height="38">4</td>
            <td class="auto-style17" colspan="2">C/P probe card type</td>
            <td class="auto-style12" width="160">Vertical probe<br />
                Membrane</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql5,Conninf,4) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style20" height="22">5</td>
            <td class="auto-style17" colspan="2">Probing on bump pad (Y/N)</td>
            <td class="auto-style18">Not Allowed</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql6,Conninf,5) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style22" height="170" rowspan="7">Wafer Information</td>
            <td class="auto-style23">6</td>
            <td class="auto-style24" colspan="2">Wafer Fab</td>
            <td class="auto-style18">TSMC,UMC,GF,SMIC</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql7,Conninf,6) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr>
            <td class="auto-style83">7</td>
            <td class="auto-style84" colspan="2">Wafer tech.(nm)</td>
            <td class="auto-style81">28~130</td>
            <td class="auto-style78">　</td>
            <td class="auto-style82"><% =receive_npiimportdata(sql8,Conninf,7) %></td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
            <td class="auto-style78">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style25" height="22">8</td>
            <td class="auto-style24" colspan="2">Low K Type</td>
            <td class="auto-style18">ELK</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql9,Conninf,8) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="38" style="height:28.5pt">
            <td class="auto-style26" height="38">9</td>
            <td class="auto-style24" colspan="2">Final Metal Pad type</td>
            <td class="auto-style12" width="160">Al<br />
                Cu</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql10,Conninf,9) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style25" height="22">10</td>
            <td class="auto-style24" colspan="2">RV hole(Y/N)</td>
            <td class="auto-style18">Not Allowed</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql11,Conninf,10) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style25" height="22">11</td>
            <td class="auto-style24" colspan="2">Wafer PSV type / Thickness</td>
            <td class="auto-style18">SiN</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_01")%></td>
            <td class="auto-style14"> </td>     
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style25" height="22">12</td>
            <td class="auto-style24" colspan="2">Seal-Ring Protected by SiN (Y/N)</td>
            <td class="auto-style12" width="160">Y</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql12,Conninf,11) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="95" style="height:71.25pt">
            <td class="auto-style28" height="234" rowspan="5">Bump structure</td>
            <td class="auto-style29">13</td>
            <td class="auto-style30" colspan="2">PKG Type</td>
            <td class="auto-style12" width="160">EP REPSV-12-EU<br />
                EP REPSV-12-LF<br />
                EP FOC-12-EU<br />
                EP FOC-12-LF<br />
                EP REPSV-8-LF</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><%# Eval("APP_08")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style31" height="22" width="32">14</td>
            <td class="auto-style32" colspan="2" width="321">PI type</td>
            <td class="auto-style18">HD4104</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_02")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style31" height="22" width="32">15</td>
            <td class="auto-style32" colspan="2" width="321">PI Thickness (um)</td>
            <td class="auto-style18">5um</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_03")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="38" style="mso-height-source:userset;height:28.5pt">
            <td class="auto-style33" height="38" width="32">16</td>
            <td class="auto-style32" colspan="2" width="321">UBM type / Thickness (um)</td>
            <td class="auto-style12" width="160">Ti1K/Cu5K/Ni2um<br />
                Ti1K/Cu5K/Ni3um</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_04")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="57" style="mso-height-source:userset;height:42.75pt">
            <td class="auto-style34" height="57" width="32">17</td>
            <td class="auto-style32" colspan="2" width="321">Bump composition</td>
            <td class="auto-style12" width="160">SnAg 1.8<br />
                SnAg 2.3<br />
                Eu</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql13,Conninf,12) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style35" height="384" rowspan="16" width="51">Bump design</td>
            <td class="auto-style36" width="32">18</td>
            <td class="auto-style37" colspan="2" width="321">REPSV PI Opening Size(um)</td>
            <td class="auto-style18">30~62</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><%# Eval("APP_21")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">19</td>
            <td class="auto-style37" colspan="2" width="321">Min fianl metal trace to seal ring (um)</td>
            <td class="auto-style39" width="160">6.7~20</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql14,Conninf,13) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">20</td>
            <td class="auto-style37" colspan="2" width="321">PI via opening bottom edge
                <br />
                to pad psv. Edge (um)</td>
            <td class="auto-style40">7~20</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql15,Conninf,14) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">21</td>
            <td class="auto-style37" colspan="2" width="321">PI edge inside seal ring (um)</td>
            <td class="auto-style41">5~13</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql16,Conninf,15) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="38" style="mso-height-source:userset;height:28.5pt">
            <td class="auto-style42" height="38" width="32">22</td>
            <td class="auto-style37" colspan="2" width="321">PR thickness(um)</td>
            <td class="auto-style12" width="160">30<br />
                50</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_05")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">23</td>
            <td class="auto-style37" colspan="2" width="321">UBM Size(um)</td>
            <td class="auto-style40">69~110</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><%# Eval("APP_33")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="38" style="mso-height-source:userset;height:28.5pt">
            <td class="auto-style42" height="38" width="32">24</td>
            <td class="auto-style37" colspan="2" width="321">UBM Overlap PSV (um)</td>
            <td class="auto-style40">10~25</td>
            <td class="auto-style14">　</td>
            <td class="auto-style43" width="173"><% =receive_npiimportdata(sql17,Conninf,16) %><br />
                (AMD LUBM only)</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">25</td>
            <td class="auto-style37" colspan="2" width="321">UBM insdie final metal for FOC (um)</td>
            <td class="auto-style40">3~7</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_06")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">26</td>
            <td class="auto-style37" colspan="2" width="321">UBM Plating Area(dm<font class="font8"><sup>2</sup></font><font class="font7">)</font></td>
            <td class="auto-style18">0.26~1.66</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_07")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">27</td>
            <td class="auto-style37" colspan="2" width="321">UBM Density (UBM Area/Die Area)</td>
            <td class="auto-style41">2.52~25.06</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_08")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">28</td>
            <td class="auto-style37" colspan="2" width="321">Mushroom CD(um)</td>
            <td class="auto-style18">105~173</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_09")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">29</td>
            <td class="auto-style37" colspan="2" width="321">Min Mushroom space(um)</td>
            <td class="auto-style12" width="160">20~182</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_10")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style44" height="22">30</td>
            <td class="auto-style45" colspan="2">Min. Bump pitch (um)</td>
            <td class="auto-style18">150~300</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><% =receive_npiimportdata(sql18,Conninf,17) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">31</td>
            <td class="auto-style37" colspan="2" width="321">Bump Height(um)</td>
            <td class="auto-style12" width="160">70~100</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><%# Eval("APP_09")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">32</td>
            <td class="auto-style37" colspan="2" width="321">Bump Diameter(um)</td>
            <td class="auto-style12" width="160">-</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19"><%# Eval("APP_11")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style38" height="22" width="32">33</td>
            <td class="auto-style37" colspan="2" width="321">Bump Density (Bump Q&#39;ty/Die Area)</td>
            <td class="auto-style41">8.8~39.95</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_11")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style46" height="22" width="51">　</td>
            <td class="auto-style36" width="32">34</td>
            <td class="auto-style37" colspan="2" width="321">BH/UBM ratio</td>
            <td class="auto-style41">0.85~1.1</td>
            <td class="auto-style14">　</td>
            <td class="auto-style27"><%# Eval("Man_12")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style47" height="200" rowspan="8" width="51">Outgoing criteria</td>
            <td class="auto-style48" width="32">35</td>
            <td class="auto-style49" colspan="2" width="321">LF Bump Ag% target</td>
            <td class="auto-style50">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style43" width="173"><% =receive_npiimportdata(sql19,Conninf,18) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style51" height="22" width="32">36</td>
            <td class="auto-style49" colspan="2" width="321">Bump Height(um)</td>
            <td class="auto-style50">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style43" width="173"><%# Eval("APP_08")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style51" height="22" width="32">37</td>
            <td class="auto-style49" colspan="2" width="321">Bump diameter</td>
            <td class="auto-style50">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style43" width="173"><%# Eval("APP_12")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style51" height="22" width="32">38</td>
            <td class="auto-style49" colspan="2" width="321">Bump Coplanarity<span style="mso-spacerun:yes">&nbsp;</span></td>
            <td class="auto-style50">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style52" width="173"><%# Eval("Man_13")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="34" style="mso-height-source:userset;height:25.5pt">
            <td class="auto-style53" height="34" width="32">39</td>
            <td class="auto-style49" colspan="2" width="321">Bump Shear Strenght</td>
            <td class="auto-style50">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style52" width="173"><%# Eval("Man_14")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style51" height="22" width="32">40</td>
            <td class="auto-style49" colspan="2" width="321">Bump void<span style="mso-spacerun:yes">&nbsp;&nbsp;</span></td>
            <td class="auto-style50">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style52" width="173"><%# Eval("Man_15")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="34" style="mso-height-source:userset;height:25.5pt">
            <td class="auto-style53" height="34" width="32">41</td>
            <td class="auto-style49" colspan="2" width="321">PI Rougness (Ra)</td>
            <td class="auto-style50">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style52" width="173"><%# Eval("Man_16")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="mso-height-source:userset;height:16.5pt">
            <td class="auto-style51" height="22" width="32">42</td>
            <td class="auto-style49" colspan="2" width="321">Bump Resistance (POR capability)</td>
            <td class="auto-style50">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style43" width="173"><% =receive_npiimportdata(sql20,Conninf,19) %></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style54" height="400" rowspan="15">Metrology tool</td>
            <td class="auto-style55" rowspan="7" width="32">43</td>
            <td class="auto-style56" rowspan="7" width="129">August</td>
            <td class="auto-style57">Gross die</td>
            <td class="auto-style18">10~50000 ea</td>
            <td class="auto-style18">58~25747 ea</td>
            <td class="auto-style52" width="173"><%# Eval("Man_17")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style58" height="22" width="192">Expose pad</td>
            <td class="auto-style18">-</td>
            <td class="auto-style18">No</td>
            <td class="auto-style52" width="173"><%# Eval("Man_18")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style58" height="22" width="192">PSV1(PI1/PBO1) opening</td>
            <td class="auto-style18">10~1000</td>
            <td class="auto-style18">22~240</td>
            <td class="auto-style19"><%# Eval("APP_21")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style58" height="22" width="192">Bump diameter</td>
            <td class="auto-style18">10~1000</td>
            <td class="auto-style18">84~127</td>
            <td class="auto-style19"><%# Eval("APP_11")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="40" style="height:30.0pt">
            <td class="auto-style59" height="40" width="192">Low SPEC of min RDL Width</td>
            <td class="auto-style18">2</td>
            <td class="auto-style18">10~78</td>
            <td class="auto-style19">-</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="40" style="height:30.0pt">
            <td class="auto-style59" height="40" width="192">Low SPEC of min RDL Spacing</td>
            <td class="auto-style18">2</td>
            <td class="auto-style18">10~29</td>
            <td class="auto-style19">-</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="40" style="height:30.0pt">
            <td class="auto-style59" height="40" width="192">Min RDL Width/Spacing pattern &amp; location</td>
            <td class="auto-style18">-</td>
            <td class="auto-style18">-</td>
            <td class="auto-style19">-</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style60" height="88" rowspan="4" width="32">44</td>
            <td class="auto-style56" rowspan="4" width="129">RVSI</td>
            <td class="auto-style57">Gross die</td>
            <td class="auto-style18">10~50000 ea</td>
            <td class="auto-style18">58~25747 ea</td>
            <td class="auto-style52" width="173"><%# Eval("Man_19")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style58" height="22" width="192">Bump count per die</td>
            <td class="auto-style18">1~500K</td>
            <td class="auto-style18">172~18510</td>
            <td class="auto-style19"><!--% =receive_npiimportdata(sql21,Conninf,20) %--></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style58" height="22" width="192">Bump height</td>
            <td class="auto-style18">3~1000</td>
            <td class="auto-style18">65~108</td>
            <td class="auto-style19"><%# Eval("APP_09")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style58" height="22" width="192">Bump diameter</td>
            <td class="auto-style18">20~1000</td>
            <td class="auto-style18">84~138</td>
            <td class="auto-style19"><%# Eval("APP_11")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style31" height="22" width="32">45</td>
            <td class="auto-style56" width="129">RS meter</td>
            <td class="auto-style61" width="192">Bump diameter</td>
            <td class="auto-style18">25~1000</td>
            <td class="auto-style18">30~326</td>
            <td class="auto-style19"><%# Eval("APP_11")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="38" style="height:28.5pt">
            <td class="auto-style33" height="38" width="32">46</td>
            <td class="auto-style56" width="129">Void (X-ray)</td>
            <td class="auto-style61" width="192">Bump diameter</td>
            <td class="auto-style12" width="160">CS/DF site: 80~1000<br />
                CH site: 10~1000</td>
            <td class="auto-style18">CS/DF: 80~326<br />
                CH: 30~326</td>
            <td class="auto-style19"><%# Eval("APP_11")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style31" height="22" width="32">47</td>
            <td class="auto-style56" width="129">Bump shear</td>
            <td class="auto-style61" width="192">Bump diameter</td>
            <td class="auto-style12" width="160">3~400</td>
            <td class="auto-style18">23~326</td>
            <td class="auto-style19"><%# Eval("APP_11")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style31" height="22" width="32">48</td>
            <td class="auto-style56" width="129">Bump pull</td>
            <td class="auto-style61" width="192">Bump diameter</td>
            <td class="auto-style12" width="160">83-140, 200-326</td>
            <td class="auto-style18">83-140, 200-326</td>
            <td class="auto-style19"><%# Eval("APP_11")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="40" style="height:30.0pt">
            <td class="auto-style62" height="84" rowspan="3" width="51">AB requirement</td>
            <td class="auto-style63" width="32">49</td>
            <td class="auto-style64" width="129">Bump to bump space</td>
            <td class="auto-style65" width="192">　</td>
            <td class="auto-style12" width="160">FCCSP &gt;19um<br />
                FCBGA&gt;20um</td>
            <td class="auto-style14">　</td>
            <td class="auto-style52" width="173"><%# Eval("Man_20")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style66" height="22">50</td>
            <td class="auto-style67">SMO</td>
            <td class="auto-style67">　</td>
            <td class="auto-style12" width="160">-</td>
            <td class="auto-style14">　</td>
            <td class="auto-style52" width="173"><%# Eval("Man_21")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style66" height="22">51</td>
            <td class="auto-style67">UBM/SMO ratio</td>
            <td class="auto-style67">　</td>
            <td class="auto-style12" width="160">0.85 - 1.1</td>
            <td class="auto-style14">　</td>
            <td class="auto-style52" width="173"><%# Eval("Man_22")%></td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="40" style="height:30.0pt">
            <td class="auto-style68" height="124" rowspan="4" width="51">Special Requirement</td>
            <td class="auto-style69" width="32">52</td>
            <td class="auto-style70" width="129">Process / Machine</td>
            <td class="auto-style71" width="192">　</td>
            <td class="auto-style12" width="160">-</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19">NA</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style72" height="22" width="32">53</td>
            <td class="auto-style70" width="129">Material</td>
            <td class="auto-style71" width="192">　</td>
            <td class="auto-style12" width="160">-</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19">NA</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
        <tr height="40" style="height:30.0pt">
            <td class="auto-style73" height="40" width="32">54</td>
            <td class="auto-style70" width="129">Measurement tool</td>
            <td class="auto-style71" width="192">　</td>
            <td class="auto-style12" width="160">-</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19">NA</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
        </tr>
              </ItemTemplate>
             <FooterTemplate>
        <tr height="22" style="height:16.5pt">
            <td class="auto-style72" height="22" width="32">55</td>
            <td class="auto-style70" width="129">Reliability</td>
            <td class="auto-style71" width="192">　</td>
            <td class="auto-style18">-</td>
            <td class="auto-style14">　</td>
            <td class="auto-style19">NA</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
            <td class="auto-style14">　</td>
       
        </tr>
         </table>
     
            <asp:Button ID="Save_Butt" runat="server" Text="SAVE" Height="53px" Width="120px" CssClass="auto-style112" Font-Bold="True" Font-Italic="False" Font-Names="Microsoft New Tai Lue" Font-Size="Large" ForeColor="#660066" /> 
   </FooterTemplate>
</asp:Repeater >
 
   <div id="dialog"><iframe src="" frameborder="0" height="100%" width="100%" id="dialogFrame" scrolling="auto"></iframe> </div>      
         </form>
    </body>
</html>

