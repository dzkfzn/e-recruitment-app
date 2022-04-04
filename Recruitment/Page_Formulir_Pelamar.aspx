<%@ Page Title="Formulir Lamaran" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Page_Formulir_Pelamar.aspx.cs" Inherits="Recruitment.Page_Formulir_Pelamar" MaintainScrollPositionOnPostback="true" %>

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

    <asp:Panel runat="server" ID="panelLand" Visible="true">
        <asp:LinkButton runat="server" ID="btnLand" CssClass="btn btn-success" OnClick="btnLand_Click">Isi Lamaran</i></asp:LinkButton>
    </asp:Panel>

    <asp:Panel runat="server" ID="panelPendidikanFormal" Visible="false">
        <asp:TextBox runat="server" ID="fop_id" Visible="false"></asp:TextBox>
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderPenFor" />
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addJenjangPenFor">Jenjang<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqddlJenjang" ControlToValidate="addJenjangPenFor" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAdd" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="addJenjangPenFor" runat="server" CssClass="form-control">
                                <asp:ListItem Value="" Text="Pilih Jenjang" />
                                <asp:ListItem Value="SLA" Text="SLA" />
                                <asp:ListItem Value="Diploma" Text="Diploma" />
                                <asp:ListItem Value="S1" Text="S1" />
                                <asp:ListItem Value="S2" Text="S2" />
                                <asp:ListItem Value="S3" Text="S3" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaPenFor">Nama Sekolah<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqAddNamaPendFor" ControlToValidate="addNamaPenFor" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddPenFor" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addNamaPenFor" CssClass="form-control" MaxLength="50" ValidationGroup="valAddPenFor"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addFakultas">Fakultas<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqFakultasPenFor" ControlToValidate="addFakultas" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddPenFor" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addFakultas" CssClass="form-control" MaxLength="50" ValidationGroup="valAddPenFor"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addJurusanPenFor">Jurusan <b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqJurusanPenFor" ControlToValidate="addJurusanPenFor" Text=" harus dipilih" ForeColor="Red" ValidationGroup="valAddPenFor" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addJurusanPenFor" CssClass="form-control" MaxLength="50" ValidationGroup="valAddPenFor"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addProgramStudiPenFor">Program Studi<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqProgramStudiPenFor" ControlToValidate="addProgramStudiPenFor" Text=" harus dipilih" ForeColor="Red" ValidationGroup="valAddPenFor" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addProgramStudiPenFor" CssClass="form-control" MaxLength="50" ValidationGroup="valAddPenFor"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTempatPenFor">Tempat<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddTempatPenFor" ControlToValidate="addTempatPenFor" Text=" harus dipilih" ForeColor="Red" ValidationGroup="valAddPenFor" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addTempatPenFor" CssClass="form-control" MaxLength="50" ValidationGroup="valAddPenFor"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTglAkhirPenFor">Tanggal Mulai s/d Tanggal Akhir<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqAddTglAwanPenFor" ControlToValidate="addTglAwalPenFor" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddPenFor" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator runat="server" ID="reqAddAkhirPenFor" ControlToValidate="addTglAkhirPenFor" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddPenFor" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regaddTglAwalPenFor" ControlToValidate="addTglAwalPenFor" ValidationGroup="valAddPenFor" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="regaddTglAkhirPenFor" ControlToValidate="addTglAkhirPenFor" ValidationGroup="addTglAkhirPenFor" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>
                            <div class="input-group input-daterange">
                                <asp:TextBox runat="server" ID="addTglAwalPenFor" CssClass="form-control" ClientIDMode="Static" MaxLength="10" ValidationGroup="valAddPenFor" BackColor="White"></asp:TextBox>
                                <div class="input-group-addon">s/d</div>
                                <asp:TextBox runat="server" ID="addTglAkhirPenFor" CssClass="form-control" ClientIDMode="Static" MaxLength="10" ValidationGroup="valAddPenFor" BackColor="White"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender runat="server" ID="caladdTglAkhirPenFor" TargetControlID="addTglAkhirPenFor" Format="yyyy-MM-dd" CssClass="cal_Theme1" />
                                <ajaxToolkit:CalendarExtender runat="server" ID="caladdTglAwalPenFor" TargetControlID="addTglAwalPenFor" Format="yyyy-MM-dd" CssClass="cal_Theme1" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addProgramStudiPenFor">Keterangan<b style="color: red">*</b></label>
                            <asp:TextBox runat="server" TextMode="MultiLine" ID="addKetPenFor" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliPenFor" CssClass="btn btn-secondary" OnClick="btnKembaliPenFor_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddPenFor" CssClass="btn btn-primary" ValidationGroup="valAddPenFor" OnClick="btnAddPenFor_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditPenFor" CssClass="btn btn-primary" ValidationGroup="valAddPenFor" OnClick="btnEditPenFor_Click">Update</asp:LinkButton>

    </asp:Panel>

    <asp:Panel runat="server" ID="panelPendidikanNonFormal" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderPenNonFor" />
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaPenNonFor">Nama Kursus/Training<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqAddNamaPenNonFor" ControlToValidate="addNamaPenNonFor" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddPenNonFor" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addNamaPenNonFor" CssClass="form-control" MaxLength="50" ValidationGroup="valAddPenNonFor"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTempatPenNonFor">Tempat<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqTempatPenNonFor" ControlToValidate="addTempatPenNonFor" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddPenNonFor" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addTempatPenNonFor" CssClass="form-control" MaxLength="50" ValidationGroup="valAddPenNonFor"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTglAkhirPenFor">Tanggal Mulai s/d Tanggal Akhir<b style="color: red">*</b></label>
                            <asp:RegularExpressionValidator ID="reg" ControlToValidate="addTglAwalPenNonFor" ValidationGroup="valAddPenNonFor" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="regaddTglAkhirPenNonFor" ControlToValidate="addTglAkhirPenNonFor" ValidationGroup="valAddPenNonFor" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>
                            <ajaxToolkit:CalendarExtender runat="server" ID="calTglAwalPenNonFor" TargetControlID="addTglAwalPenNonFor" Format="yyyy-MM-dd" CssClass="cal_Theme1" />
                            <ajaxToolkit:CalendarExtender runat="server" ID="calTglAkhirPenNonFor" TargetControlID="addTglAkhirPenNonFor" Format="yyyy-MM-dd" CssClass="cal_Theme1" />
                            <div class="input-group input-daterange">
                                <asp:TextBox runat="server" ID="addTglAwalPenNonFor" CssClass="form-control" ClientIDMode="Static" MaxLength="10" BackColor="White"></asp:TextBox>
                                <div class="input-group-addon">s/d</div>
                                <asp:TextBox runat="server" ID="addTglAkhirPenNonFor" CssClass="form-control" ClientIDMode="Static" MaxLength="10" BackColor="White"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addKetPenNonFor">Keterangan</label>
                            <asp:TextBox runat="server" TextMode="MultiLine" ID="addKetPenNonFor" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btmKembaliPenNonFor" CssClass="btn btn-secondary" OnClick="btmKembaliPenNonFor_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddPenNonFor" CssClass="btn btn-primary" ValidationGroup="valAddPenNonFor" OnClick="btnAddPenNonFor_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditPenNonFor" CssClass="btn btn-primary" ValidationGroup="valAddPenNonFor" OnClick="btnEditPenNonFor_Click">Update</asp:LinkButton>

    </asp:Panel>

    <asp:Panel runat="server" ID="panelBahasa" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderBahasa" />
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addBahasaBhs">Bahasa<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqBahasaBhs" ControlToValidate="addBahasaBhs" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddBhs" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addBahasaBhs" CssClass="form-control" MaxLength="50" ValidationGroup="valAddBhs"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addLisanBhs">Tingkatan Menguasai Lisan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqLisanBhs" ControlToValidate="addLisanBhs" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddBhs" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="addLisanBhs" runat="server" CssClass="form-control">
                                <asp:ListItem Value="" Text="Pilih Tingkat" />
                                <asp:ListItem Value="Kurang" Text="Kurang" />
                                <asp:ListItem Value="Cukup" Text="Cukup" />
                                <asp:ListItem Value="Baik" Text="Baik" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTertulisBhs">Tingkatan Menguasai Tertulis<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqTertulisBhs" ControlToValidate="addTertulisBhs" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddBhs" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="addTertulisBhs" runat="server" CssClass="form-control">
                                <asp:ListItem Value="" Text="Pilih Tingkat" />
                                <asp:ListItem Value="Kurang" Text="Kurang" />
                                <asp:ListItem Value="Cukup" Text="Cukup" />
                                <asp:ListItem Value="Baik" Text="Baik" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliBhs" CssClass="btn btn-secondary" OnClick="btnKembaliBhs_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddBhs" CssClass="btn btn-primary" ValidationGroup="valAddBhs" OnClick="btnAddBhs_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditBhs" CssClass="btn btn-primary" ValidationGroup="valAddBhs" OnClick="btnEditBhs_Click">Update</asp:LinkButton>
    </asp:Panel>

    <asp:Panel runat="server" ID="panelKeluarga" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderKeluarga" />
                <asp:TextBox runat="server" ID="jenis_keluarga" Visible="false"></asp:TextBox>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addHubunganKlg">Hubungan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddHubunganKlg" ControlToValidate="addHubunganKlg" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddKlg" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="addHubunganKlg" runat="server" CssClass="form-control" ValidationGroup="valAddKlg" AutoPostBack="true" OnSelectedIndexChanged="addHubunganKlg_SelectedIndexChanged">
                                <asp:ListItem Value="" Text="Pilih Hubungan" />
                                <asp:ListItem Value="Anak" Text="Anak" />
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNoUrutKlg">Anak Ke</label>
                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="addNoUrutKlg" CssClass="form-control" MaxLength="50" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaKlg">Nama<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddNamaKlg" ControlToValidate="addNamaKlg" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddKlg" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addNamaKlg" CssClass="form-control" MaxLength="50" ValidationGroup="valAddKlg"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addJenisKelKlg">Jenis Kelamin<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddJenisKelKlg" ControlToValidate="addJenisKelKlg" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddKlg" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="addJenisKelKlg" runat="server" CssClass="form-control" ValidationGroup="valAddKlg">
                                <asp:ListItem Value="" Text="Pilih Jenis Kelamin" />
                                <asp:ListItem Value="Laki-Laki" Text="Laki-Laki" />
                                <asp:ListItem Value="Perempuan" Text="Perempuan" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTempatLahirKlg">Tempat Lahir</label>
                            <asp:TextBox runat="server" ID="addTempatLahirKlg" CssClass="form-control" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTglLahirKlg">Tanggal Lahir</label>
                            <asp:RegularExpressionValidator ValidationGroup="valAddKlg" ID="regcaladdTglLahirKlg" ControlToValidate="addTglLahirKlg" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>
                            <asp:TextBox ValidationGroup="valAddKlg" runat="server" ID="addTglLahirKlg" CssClass="form-control" MaxLength="10"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender runat="server" ID="caladdTglLahirKlg" TargetControlID="addTglLahirKlg" Format="yyyy-MM-dd" CssClass="cal_Theme1" />

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addPendidikanKlg">Pendidikan</label>
                            <asp:TextBox runat="server" ID="addPendidikanKlg" CssClass="form-control" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addPekerjaanKlg">Pekerjaan</label>
                            <asp:TextBox runat="server" ID="addPekerjaanKlg" CssClass="form-control" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliKlg" CssClass="btn btn-secondary" OnClick="btnKembaliKlg_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddKlg" CssClass="btn btn-primary" ValidationGroup="valAddKlg" OnClick="btnAddKlg_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditKlg" CssClass="btn btn-primary" ValidationGroup="valAddKlg" OnClick="btnEditKlg_Click">Update</asp:LinkButton>
    </asp:Panel>

    <asp:Panel runat="server" ID="panelPengalamanKerja" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderPngKer" />
            </div>
            <div class="card-block">
                <div class="row">

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaPerPngKer">Nama Perusahaan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddNamaPerPngKer" ControlToValidate="addNamaPerPngKer" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddPngKer" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addNamaPerPngKer" CssClass="form-control" MaxLength="50" ValidationGroup="valAddPngKer"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaKlg">Jabatan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddJabatanPngKer" ControlToValidate="addJabatanPngKer" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddPngKer" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addJabatanPngKer" CssClass="form-control" MaxLength="50" ValidationGroup="valAddPngKer"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTglAkhirPenFor">Tanggal Mulai s/d Tanggal Akhir<b style="color: red">*</b></label>
                            <asp:RegularExpressionValidator ID="regcaladdTglAwalPngKer" ControlToValidate="addTglAwalPngKer" ValidationGroup="valAddPngKer" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="regaddTglAkhirPngKer" ControlToValidate="addTglAkhirPngKer" ValidationGroup="valAddPngKer" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>

                            <div class="input-group input-daterange">
                                <asp:TextBox runat="server" ID="addTglAwalPngKer" CssClass="form-control" ValidationGroup="valAddPngKer" MaxLength="10"></asp:TextBox>
                                <div class="input-group-addon">s/d</div>
                                <asp:TextBox runat="server" ID="addTglAkhirPngKer" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender runat="server" ID="caladdTglAwalPngKer" TargetControlID="addTglAwalPngKer" Format="yyyy-MM-dd" CssClass="cal_Theme1" />
                                <ajaxToolkit:CalendarExtender runat="server" ID="caladdTglAkhirPngKer" TargetControlID="addTglAkhirPngKer" Format="yyyy-MM-dd" CssClass="cal_Theme1" />

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addGajiPngKer">Gaji</label>
                            <div class="input-group">
                                <span class="input-group-addon">Rp</span>
                                <asp:TextBox runat="server" onkeyup="format(this);" onkeypress="return isNumberKey(event);" ID="addGajiPngKer" CssClass="form-control" MaxLength="50"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addAlasanPindahPngKer">Pekerjaan</label>
                            <asp:TextBox runat="server" ID="addAlasanPindahPngKer" CssClass="form-control" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        &nbsp;
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addGambaranSingkatPngKer">Gambaran Singkat Perusahaan</label>
                            <asp:TextBox runat="server" ID="addGambaranSingkatPngKer" TextMode="MultiLine" Rows="5" CssClass="form-control" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addKesanPerusahaanPngKer">Kesan Perusahaan</label>
                            <asp:TextBox runat="server" ID="addKesanPerusahaanPngKer" TextMode="MultiLine" Rows="5" CssClass="form-control" MaxLength="50"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliPngKer" CssClass="btn btn-secondary" OnClick="btnKembaliPngKer_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddPngKer" CssClass="btn btn-primary" ValidationGroup="valAddPngKer" OnClick="btnAddPngKer_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditPngKer" CssClass="btn btn-primary" ValidationGroup="valAddPngKer" OnClick="btnEditPngKer_Click">Update</asp:LinkButton>
    </asp:Panel>


    <asp:Panel runat="server" ID="panelRiwayatBawahan" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderRiwayatBawahan" />
            </div>
            <div class="card-block">
                <div class="row">

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaRiwBawahan">Nama<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddNamaRiwBawahan" ControlToValidate="addNamaRiwBawahan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwBawahan" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addNamaRiwBawahan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwBawahan"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addJabatanRiwBawahan">Jabatan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddJabatanRiwBawahan" ControlToValidate="addJabatanRiwBawahan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwBawahan" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addJabatanRiwBawahan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwBawahan"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addPerusahaanRiwBawahan">Perusahaan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddPerusahaanRiwBawahan" ControlToValidate="addPerusahaanRiwBawahan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwBawahan" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addPerusahaanRiwBawahan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwBawahan"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addJumlahBawahanRiwBawahan">Jumlah Bawahan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddJumlahBawahanRiwBawahan" ControlToValidate="addJumlahBawahanRiwBawahan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwBawahan" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="addJumlahBawahanRiwBawahan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwBawahan"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliRiwBawahan" CssClass="btn btn-secondary" OnClick="btnKembaliRiwBawahan_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddRiwBawahan" CssClass="btn btn-primary" ValidationGroup="valAddRiwBawahan" OnClick="btnAddRiwBawahan_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditRiwBawahan" CssClass="btn btn-primary" ValidationGroup="valAddRiwBawahan" OnClick="btnEditRiwBawahan_Click">Update</asp:LinkButton>
    </asp:Panel>

    <asp:Panel runat="server" ID="panelRefrensiPerusahaan" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderRefrensiPerusahaan" />
            </div>
            <div class="card-block">
                <div class="row">

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaRefrensiPerusahaan">Nama<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddNamaRefrensiPerusahaan" ControlToValidate="addNamaRefrensiPerusahaan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRefrensiPerusahaan" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addNamaRefrensiPerusahaan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRefrensiPerusahaan"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addPerusahaanRefrensiPerusahaan">Perusahaan</label>
                            <asp:TextBox runat="server" ID="addPerusahaanRefrensiPerusahaan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRefrensiPerusahaan"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addJabatanRefrensiPerusahaan">Jabatan</label>
                            <asp:TextBox runat="server" ID="addJabatanRefrensiPerusahaan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRefrensiPerusahaan"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNoTelpRefrensiPerusahaan">No Telp</label>
                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="addNoTelpRefrensiPerusahaan" CssClass="form-control" MaxLength="15" ValidationGroup="valAddRefrensiPerusahaan"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addHubunganRefrensiPerusahaan">Hubungan</label>
                            <asp:TextBox runat="server" ID="addHubunganRefrensiPerusahaan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRefrensiPerusahaan"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliRefrensiPerusahaan" CssClass="btn btn-secondary" OnClick="btnKembaliRefrensiPerusahaan_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddRefrensiPerusahaan" CssClass="btn btn-primary" ValidationGroup="valAddRefrensiPerusahaan" OnClick="btnAddRefrensiPerusahaan_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditRefrensiPerusahaan" CssClass="btn btn-primary" ValidationGroup="valAddRefrensiPerusahaan" OnClick="btnEditRefrensiPerusahaan_Click">Update</asp:LinkButton>
    </asp:Panel>


    <asp:Panel runat="server" ID="panelMinatPekerjaan" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderMinatPekerjaan" />
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addJenisPekMinatPekerjaan">Jenis Pekerjaan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddJenisPekMinatPekerjaan" ControlToValidate="addJenisPekMinatPekerjaan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddJenisPekerjaan" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="addJenisPekMinatPekerjaan" runat="server" CssClass="form-control">
                                <asp:ListItem Value="" Text="Pilih Jenis Pekerjaan" />
                                <asp:ListItem Value="Production" Text="Production" />
                                <asp:ListItem Value="Engineering" Text="Engineering" />
                                <asp:ListItem Value="Production Planning Control (PPC)" Text="Production Planning Control (PPC)" />
                                <asp:ListItem Value="Service / Maintenance" Text="Service / Maintenance" />
                                <asp:ListItem Value="Quality Assurance" Text="Quality Assurance" />
                                <asp:ListItem Value="Information Technology" Text="Information Technology" />
                                <asp:ListItem Value="Marketing" Text="Marketing" />
                                <asp:ListItem Value="Finance" Text="Finance" />
                                <asp:ListItem Value="Accounting" Text="Accounting" />
                                <asp:ListItem Value="HRD" Text="HRD" />
                                <asp:ListItem Value="Legal" Text="Legal" />
                                <asp:ListItem Value="Management Trainee" Text="Management Trainee" />
                                <asp:ListItem Value="Minat Lain" Text="Minat Lain" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNoUrutMinatPekerjaan">No Prioritas<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddNoUrutMinatPekerjaan" ControlToValidate="addDdlNoUrutMinatPekerjaan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddJenisPekerjaan" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="addDdlNoUrutMinatPekerjaan" runat="server" CssClass="form-control">
                                <asp:ListItem Value="" Text="Pilih No Prioritas" />
                                <asp:ListItem Value="1" Text="1" />
                                <asp:ListItem Value="2" Text="2" />
                                <asp:ListItem Value="3" Text="3" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliMinatPekerjaan" CssClass="btn btn-secondary" OnClick="btnKembaliJenisPekerjaan_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddMinatPekerjaan" CssClass="btn btn-primary" ValidationGroup="valAddJenisPekerjaan" OnClick="btnAddJenisPekerjaan_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditMinatPekerjaan" CssClass="btn btn-primary" ValidationGroup="valAddJenisPekerjaan" OnClick="btnEditJenisPekerjaan_Click">Update</asp:LinkButton>
    </asp:Panel>


    <asp:Panel runat="server" ID="panelKenalanPerusahaan" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderKenalanPerusahaan" />
            </div>
            <div class="card-block">
                <div class="row">

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaKenalanPerusahaan">Nama<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddNamaKenalanPerusahaan" ControlToValidate="addNamaKenalanPerusahaan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddKenalanPerusahaan" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addNamaKenalanPerusahaan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddKenalanPerusahaan"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addPerusahaanKenalanPerusahaan">Perusahaan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddPerusahaanKenalanPerusahaan" ControlToValidate="addPerusahaanKenalanPerusahaan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddKenalanPerusahaan" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addPerusahaanKenalanPerusahaan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddKenalanPerusahaan"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addJabatanKenalanPerusahaan">Jabatan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddJabatanKenalanPerusahaan" ControlToValidate="addJabatanKenalanPerusahaan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddKenalanPerusahaan" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addJabatanKenalanPerusahaan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddKenalanPerusahaan"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNoTelpKenalanPerusahaan">No. Telp</label>
                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="addNoTelpKenalanPerusahaan" CssClass="form-control" MaxLength="15" ValidationGroup="valAddKenalanPerusahaan"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addHubunganKenalanPerusahaan">Hubungan</label>
                            <asp:TextBox runat="server" ID="addHubunganKenalanPerusahaan" CssClass="form-control" MaxLength="50" ValidationGroup="valAddKenalanPerusahaan"></asp:TextBox>
                        </div>
                    </div>



                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliKenalanPerusahaan" CssClass="btn btn-secondary" OnClick="btnKembaliKenalanPerusahaan_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddKenalanPerusahaan" CssClass="btn btn-primary" ValidationGroup="valAddKenalanPerusahaan" OnClick="btnAddKenalanPerusahaan_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditKenalanPerusahaan" CssClass="btn btn-primary" ValidationGroup="valAddKenalanPerusahaan" OnClick="btnEditKenalanPerusahaan_Click">Update</asp:LinkButton>
    </asp:Panel>

    <asp:Panel runat="server" ID="panelKeluargaHubungi" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderKeluargaHubungi" />
            </div>
            <div class="card-block">
                <div class="row">

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaKeluargaHubungi">Nama<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqNamaKeluargaHubungi" ControlToValidate="addNamaKeluargaHubungi" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddKeluargaHubungi" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addNamaKeluargaHubungi" CssClass="form-control" MaxLength="50" ValidationGroup="valAddKeluargaHubungi"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addPerusahaanKenalanPerusahaan">No. Telp/Hp<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddNoTelpKeluargaHubungi" ControlToValidate="addNoTelpKeluargaHubungi" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddKeluargaHubungi" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" ID="addNoTelpKeluargaHubungi" CssClass="form-control" MaxLength="15" ValidationGroup="valAddKeluargaHubungi"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addHubunganKeluargaHubungi">Hubungan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddHubunganKeluargaHubungi" ControlToValidate="addHubunganKeluargaHubungi" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddKeluargaHubungi" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addHubunganKeluargaHubungi" CssClass="form-control" MaxLength="50" ValidationGroup="valAddKeluargaHubungi"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliKeluargaHubungi" CssClass="btn btn-secondary" OnClick="btnKembaliKeluargaHubungi_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddKeluargaHubungi" CssClass="btn btn-primary" ValidationGroup="valAddKeluargaHubungi" OnClick="btnAddKeluargaHubungi_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditKeluargaHubungi" CssClass="btn btn-primary" ValidationGroup="valAddKeluargaHubungi" OnClick="btnEditKeluargaHubungi_Click">Update</asp:LinkButton>
    </asp:Panel>


    <asp:Panel runat="server" ID="panelRiwayatOrganisasi" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderRiwOrganisasi" />
            </div>
            <div class="card-block">
                <div class="row">

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaRiwOrganisasi">Nama Organisasi<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddNamaRiwOrganisasi" ControlToValidate="addNamaRiwOrganisasi" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwOrganisasi" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addNamaRiwOrganisasi" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwOrganisasi"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTempatRiwOrganisasi">Tempat<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddTempatRiwOrganisasi" ControlToValidate="addTempatRiwOrganisasi" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwOrganisasi" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addTempatRiwOrganisasi" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwOrganisasi"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addJabatanRiwOrganisasi">Jabatan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddJabatanRiwOrganisasi" ControlToValidate="addJabatanRiwOrganisasi" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwOrganisasi" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addJabatanRiwOrganisasi" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwOrganisasi"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTujuanRiwOrganisasi">Tujuan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddTujuanRiwOrganisasi" ControlToValidate="addTujuanRiwOrganisasi" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwOrganisasi" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addTujuanRiwOrganisasi" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwOrganisasi"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliRiwOrganisasi" CssClass="btn btn-secondary" OnClick="btnKembaliRiwOrganisasi_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddRiwOrganisasi" CssClass="btn btn-primary" ValidationGroup="valAddRiwOrganisasi" OnClick="btnAddRiwOrganisasi_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditRiwOrganisasi" CssClass="btn btn-primary" ValidationGroup="valAddRiwOrganisasi" OnClick="btnEditRiwOrganisasi_Click">Update</asp:LinkButton>
    </asp:Panel>

    <asp:Panel runat="server" ID="panelRiwPsikotes" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderRiwPsikotes" />
            </div>
            <div class="card-block">
                <div class="row">

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addWaktuRiwPsikotes">Waktu<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddWaktuRiwPsikotes" ControlToValidate="addWaktuRiwPsikotes" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwPsikotes" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addWaktuRiwPsikotes" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwPsikotes"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTempatRiwPsikotes">Tempat<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddTempatRiwPsikotes" ControlToValidate="addTempatRiwPsikotes" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwPsikotes" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addTempatRiwPsikotes" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwPsikotes"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTujuanRiwPsikotes">Tujuan<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddTujuanRiwPsikotes" ControlToValidate="addTujuanRiwPsikotes" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwPsikotes" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addTujuanRiwPsikotes" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwPsikotes"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliRiwPsikotes" CssClass="btn btn-secondary" OnClick="btnKembaliRiwPsikotes_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddRiwPsikotes" CssClass="btn btn-primary" ValidationGroup="valAddRiwPsikotes" OnClick="btnAddRiwPsikotes_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditRiwPsikotes" CssClass="btn btn-primary" ValidationGroup="valAddRiwPsikotes" OnClick="btnEditRiwPsikotes_Click">Update</asp:LinkButton>
    </asp:Panel>

    <asp:Panel runat="server" ID="panelRiwPenyakit" Visible="false">
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" CssClass="font-weight-bold" ID="cardHeaderRiwPenyakit" />
            </div>
            <div class="card-block">
                <div class="row">

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addNamaRiwPenyakit">Nama Penyakit<b style="color: red">*</b></label>
                            <asp:RequiredFieldValidator runat="server" ID="reqaddNamaRiwPenyakit" ControlToValidate="addNamaRiwPenyakit" Text=" harus diisi" ForeColor="Red" ValidationGroup="valAddRiwPenyakit" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="addNamaRiwPenyakit" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwPenyakit"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addTglAkhirPenFor">Tanggal Mulai s/d Tanggal Akhir<b style="color: red">*</b></label>
                            <asp:RegularExpressionValidator ID="regcaladdTglAwalRiwPenyakit" ControlToValidate="addTglAwalRiwPenyakit" ValidationGroup="valAddRiwPenyakit" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="regaddTglAkhirRiwPenyakit" ControlToValidate="addTglAkhirRiwPenyakit" ValidationGroup="valAddRiwPenyakit" ForeColor="Red" runat="server" ErrorMessage=" format tidak sesuai" ValidationExpression="^\d{4}-((0\d)|(1[012]))-(([012]\d)|3[01])$"></asp:RegularExpressionValidator>
                            <div class="input-group input-daterange">
                                <asp:TextBox runat="server" ID="addTglAwalRiwPenyakit" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwPenyakit"></asp:TextBox>
                                <div class="input-group-addon">s/d</div>
                                <asp:TextBox runat="server" ID="addTglAkhirRiwPenyakit" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwPenyakit"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender runat="server" ID="caladdTglAwalRiwPenyakit" TargetControlID="addTglAwalRiwPenyakit" Format="yyyy-MM-dd" CssClass="cal_Theme1" />
                                <ajaxToolkit:CalendarExtender runat="server" ID="caladdTglAkhirRiwPenyakit" TargetControlID="addTglAkhirRiwPenyakit" Format="yyyy-MM-dd" CssClass="cal_Theme1" />
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label style='font-weight: bold;' for="addAkibatRiwPenyakit">Tujuan</label>
                            <asp:TextBox runat="server" ID="addAkibatRiwPenyakit" CssClass="form-control" MaxLength="50" ValidationGroup="valAddRiwPenyakit"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <asp:LinkButton runat="server" ID="btnKembaliRiwPenyakit" CssClass="btn btn-secondary" OnClick="btnKembaliRiwPenyakit_Click">Kembali</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnAddRiwPenyakit" CssClass="btn btn-primary" ValidationGroup="valAddRiwPenyakit" OnClick="btnAddRiwPenyakit_Click">Tambah</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnEditRiwPenyakit" CssClass="btn btn-primary" ValidationGroup="valAddRiwPenyakit" OnClick="btnEditRiwPenyakit_Click">Update</asp:LinkButton>
    </asp:Panel>

    <asp:Panel runat="server" ID="panelSatuIdentitas" Visible="false">
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
                                                            <asp:FileUpload runat="server" ValidationGroup="valSatuIdentitas" ID="txtFoto" Style="min-width: 100%; border: solid 1px #CCC; padding: 5px;" ClientIDMode="Static" onchange="cekImage(this, 'Foto');previewFile();" />
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
                                            <%--<asp:RequiredFieldValidator runat="server" ID="reqtxtNamaBank" ControlToValidate="txtNamaBank" Text=" harus diisi" ForeColor="Red" ValidationGroup="valSatuIdentitas" Display="Dynamic"></asp:RequiredFieldValidator>--%>
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
        <asp:LinkButton runat="server" ID="btnNextSatuIdentitas" CssClass="btn btn-primary" ValidationGroup="valSatuIdentitas" OnClick="btnNextSatuIdentitas_Click">Selanjutnya <i class="fa fa-arrow-right" aria-hidden="true"></i></asp:LinkButton>
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
                                <asp:LinkButton runat="server" ID="linkAddPenFor" CssClass="btn btn-primary" OnClick="linkAddPenFor_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>
                                <div class="col-lg-12">
                                    &nbsp;
                                </div>
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
                                                OnPageIndexChanging="gridDataPendidikanFormal_PageIndexChanging"
                                                OnRowCommand="gridDataPendidikanFormal_RowCommand"
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
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

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
                                        <asp:LinkButton runat="server" ID="linkAddPenNonFor" CssClass="btn btn-primary" OnClick="linkAddPenNonFor_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>
                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataPendidikanNonFormal_PageIndexChanging"
                                                OnRowCommand="gridDataPendidikanNonFormal_RowCommand"
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
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                         <asp:LinkButton runat="server" ID="linkAddBahasa" CssClass="btn btn-primary" OnClick="linkAddBahasa_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>
                                     </div>
                                     <div class="col-lg-12">
                                         &nbsp;
                                     </div>
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
                                                 OnPageIndexChanging="gridDataBahasa_PageIndexChanging"
                                                 OnRowCommand="gridDataBahasa_RowCommand"
                                                 DataKeyNames="bhs_id">
                                                 <Columns>
                                                     <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="bhs_bahasa" HeaderText="Bahasa" NullDisplayText="-" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" />
                                                     <asp:BoundField DataField="bhs_lisan" HeaderText="Lisan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                     <asp:BoundField DataField="bhs_tertulis" HeaderText="Tertulis" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                     <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                         <ItemTemplate>
                                                             <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                             <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                                         </ItemTemplate>
                                                     </asp:TemplateField>
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
        <asp:LinkButton runat="server" ID="btnPrevDuaPendidikan" CssClass="btn btn-primary" OnClick="btnPrevDuaPendidikan_Click"><i class="fa fa-arrow-left" aria-hidden="true"></i> Sebelumnya</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnNextDuaPendidikan" CssClass="btn btn-primary" OnClick="btnNextDuaPendidikan_Click">Selanjutnya <i class="fa fa-arrow-right" aria-hidden="true"></i></asp:LinkButton>
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
                                    <div class="col-lg-3">

                                        <div class="form-group">
                                            <asp:RadioButtonList CssClass="form-control" ID="rbStatusPernikahan" runat="server">
                                                <asp:ListItem Value="Single/Tungangan"> Single/Tungangan </asp:ListItem>
                                                <asp:ListItem Value="Menikah"> Menikah </asp:ListItem>
                                                <asp:ListItem Value="Bercerai"> Bercerai </asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>

                                    </div>
                                    <div class="col-lg-9">
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
                                        <asp:LinkButton runat="server" ID="linkAddKeluargaSendiri" CssClass="btn btn-primary" OnClick="linkAddKeluargaSendiri_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>

                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataKeluargaSendiri_PageIndexChanging"
                                                OnRowCommand="gridDataKeluargaSendiri_RowCommand"
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
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                        <asp:LinkButton runat="server" ID="linkAddKeluargaOrtu" CssClass="btn btn-primary" OnClick="linkAddKeluargaOrtu_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>
                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataKeluargaOrtu_PageIndexChanging"
                                                OnRowCommand="gridDataKeluargaOrtu_RowCommand"
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
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>

                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
        <asp:LinkButton runat="server" ID="btnPrevTigaLingKeluarga" ValidationGroup="valDuaLingKel" CssClass="btn btn-primary" OnClick="btnPrevTigaLingKeluarga_Click"><i class="fa fa-arrow-left" aria-hidden="true"></i> Sebelumnya</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnNextTigaLingKeluarga" ValidationGroup="valDuaLingKel" CssClass="btn btn-primary" OnClick="btnNextTigaLingKeluarga_Click">Selanjutnya <i class="fa fa-arrow-right" aria-hidden="true"></i></asp:LinkButton>
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
                                        <asp:LinkButton runat="server" ID="linkAddPengalamanKerja" CssClass="btn btn-primary" OnClick="linkAddPengalamanKerja_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>
                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataRiwayatPekerjaan_PageIndexChanging"
                                                OnRowCommand="gridDataRiwayatPekerjaan_RowCommand"
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
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                        <asp:LinkButton runat="server" ID="linkAddRiwayatBawahan" CssClass="btn btn-primary" OnClick="linkAddRiwayatBawahan_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>
                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataRiwayatAtasan_PageIndexChanging"
                                                OnRowCommand="gridDataRiwayatAtasan_RowCommand"
                                                DataKeyNames="rab_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rab_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rab_jabatan" HeaderText="Jabatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rab_perusahaan" HeaderText="Perusahaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rab_jumlah_bawahan" HeaderText="Jumlah Bawahan Anda" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <asp:RadioButtonList CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="rbMelakukanPerubahan_SelectedIndexChanged" ID="rbMelakukanPerubahan" runat="server">
                                                <asp:ListItem Value="Ya"> Ya</asp:ListItem>
                                                <asp:ListItem Value="Tidak"> Tidak</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
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
        <asp:LinkButton runat="server" ID="btnPrevEmpatRiwayatPekerjaan" CssClass="btn btn-primary" OnClick="btnPrevEmpatRiwayatPekerjaan_Click"><i class="fa fa-arrow-left" aria-hidden="true"></i> Sebelumnya</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnNextEmpatRiwayatPekerjaan" CssClass="btn btn-primary" OnClick="btnNextEmpatRiwayatPekerjaan_Click">Selanjutnya <i class="fa fa-arrow-right" aria-hidden="true"></i></asp:LinkButton>
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
                                <asp:Label runat="server" Font-Bold="true">4. Sebutkan Gaji yang anda inginkan ?<b style="color: red">*</b> </asp:Label>
                                <asp:RequiredFieldValidator runat="server" ID="reqtxtGajiHarapan" ControlToValidate="txtGajiHarapan" Text=" harus diisi" ForeColor="Red" ValidationGroup="valGaji" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regtxtGajiHarapan" runat="server"
                                    ControlToValidate="txtGajiHarapan"
                                    ErrorMessage="Only numeric allowed." ForeColor="Red"
                                    ValidationExpression="^\d+(\.\d+)*$" ValidationGroup="valGaji" Text=" harus nomor">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">Rp</span>
                                                <asp:TextBox runat="server" MaxLength="10" onkeyup="format(this);" onkeypress="return isNumberKey(event);" ID="txtGajiHarapan" ValidationGroup="valGaji" CssClass="form-control"></asp:TextBox>
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
                                        <asp:LinkButton runat="server" ID="linkAddMinatPekerjaan" CssClass="btn btn-primary" OnClick="linkAddMinatPekerjaan_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>
                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataMinatPekerjaan_PageIndexChanging"
                                                OnRowCommand="gridDataMinatPekerjaan_RowCommand"
                                                DataKeyNames="mpe_id">
                                                <Columns>
                                                    <asp:BoundField DataField="mpe_jenispekerjaan" HeaderText="Jenis Pekerjaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="mpe_no_urut" HeaderText="No Urut" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <asp:RadioButtonList CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="rbLingkunganKerjaSenang_SelectedIndexChanged" ID="rbLingkunganKerjaSenang" runat="server">
                                                <asp:ListItem Value="Lapangan"> Lapangan</asp:ListItem>
                                                <asp:ListItem Value="Kantor"> Kantor</asp:ListItem>
                                                <asp:ListItem Value="Pabrik"> Pabrik</asp:ListItem>
                                                <asp:ListItem Value="Lain-lain"> Lain-lain</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
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
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <asp:RadioButtonList CssClass="form-control" ID="rbSediaLuarDaerah" runat="server">
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
        <asp:LinkButton runat="server" ID="btnPrevLimaMinatKonsepPribadi" CssClass="btn btn-primary" OnClick="btnPrevLimaMinatKonsepPribadi_Click"><i class="fa fa-arrow-left" aria-hidden="true"></i> Sebelumnya</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnNextLimaMinatKonsepPribadi" CssClass="btn btn-primary" OnClick="btnNextLimaMinatKonsepPribadi_Click" ValidationGroup="valGaji">Selanjutnya <i class="fa fa-arrow-right" aria-hidden="true"></i></asp:LinkButton>
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
                                <asp:Label runat="server" Font-Bold="true">1. Ada Kenalan di Perusahaan kami ? (Isi jika ada) </asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:RadioButtonList AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="rbAdaKenalan_SelectedIndexChanged" ID="rbAdaKenalan" runat="server">
                                            <asp:ListItem Value="Ya"> Ya</asp:ListItem>
                                            <asp:ListItem Value="Tidak"> Tidak</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
                                    <div class="col-lg-12">
                                        <asp:LinkButton runat="server" ID="linkAddKenalanPerusahaan" CssClass="btn btn-primary" OnClick="linkAddKenalanPerusahaan_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>
                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
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
                                                OnPageIndexChanging="gridDataKenalanPerusahaan_PageIndexChanging"
                                                OnRowCommand="gridDataKenalanPerusahaan_RowCommand"
                                                DataKeyNames="kpe_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="kpe_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="kpe_perusahaan" HeaderText="Perusahaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="kpe_jabatan" HeaderText="Jabatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="kpe_no_telp" HeaderText="No.Telp" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="kpe_hubungan" HeaderText="Hubungan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                <asp:Label runat="server" Font-Bold="true">2. No telepon keluarga/teman yang dapat dihubungi (minimal 1):<b style="color: red">*</b></asp:Label>
                            </div>
                            <div class="card-block">
                                <div class="row">

                                    <div class="col-lg-12">
                                        <asp:LinkButton runat="server" ID="linkAddKeluargaHubungi" CssClass="btn btn-primary" OnClick="linkAddKeluargaHubungi_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>

                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataKeluargaHubungi_PageIndexChanging"
                                                OnRowCommand="gridDataKeluargaHubungi_RowCommand"
                                                DataKeyNames="dkh_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="dkh_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="dkh_no_telp" HeaderText="No Telp/HP" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="dkh_hubungan" HeaderText="Hubungan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                        <asp:LinkButton runat="server" ID="linkAddRefrensiPerusahaan" CssClass="btn btn-primary" OnClick="linkAddRefrensiPerusahaan_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>

                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataRefrensiPerusahaan_PageIndexChanging"
                                                OnRowCommand="gridDataRefrensiPerusahaan_RowCommand"
                                                DataKeyNames="rfp_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rfp_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rfp_perusahaan" HeaderText="Perusahaan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rfp_jabatan" HeaderText="Jabatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rfp_no_telp" HeaderText="No Telp" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rfp_hubungan" HeaderText="Hubungan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                        <asp:LinkButton runat="server" ID="linkAddOrganisasi" CssClass="btn btn-primary" OnClick="linkAddOrganisasi_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>

                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataRiwayatOrganisasi_PageIndexChanging"
                                                OnRowCommand="gridDataRiwayatOrganisasi_RowCommand"
                                                DataKeyNames="rog_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rog_nama_organisasi" HeaderText="Nama Organisasi" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rog_tempat" HeaderText="Tempat" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rog_jabatan" HeaderText="Jabatan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rog_tujuan" HeaderText="Tujuan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
        <asp:LinkButton runat="server" ID="btnPrevEnamAktivitasSosial" CssClass="btn btn-primary" OnClick="btnPrevEnamAktivitasSosial_Click"><i class="fa fa-arrow-left" aria-hidden="true"></i> Sebelumnya</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnNextEnamAktivitasSosial" CssClass="btn btn-primary" OnClick="btnNextEnamAktivitasSosial_Click">Selanjutnya <i class="fa fa-arrow-right" aria-hidden="true"></i></asp:LinkButton>
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
                                        <asp:LinkButton runat="server" ID="linkAddRiwPsikotes" CssClass="btn btn-primary" OnClick="linkAddRiwPsikotes_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>

                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataRiwayatPsikotes_PageIndexChanging"
                                                OnRowCommand="gridDataRiwayatPsikotes_RowCommand"
                                                DataKeyNames="rps_id">
                                                <Columns>
                                                    <asp:BoundField DataField="rownum" ItemStyle-Width="75px" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rps_waktu" HeaderText="Waktu" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rps_tempat" HeaderText="Tempat" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:BoundField DataField="rps_tujuan" HeaderText="Tujuan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                        <asp:LinkButton runat="server" ID="linkAddRiwPenyakit" CssClass="btn btn-primary" OnClick="linkAddRiwPenyakit_Click"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;Tambah Baru</asp:LinkButton>
                                    </div>
                                    <div class="col-lg-12">
                                        &nbsp;
                                    </div>
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
                                                OnPageIndexChanging="gridDataRiwayatPenyakit_PageIndexChanging"
                                                OnRowCommand="gridDataRiwayatPenyakit_RowCommand"
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
                                                    <asp:TemplateField HeaderText="Aksi" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkDelete" CommandName="Hapus" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Hapus"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="linkEdit" CommandName="Ubah" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' rel="tooltip" Visible="true" data-placement="bottom" title="Ubah"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
        <asp:LinkButton runat="server" ID="btnPrevTujuhLainLain" CssClass="btn btn-primary" OnClick="btnPrevTujuhLainLain_Click"><i class="fa fa-arrow-left" aria-hidden="true"></i> Sebelumnya</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnFinalTujuhLainLain" CssClass="btn btn-success finalModal" data-toggle="modal" data-target="#finalModal">Kirim Lamaran <i class="fa fa-paper-plane" aria-hidden="true"></i></asp:LinkButton>
    </asp:Panel>

    <div class="modal fade" id="finalModal" tabindex="-1" role="dialog" aria-labelledby="finalModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="finalModalLabel">Kirim Formulir Lamaran</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <b>Formulir yang sudah dikirim tidak akan bisa diubah kembali.</b>
                    <br />
                    <br />
                    Apakah Anda yakin untuk mengirim formulir lamaran anda?
                </div>
                <div class="modal-footer">
                    <asp:TextBox runat="server" ID="txtConfirmFinal" CssClass="hidden-xs-up" ClientIDMode="Static"></asp:TextBox>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <asp:LinkButton runat="server" ID="linkConfirmFinal" CssClass="btn btn-success" Text="Kirim Lamaran" OnClick="btnFinalTujuhLainLain_Click" OnClientClick="sentValidation(this);"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $('.dropdown-menu').click(function (event) {
            event.stopPropagation();
        });

        $('#editModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var data = button.data('id')
            var header = button.data('header')
            var pertanyaan = button.data('pertanyaan')
            var modal = $(this)
            modal.find('.modal-footer #txtConfirmEdit').val(data)
            if (header == 'Ya') {
                modal.find('.modal-body #editHeader').attr('checked', 'checked');
            }
            else {
                modal.find('.modal-body #editHeader').removeAttr('checked');
            }
            modal.find('.modal-body #editPertanyaan').val(pertanyaan)
        })

        $('#finalModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var data = button.data('template')
            var modal = $(this)
            modal.find('.modal-footer #txtConfirmFinal').val(data)
        })

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 46 || charCode > 57)) {
                return false;
            } return true;
        }

        function previewFile() {
            var preview = document.querySelector('#<%=Avatar.ClientID %>');
            var file = document.querySelector('#<%=txtFoto.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "Images/IMG_NoImageHuman.png";
            }
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
                alert("Opps! Berkas terlalu besar! Ukuran maksimal berkas yang bisa dikirim adalah 5 MB");
                valid = false;
            }
            var a = input.value.split(".").pop();
            if (a.toLowerCase() != "jpg" && a.toLowerCase() != "png") {
                alert("Opps! Format berkas yang dibolehkan adalah .jpg, atau .png");
                valid = false;
            }
            if (!valid) {
                param.value = "";
            }
        }


        $(document).ready(function () {
            $("a.grouped_elements").fancybox();
        });

        tinymce.init({
            selector: '#addKritikSaran',
            height: 150,
            menubar: false,
            plugins: [
                'advlist autolink lists link image charmap print preview anchor',
                'searchreplace visualblocks code fullscreen',
                'insertdatetime media table contextmenu paste code'
            ],
            toolbar: 'bold | italic | alignleft alignright alignjustify | bullist numlist'
        });
    </script>

</asp:Content>
