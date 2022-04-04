<%@ Page Title="Kelola Pelamar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Page_Kelola_Pelamar.aspx.cs" Inherits="Recruitment.Page_Kelola_Pelamar" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
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
    <asp:LinkButton runat="server" Visible="false" ID="btnKembali" CssClass="btn btn-secondary" OnClick="btnKembali_Click">Kembali</asp:LinkButton>
    <asp:LinkButton runat="server" Visible="false" ID="btnPrintPDF" CssClass="btn btn-primary" ForeColor="White" Text="Print PDF " OnClick="btnPrintPDF_Click">Print PDF <i class="fa fa-print" aria-hidden="true"></i></asp:LinkButton>

    <asp:TextBox runat="server" Visible="false" ID="pelamar_id">pelamar_id</asp:TextBox>
    <asp:Panel runat="server" ID="panelData">

        <div class="scrollstyle" style="overflow-x: auto;">
            <asp:GridView
                runat="server"
                ID="gridData"
                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                AllowPaging="true"
                AllowSorting="false"
                AutoGenerateColumns="false"
                EmptyDataText="Tidak ada data"
                PageSize="10"
                PagerStyle-CssClass="pagination-ys"
                ShowHeaderWhenEmpty="true"
                OnPageIndexChanging="gridData_PageIndexChanging"
                OnRowCommand="gridData_RowCommand"
                DataKeyNames="pel_id">
                <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                <Columns>
                    <asp:BoundField DataField="rownum" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                    <asp:BoundField DataField="pel_nama" HeaderText="Nama Pelamar" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="pel_modif_date_modif" HeaderText="Tanggal Melamar" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="linkDetail" CommandName="Detail" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Detail"><i class="fa fa-eye" aria-hidden="true"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="panelSatuIdentitas" Visible="false">
        <div class="col-lg-12">
            &nbsp;
        </div>
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" Font-Bold="true">Identitas Diri</asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">Data Diri</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtNoKTP">NIK<b style="color: red">*</b></label>
                                            <asp:RequiredFieldValidator runat="server" ID="reqNoKTP" ControlToValidate="txtNoKTP" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="txtNoKTP" CssClass="form-control" MaxLength="16" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtNoNPWP">No NPWP<b style="color: red">*</b></label>
                                            <asp:RequiredFieldValidator runat="server" ID="reqNoNPWP" ControlToValidate="txtNoNPWP" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="txtNoNPWP" CssClass="form-control" MaxLength="15" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtNamaLengkap">Nama Lengkap<b style="color: red">*</b></label>
                                            <asp:RequiredFieldValidator runat="server" ID="reqNamaLengkap" ControlToValidate="txtNamaLengkap" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:TextBox runat="server" ID="txtNamaLengkap" CssClass="form-control" MaxLength="50" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtTempatLahir">Tempat  Lahir<b style="color: red">*</b></label>
                                            <asp:RequiredFieldValidator runat="server" ID="reqTempatLahir" ControlToValidate="txtTempatLahir" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:TextBox runat="server" ID="txtTempatLahir" CssClass="form-control" MaxLength="50" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtTglLahir">Tanggal Lahir<b style="color: red">*</b> </label>
                                            <asp:RequiredFieldValidator runat="server" ID="valTglLahir" ControlToValidate="txtTglLahir" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="regtxtTglLahir" ControlToValidate="txtTglLahir" ValidationGroup="valSatuIdentitas" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>
                                            <asp:TextBox runat="server" ID="txtTglLahir" CssClass="form-control" MaxLength="10" BackColor="White" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" ID="calTxtTglLahir" TargetControlID="txtTglLahir" Format="yyyy-MM-dd" CssClass="cal_Theme1" />
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="ddlAgama">Agama:<b style="color: red">*</b></label>
                                            <asp:RequiredFieldValidator runat="server" ID="reqAgama" ControlToValidate="ddlAgama" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="ddlAgama" runat="server" CssClass="form-control" ValidationGroup="valSatuIdentitas">
                                                <asp:ListItem Text="Pilih Agama" Value=""></asp:ListItem>
                                                <asp:ListItem Text="Budha" Value="Budha"></asp:ListItem>
                                                <asp:ListItem Text="Hindu" Value="Hindu"></asp:ListItem>
                                                <asp:ListItem Text="Islam" Value="Islam"></asp:ListItem>
                                                <asp:ListItem Text="Katholik" Value="Katholik"></asp:ListItem>
                                                <asp:ListItem Text="Kristen" Value="Kristen"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtTelpSkrg">No Telp</label>
                                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="txtTelpSkrg" CssClass="form-control" MaxLength="15" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtNoHP">No HP<b style="color: red">*</b></label>
                                            <asp:RequiredFieldValidator runat="server" ID="reqNoHP" ControlToValidate="txtNoHP" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="txtNoHP" CssClass="form-control" MaxLength="15" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtNoHP">Email</label>
                                            <asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="txtEmail" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="valSatuIdentitas" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" ErrorMessage=" format email salah"></asp:RegularExpressionValidator>
                                            <asp:TextBox runat="server" ReadOnly="true" ID="txtEmail" CssClass="form-control" MaxLength="50" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>


                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <asp:Label runat="server" Font-Bold="true">Alamat</asp:Label>
                                            </div>
                                            <div class="card-block">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <label style='font-weight: bold;' for="txtAlamatSkrg">Alamat Sekarang<b style="color: red">*</b></label>
                                                            <asp:RequiredFieldValidator runat="server" ID="reqAlamatSkrg" ControlToValidate="txtAlamatSkrg" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>
                                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAlamatSkrg" CssClass="form-control" Columns="50" Rows="5" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <label style='font-weight: bold;' for="txtAlamatOrtu">Alamat Sesuai KTP<b style="color: red">*</b></label>
                                                            <asp:RequiredFieldValidator runat="server" ID="reqAlamatKTP" ControlToValidate="txtAlamatOrtu" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>

                                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAlamatOrtu" CssClass="form-control" Columns="50" Rows="5" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtUkuranBaju">Ukuran Baju</label>
                                            <asp:TextBox runat="server" ID="txtUkuranBaju" Visible="false" CssClass="form-control"></asp:TextBox>
                                            <asp:DropDownList ID="ddlUkuranBaju" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="" Text="Pilih Ukuran Baju" />
                                                <asp:ListItem Value="S" Text="S" />
                                                <asp:ListItem Value="M" Text="M" />
                                                <asp:ListItem Value="L" Text="L" />
                                                <asp:ListItem Value="XL" Text="XL" />
                                                <asp:ListItem Value="XXL" Text="XXL" />
                                                <asp:ListItem Value="XXXL" Text="XXXL" />
                                                <asp:ListItem Value="XXXXL" Text="XXXXL" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtUkuranSepatu">Ukuran Sepatu (35-47)</label>
                                            <asp:RangeValidator ID="rantxtUkuranSepatu" runat="server" ForeColor="Red" ErrorMessage=" harus sesuai range" ControlToValidate="txtUkuranSepatu" MinimumValue="35" MaximumValue="47" Type="Integer" ValidationGroup="valSatuIdentitas"></asp:RangeValidator>
                                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="txtUkuranSepatu" CssClass="form-control" MaxLength="2" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>


                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtNamaPenerimRek">Rekening Atas Nama</label>
                                            <%--<asp:RequiredFieldValidator runat="server" ID="reqNamaPenerimRek" ControlToValidate="txtNamaPenerimRek" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                            <asp:TextBox runat="server" ID="txtNamaPenerimRek" CssClass="form-control" MaxLength="50" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtNoRek">No Rekening(Permata)</label>
                                            <%--<asp:RequiredFieldValidator runat="server" ID="reqNoRek" ControlToValidate="txtNoRek" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="txtNoRek" CssClass="form-control" MaxLength="20" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-xl-4">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">Lain-lain</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtFoto">Pasphoto(3x4)</label>
                                            <div class="card">
                                                <br />
                                                <div style="text-align: center">
                                                    <asp:Image ID="Avatar" Width="300" Height="400" runat="server" AlternateText="No Image" />
                                                </div>
                                                <br />
                                                <div class="card-body">
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-lg-12" runat="server" visible="false">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtTelpSkrg">No Telp</label>
                                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="txtTelpOrtu" CssClass="form-control" MaxLength="15" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6" runat="server" visible="false">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtNamaBank">Nama Bank</label>
                                            <asp:TextBox runat="server" Text="Permata Bank" ID="txtNamaBank" CssClass="form-control" MaxLength="20" ValidationGroup="valSatuIdentitas"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </asp:Panel>

    <asp:Panel runat="server" ID="panelDuaPendidikan" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" Font-Bold="true">Pendidikan</asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">1. Pendidikan Formal</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataPendidikanFormal"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="fop_id">
                                                <Columns>
                                                    <asp:BoundField DataField="fop_jenjang" HeaderText="Jenjang" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="fop_nama_sekolah" HeaderText="Nama Sekolah" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="fop_fakultas" HeaderText="Fakultas" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="fop_jurusan" HeaderText="Jurusan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="fop_prog_studi" HeaderText="Program Studi" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="fop_tempat" HeaderText="Tempat" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Tanggal Mulai s/d Akhir" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%# Eval("fop_tgl_mulai_modif") %> s/d <%# Eval("fop_tgl_akhir_modif") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="fop_ket" HeaderText="Ket." NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />


                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <label style='font-weight: bold;' for="txtNamaLengkap">2. Uraikan dengan singkat, mengapa Anda memilih jurusan tersebut di perguruan tinggi:</label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" ID="txtAlasanPilihJurusan" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <label style='font-weight: bold;' for="txtNamaLengkap">3. Sebutkan karya ilmiah yang pernah Anda buat : (skripsi, artikel, karya tulis, dll)</label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" ID="txtKaryaIlmiah" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">4. Pendidikan Non-Formal</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="nfp_id" Visible="false"></asp:TextBox>
                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataPendidikanNonFormal"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="nfp_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="nfp_nama_kursus" HeaderText="Nama Kursus / Training" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="nfp_tempat" HeaderText="Tempat" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Tanggal Mulai s/d Akhir" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%# Eval("nfp_tgl_awal_modif") %> s/d <%# Eval("nfp_tgl_akhir_modif") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="nfp_ket" HeaderText="Keterangan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                     <div class="col-lg-12">
                         <div class="card">
                             <div class="card-header">
                                 <asp:Label runat="server" Font-Bold="true">5. Bahasa Asing yang anda kuasai:</asp:Label>
                             </div>
                             <div class="card-block">
                                 <div class="row">
                                     <div class="col-lg-12">
                                         <asp:TextBox runat="server" ID="bhs_id" Visible="false"></asp:TextBox>

                                         <div class="scrollstyle" style="overflow-x: auto;">
                                             <asp:GridView
                                                 runat="server"
                                                 ID="gridDataBahasa"
                                                 CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                 AllowPaging="false"
                                                 AllowSorting="false"
                                                 AutoGenerateColumns="false"
                                                 EmptyDataText="Tidak ada data"
                                                 ShowHeaderWhenEmpty="true"
                                                 DataKeyNames="bhs_id">
                                                 <Columns>
                                                     <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="bhs_bahasa" HeaderText="Bahasa" NullDisplayText="-" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" />
                                                     <asp:BoundField DataField="bhs_lisan" HeaderText="Lisan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="bhs_tertulis" HeaderText="Tertulis" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                 </Columns>
                                             </asp:GridView>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </asp:Panel>



    <asp:Panel runat="server" ID="panelTigaLingKeluarga" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" Font-Bold="true">Lingkungan Keluarga</asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">1. Status Pernikahan </asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="form-group">
                                            <asp:RadioButtonList RepeatDirection="Horizontal" CssClass="radioButtonList form-control" ID="rbStatusPernikahan" runat="server">
                                                <asp:ListItem Value="Single/Tungangan"> Single/Tungangan </asp:ListItem>
                                                <asp:ListItem Value="Menikah"> Menikah </asp:ListItem>
                                                <asp:ListItem Value="Bercerai"> Bercerai </asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>

                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtStatusTgl">Sejak Tanggal</label>
                                            <asp:TextBox runat="server" ID="txtStatusTgl" CssClass="form-control" ValidationGroup="valDuaLingKel" ClientIDMode="Static" MaxLength="10" BackColor="White"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="regTxtStatusTgl" ControlToValidate="txtStatusTgl" ValidationGroup="valDuaLingKel" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>
                                            <ajaxToolkit:CalendarExtender runat="server" ID="calTxtStatusTgl" TargetControlID="txtStatusTgl" Format="yyyy-MM-dd" CssClass="cal_Theme1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">2. Susunan Keluarga (Istri/Suami dan Anak-anak) </asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="klg_id" Visible="false"></asp:TextBox>
                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataKeluargaSendiri"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="klg_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Hubungan" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%# Eval("klg_hubungan_keluarga") %> <%# Eval("klg_no_urut_anak") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="klg_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="klg_jenis_kelamin" HeaderText="Jenis Kelamin" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Tempat/Tgl Lahir" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%# Eval("klg_tempat_lahir") %>/<%# Eval("klg_tgl_lahir_modif") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="klg_pendidikan" HeaderText="Pendidikan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="klg_pekerjaan" HeaderText="Pekerjaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">3. Susunan Keluarga (Ayah, Ibu, Saudara Kandung, termasuk Anda) </asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataKeluargaOrtu"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="klg_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="klg_hubungan_keluarga" HeaderText="Hubungan" NullDisplayText="-" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="klg_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="klg_jenis_kelamin" HeaderText="Jenis Kelamin" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Tempat/Tgl Lahir" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%# Eval("klg_tempat_lahir") %>/<%# Eval("klg_tgl_lahir_modif") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="klg_pendidikan" HeaderText="Pendidikan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="klg_pekerjaan" HeaderText="Pekerjaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </asp:Panel>

    <asp:Panel runat="server" ID="panelEmpatRiwayatPekerjaan" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" Font-Bold="true">Riwayat Pekerjaan</asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">1. Pengalaman Kerja </asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="pek_id" Visible="false"></asp:TextBox>

                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataRiwayatPekerjaan"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="pek_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="pek_nama_perusahaan" HeaderText="Nama Perusahaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="pek_jabatan" HeaderText="Jabatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Tanggal Mulai s/d Akhir" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%# Eval("pek_tgl_mulai_modif") %> s/d <%# Eval("pek_tgl_akhir_modif") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="pek_gaji" HeaderText="Gaji" DataFormatString="Rp {0:###,###,###}" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="pek_alasan_pindah" HeaderText="Alasan Pindah" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="pek_gambaran_singkat" HeaderText="Gambaran Singkat Mengenai Jabatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="pek_kesan_peruhaan" HeaderText="Kesan Perusahaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">2. Sebutkan siapa yang pernah menjadi atasan Anda. Dan jumlah bawahan anda saat itu:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="rab_id" Visible="false"></asp:TextBox>
                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataRiwayatAtasan"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="rab_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rab_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rab_jabatan" HeaderText="Jabatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rab_perusahaan" HeaderText="Perusahaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rab_jumlah_bawahan" HeaderText="Jumlah Bawahan Anda" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">3. Masalah penting apa saja yang pernah Anda hadapi dan bagaimana mengatasinya?</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtMasalahCaraAtasi" CssClass="form-control" Columns="50" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">4. Pernahkah Anda melakukan pembaharuan/perubahan di perusahaan tersebut ?</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:RadioButtonList RepeatDirection="Horizontal" CssClass="radioButtonList" AutoPostBack="true" ID="rbMelakukanPerubahan" runat="server">
                                                <asp:ListItem Value="Ya"> Ya</asp:ListItem>
                                                <asp:ListItem Value="Tidak"> Tidak</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label style='font-weight: bold;' for="txtMelakukanPerubahanKet">Uraikan (isi jika pilih Ya):</label>
                                            <asp:TextBox runat="server" AutoPostBack="true" Visible="false" ID="txtMelakukanPerubahanKet" CssClass="form-control" TextMode="MultiLine" ClientIDMode="Static" BackColor="White"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">5. Siapakah yang mendorong Anda hingga sampai pada taraf kemajuan seperti sekarang ?</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtMendorongKemajuan" CssClass="form-control" Columns="50" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">6. Bagaimana bila Anda menghadapi persoalan dalam pekerjaan dan harus mengambil keputusan ?</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtHadapiSoalKerja" CssClass="form-control" Columns="50" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </asp:Panel>

    <asp:Panel runat="server" ID="panelLimaMinatKonsepPribadi" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" Font-Bold="true">Minat dan Konsep Pribadi</asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">1. Uraikan apa yang menjadi cita-cita Anda:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtCitaCita" CssClass="form-control" Columns="50" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">2. Apa yang mendorong Anda ingin pekerja:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDorongKerja" CssClass="form-control" Columns="50" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">3. Mengapa Anda ingin bekerja di Perusahaan kami ?</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAlasanKerja" CssClass="form-control" Columns="50" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">4. Sebutkan Gaji yang anda inginkan ?</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">Rp</span>
                                                <asp:TextBox runat="server" onkeyup="format(this);" onkeypress="return isNumberKey(event);" ID="txtGajiHarapan" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">5. Sebutkan Fasilitas yang Anda harapkan:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtFasilitasHarapan" CssClass="form-control" Columns="50" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">6. Kapan Anda dapat mulai bekerja:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtMulaiKerja" CssClass="form-control" Columns="50" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">7. Pilih jenis pekerjaan berikut sesuai dengan prioritas pekerjaan yang Anda minati (3 jenis):</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="mpe_id" Visible="false"></asp:TextBox>

                                        <div class="scrollstyle" style="overflow-x: auto;">

                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataMinatPekerjaan"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="mpe_id">
                                                <Columns>
                                                    <asp:BoundField DataField="mpe_jenispekerjaan" HeaderText="Jenis Pekerjaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="mpe_no_urut" HeaderText="No Urut" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">8. Lingkungan kerja yang disenangi:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:RadioButtonList RepeatDirection="Horizontal" CssClass="radioButtonList" AutoPostBack="true" Enabled="false" ID="rbLingkunganKerjaSenang" runat="server">
                                                <asp:ListItem Value="Lapangan"> Lapangan</asp:ListItem>
                                                <asp:ListItem Value="Kantor"> Kantor</asp:ListItem>
                                                <asp:ListItem Value="Pabrik"> Pabrik</asp:ListItem>
                                                <asp:ListItem Value="Lain-lain"> Lain-lain</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:Label for="txtLingkunganKerjaSenang" runat="server" Font-Bold="true">Sebutkan (Jika anda memilih Lain-lain):</asp:Label>
                                            <asp:TextBox runat="server" AutoPostBack="true" Visible="false" ID="txtLingkunganKerjaSenang" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">9. Bersediakah Anda ditempatkan di luar daerah:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:RadioButtonList RepeatDirection="Horizontal" CssClass="radioButtonList" ID="rbSediaLuarDaerah" runat="server">
                                                <asp:ListItem Value="Ya"> Ya</asp:ListItem>
                                                <asp:ListItem Value="Tidak"> Tidak</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">10. Sebutkan tipe orang yang Anda senangi:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtTipeSenangi" CssClass="form-control" Columns="50" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">11. Terhadap hal apa Anda sulit mengambil keputusan:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" ID="txtSulitKeputusan" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <br />
    </asp:Panel>

    <asp:Panel runat="server" ID="panelEnamAktivitasSosial" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" Font-Bold="true">AktivitasSosial</asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">1. Kenalan di Perusahaan kami ? (Isi jika ada) </asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList RepeatDirection="Horizontal" AutoPostBack="true" CssClass="radioButtonList" Enabled="false" ID="rbAdaKenalan" runat="server">
                                            <asp:ListItem Value="Ya"> Ya</asp:ListItem>
                                            <asp:ListItem Value="Tidak"> Tidak</asp:ListItem>
                                        </asp:RadioButtonList>


                                    </div>
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="kpe_id" Visible="false"></asp:TextBox>
                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataKenalanPerusahaan"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="kpe_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="kpe_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="kpe_perusahaan" HeaderText="Perusahaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="kpe_jabatan" HeaderText="Jabatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="kpe_no_telp" HeaderText="No.Telp" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="kpe_hubungan" HeaderText="Hubungan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">2. No telepon keluarga/teman yang dapat dihubungi (minimal 1) :</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="dkh_id" Visible="false"></asp:TextBox>
                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataKeluargaHubungi"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="dkh_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="dkh_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="dkh_no_telp" HeaderText="No Telp/HP" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="dkh_hubungan" HeaderText="Hubungan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">3. Sebutkan refrensi Anda di luar Perusahaan kami:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="rfp_id" Visible="false"></asp:TextBox>
                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataRefrensiPerusahaan"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="rfp_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rfp_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rfp_perusahaan" HeaderText="Perusahaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rfp_jabatan" HeaderText="Jabatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rfp_no_telp" HeaderText="No Telp" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rfp_hubungan" HeaderText="Hubungan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">4. Hobi/Kegemaran Anda:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="txtHobi" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">5. Bagaimana cara Anda mengisi waktu luang ?</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="txtIsiWaktuLuang" TextMode="MultiLine" Columns="50" Rows="5" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">6. Organisasi yang pernah Anda ikuti:</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="rog_id" Visible="false"></asp:TextBox>

                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataRiwayatOrganisasi"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="rog_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rog_nama_organisasi" HeaderText="Nama Organisasi" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rog_tempat" HeaderText="Tempat" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rog_jabatan" HeaderText="Jabatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rog_tujuan" HeaderText="Tujuan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </asp:Panel>

    <asp:Panel runat="server" ID="panelTujuhLainLain" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" Font-Bold="true">Lain-Lain</asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">1. Pernahkah Anda mengikuti psikotest sebelumnya ?</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="rps_id" Visible="false"></asp:TextBox>
                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataRiwayatPsikotes"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="rps_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rps_waktu" HeaderText="Waktu" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rps_tempat" HeaderText="Tempat" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rps_tujuan" HeaderText="Tujuan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">2. Apa yang menjadi kekuatan (strong point) Anda ?</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="txtKekuatan" TextMode="MultiLine" Columns="50" Rows="5" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">3. Apa yang Anda rasakan perlu diperbaiki (weak point) pada diri Anda ? </asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="txtKelemahan" TextMode="MultiLine" Columns="50" Rows="5" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" Font-Bold="true">4. Pernahkah Anda menderita sakit yang lama sembuh ?</asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="rpe_id" Visible="false"></asp:TextBox>
                                        <div class="scrollstyle" style="overflow-x: auto;">
                                            <asp:GridView
                                                runat="server"
                                                ID="gridDataRiwayatPenyakit"
                                                CssClass="table table-hover table-bordered table-condensed table-striped grid"
                                                AllowPaging="false"
                                                AllowSorting="false"
                                                AutoGenerateColumns="false"
                                                EmptyDataText="Tidak ada data"
                                                ShowHeaderWhenEmpty="true"
                                                DataKeyNames="rpe_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rpe_nama_penyakit" HeaderText="Nama Penyakit" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Tanggal Mulai s/d Akhir" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <%# Eval("rpe_tgl_awal_modif") %> s/d <%# Eval("rpe_tgl_akhir_modif") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="rpe_akibat" HeaderText="Akibatnya" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </asp:Panel>


    <br />
    <br />
    <script type="text/javascript">
        $('.dropdown-menu').click(function (event) {
            event.stopPropagation();
        });

        $('#editModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var data = button.data('jenis')
            var nama = button.data('nama')
            var modal = $(this)
            modal.find('.modal-footer #txtConfirmEdit').val(data)
            modal.find('.modal-body #editNama').val(nama)
        })

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 46 || charCode > 57)) {
                return false;
            } return true;
        }

        function format(input) {
            var nStr = input.value + '';
            nStr = nStr.replace(/\./g, "");
            var x = nStr.split(',');
            var x1 = x[0];
            var x2 = x.length > 1 ? ',' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + '.' + '$2');
            }
            input.value = x1 + x2;
        }

        function cekImage(param, deskripsi) {
            var input, file, valid = true;
            input = param;
            file = input.files[0];
            if (file.size / 1024 > 5120) {
                alert("Opps! Berkas " + deskripsi + " terlalu besar! Ukuran maksimal berkas yang bisa dikirim adalah 2 MB");
                valid = false;
            }
            var a = input.value.split(".").pop();
            if (a.toLowerCase() != "jpg" && a.toLowerCase() != "png") {
                alert("Opps! Format berkas " + deskripsi + " yang dibolehkan adalah .jpg atau .png");
                valid = false;
            }
            if (!valid) {
                param.value = "";
            }
        }

        $(document).ready(function () {
            $("a.grouped_elements").fancybox();
        });
    </script>
</asp:Content>
