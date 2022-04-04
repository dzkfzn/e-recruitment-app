<%@ Page Title="" Language="C#" MasterPageFile="~/Login_Rec.Master" AutoEventWireup="true" CodeBehind="Page_Register_Pelamar.aspx.cs" Inherits="Recruitment.Page_Register_Pelamar" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <meta http-equiv="refresh" content="3600">

    <div class="polman-form-login">
        <div class="alert alert-danger alert-dismissible fade show" runat="server" id="divAlert" visible="false">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <asp:Literal runat="server" ID="dangerMessage"></asp:Literal>
        </div>
        <div class="alert alert-success alert-dismissible fade show" runat="server" id="divSuccess" visible="false">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <asp:Literal runat="server" ID="successMessage"></asp:Literal>
        </div>
        <h4>Register</h4>
        <hr />
        <div class="form-group">
            <label for="txtEmail">Email<span style="color: red;">*</span></label>
            <asp:RequiredFieldValidator runat="server" ID="reqTxtEmail" ControlToValidate="txtEmail" ForeColor="Red" Text=" harus diisi" ValidationGroup="valRegister" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ForeColor="Red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="valRegister" ControlToValidate="txtEmail" ErrorMessage="Format Email Salah"></asp:RegularExpressionValidator>
            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" ClientIDMode="Static" ValidationGroup="valLogin"></asp:TextBox>
        </div>
        <asp:Button runat="server" ID="btnRegister" CssClass="btn btn-primary" Style="width: 100%; margin-top: 10px; margin-bottom: 10px;" Text="Register" ValidationGroup="valRegister" OnClick="btnRegister_Click" />
        <span style="margin-top: 10px;">Sudah punya akun? <a href='Page_Login_Pelamar.aspx'>Klik disini</a>.</span>
    </div>

    <script type="text/javascript">
        function showAlert() {
            $("#txtEmail").effect("shake");
        }
    </script>
</asp:Content>
