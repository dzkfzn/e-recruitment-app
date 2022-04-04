<%@ Page Title="" Language="C#" MasterPageFile="~/Login_Rec.Master" AutoEventWireup="true" CodeBehind="Page_Login_Pelamar.aspx.cs" Inherits="Recruitment.Page_Login_Pelamar" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<meta http-equiv="refresh" content="3600">
    <div class="polman-form-login">
        <h4>Login</h4>
        <hr />
        <div class="form-group">
            <label for="txtUsername">Nama Akun <span style="color: red;">*</span></label>
            <asp:RequiredFieldValidator runat="server" ID="reqTxtUsername" ControlToValidate="txtUsername" ForeColor="Red" Text=" harus diisi" ValidationGroup="valLogin" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" ClientIDMode="Static" ValidationGroup="valLogin"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtPassword">Kata Sandi <span style="color: red;">*</span></label>
            <asp:RequiredFieldValidator runat="server" ID="reqTxtPassword" ControlToValidate="txtPassword" ForeColor="Red" Text=" harus diisi" ValidationGroup="valLogin" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" ClientIDMode="Static" TextMode="Password" ValidationGroup="valLogin"></asp:TextBox>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-lg-12">
                    <label for="txtCaptcha">Captcha <span style="color: red;">*</span></label>
                    <asp:RequiredFieldValidator runat="server" ID="reqTxtCaptcha" ControlToValidate="txtCaptcha" ForeColor="Red" Text=" harus diisi" ValidationGroup="valLogin" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <asp:Image ID="imgCaptcha" ImageUrl="Captcha.ashx" runat="server" Style="padding-bottom: 5px;" />
                </div>
                <div class="col-lg-6">
                    <div class="input-group">
                        <span class="input-group-addon" style="background-color: #0275d8; padding: 0;">
                            <asp:LinkButton runat="server" ID="btnReloadCaptcha" CssClass="btn btn-primary" Style="padding: 7px 13px 7px 13px;" data-toggle="tooltip" data-placement="bottom" title="Perbarui Captcha" OnClick="btnReloadCaptcha_Click"><i class='fa fa-refresh'></i></asp:LinkButton>
                        </span>
                        <asp:TextBox runat="server" ID="txtCaptcha" CssClass="form-control text-center" ClientIDMode="Static" ValidationGroup="valLogin"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <asp:Button runat="server" ID="btnLogin" CssClass="btn btn-primary" Style="width: 100%; margin-top: 10px; margin-bottom: 10px;" Text="Masuk" ValidationGroup="valLogin" OnClick="btnLogin_Click" />
        <span style="margin-top: 10px;">Belum punya akun? <a href='Page_Register_Pelamar.aspx'>Klik disini</a>.</span>
    </div>

    <script type="text/javascript">
        function showAlert() {
            $("#txtUsername").effect("shake");
            $("#txtPassword").effect("shake");
        }

        function showAlertCaptcha() {
            $("#txtCaptcha").effect("shake");
        }
    </script>
</asp:Content>
