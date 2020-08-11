<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Details</title>
    <style type="text/css">
        .auto-style1 {
            width: 257px;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: center;
        }
        .newStyle1 {
        }
        .newStyle2 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-image: url('Image/Background.jpg'); height: 1484px; width: 1642px;">
    <div style="background-image: none">
    
    </div>
        <div class="auto-style2">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h1 class="auto-style3">&nbsp;</h1>
            <strong><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="newStyle2">Employee Details</span></em></strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name</td>
                <td>
        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" controltovalidate="txt_name"

                        errormessage="Please enter the name">

                    </asp:requiredfieldvalidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Address</td>
                <td>
        <asp:TextBox ID="txt_Add" runat="server"></asp:TextBox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" controltovalidate="txt_Add"

                        errormessage="Please enter the Address">

                    </asp:requiredfieldvalidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
        <asp:Button ID="BtnSave" runat="server" OnClick="Button1_Click" Text="Save" />
        <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" backcolor="Yellow" ForeColor="Black" AutoGenerateColumns="False" Height="203px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" style="margin-left: 219px" Width="446px">
            <Columns>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_name" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>' Visible="False"></asp:Label>
                    </EditItemTemplate>
                     <ItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("id") %>' Visible="False"></asp:Label>
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Add" runat="server" Text='<%# Eval("address") %>'></asp:TextBox>
                       </EditItemTemplate>
                     <ItemTemplate>
                       <asp:Label ID="Label4" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                        </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">

                        <EditItemTemplate>

                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False"

                        CommandName="Update">Update</asp:LinkButton>

                        <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False"

                        CommandName="Cancel">Cancel</asp:LinkButton>

                        </EditItemTemplate>

                        <ItemTemplate>

                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False"

                        CommandName="Edit">Edit</asp:LinkButton>

                        </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete">

                        <ItemTemplate>

                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False"

                        CommandName="Delete"

                        onclientclick="return confirm('Are you sure you want to delete this record')">Delete</asp:LinkButton>

                        </ItemTemplate>

                        </asp:TemplateField>

                        </Columns>

                        <headerstyle backcolor="#FF9933" />

                        <alternatingrowstyle backcolor="#FFCC00" />
        </asp:GridView>
        <br />
        <br />
    </form>
</body>
</html>
