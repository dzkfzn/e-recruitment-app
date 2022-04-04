<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Operasional_Akademik_Admin_Jam_Minus.ascx.cs" Inherits="New_SIA.Dashboard.Operasional_Akademik_Admin_Jam_Minus" %>

<asp:UpdatePanel runat="server" ID="updatePanel1">
    <ContentTemplate>
        <div class="card" runat="server" id="dashboardKetercapaian">
            <div class="card-header">
                <asp:Label runat="server" ID="lblDashboardKetercapaian" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-block">
                <br />
                <div class="row justify-content-center" runat="server" id="rowKetercapaianWadir">
                    <div class="col-lg-12">
                        <div id="container-ketercapaianwadir" style="width: 100%; height: 350px;"></div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div style="text-align: center;">
                            <asp:LinkButton runat="server" ID="btnDetailKetercapaianShow" CssClass="btn btn-primary" OnClick="btnDetailKetercapaianShow_Click"><i class="fa fa-eye"></i>&nbsp;Tampilkan Detil</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnDetailKetercapaianHide" CssClass="btn btn-danger" OnClick="btnDetailKetercapaianHide_Click" Visible="false"><i class="fa fa-eye-slash"></i>&nbsp;Sembunyikan Detil</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div runat="server" id="divKetercapaian" visible="false">
                            <asp:Panel runat="server" ID="panelDataKetercapaian" DefaultButton="linkCariKetercapaian">
                                <br />
                                <div class="input-group">
                                    <input runat="server" type="text" class="form-control" id="txtCariKetercapaian" placeholder="Pencarian" clientidmode="static">
                                    <span class="input-group-btn">
                                        <asp:LinkButton runat="server" ID="linkCariKetercapaian" CssClass="btn btn-secondary" OnClick="linkCariKetercapaian_Click"><i class="fa fa-search"></i>&nbsp;Cari</asp:LinkButton>
                                    </span>
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-filter"></i>&nbsp;Filter</button>
                                        <div class="dropdown-menu dropdown-menu-right" style="padding: 20px; min-width: 300px !important;">
                                            <div class="form-group">
                                                <label style='font-weight: bold;' for="ddUrutKetercapaian">Urut Berdasarkan</label>
                                                <asp:DropDownList runat="server" ID="ddUrutKetercapaian" CssClass="form-control dropdown" Style="min-width: 260px !important;"></asp:DropDownList>
                                            </div>
                                            <div class="form-group" runat="server" id="divKonsentrasiKetercapaian">
                                                <label style='font-weight: bold;' for="ddKonsentrasiKetercapaian">Program Studi</label>
                                                <asp:DropDownList runat="server" ID="ddKonsentrasiKetercapaian" CssClass="form-control dropdown" Style="min-width: 260px !important;"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label style='font-weight: bold;' for="ddTahunAjaranKetercapaian">Tahun Akademik</label>
                                                <asp:DropDownList runat="server" ID="ddTahunAjaranKetercapaian" CssClass="form-control dropdown" Style="min-width: 260px !important;"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label style='font-weight: bold;' for="ddSemesterKetercapaian">Semester</label>
                                                <asp:DropDownList runat="server" ID="ddSemesterKetercapaian" CssClass="form-control dropdown" Style="min-width: 260px !important;">
                                                    <asp:ListItem Text="-- Semua --" Value=""></asp:ListItem>
                                                    <asp:ListItem Text="Semester 1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Semester 2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Semester 3" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Semester 4" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Semester 5" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="Semester 6" Value="6"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </span>
                                </div>

                                <br />

                                <div class="scrollstyle" style="overflow-x: auto;">
                                    <asp:GridView runat="server" ID="gridDataKetercapaian" CssClass="table table-hover table-bordered table-condensed table-striped grid" AllowPaging="true"
                                        AllowSorting="false" AutoGenerateColumns="false" DataKeyNames="rownum" EmptyDataText="Tidak ada data" PageSize="10" PagerStyle-CssClass="pagination-ys"
                                        ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridDataKetercapaian_PageIndexChanging">
                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                                        <Columns>
                                            <asp:BoundField DataField="rownum" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                            <asp:BoundField DataField="kon_singkatan" HeaderText="Prodi" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                            <asp:BoundField DataField="mku_semester" HeaderText="Semester" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="mku_nama" HeaderText="Mata Kuliah" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="dos_nama1" HeaderText="Dosen 1" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="dos_nama2" HeaderText="Dosen 2" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="capaian_pertemuan" HeaderText="Ketercapaian Pertemuan" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                            <asp:BoundField DataField="capaian_materi" HeaderText="Ketercapaian Materi" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                                <asp:LinkButton runat="server" ID="btnExportKetercapaian" CssClass="btn btn-primary" Style="float: right;" OnClick="btnExportKetercapaian_Click"><i class="fa fa-download"></i>&nbsp;Expor Detil ke Excel</asp:LinkButton>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnExportKetercapaian" />
    </Triggers>
</asp:UpdatePanel>

<script type="text/javascript">
    var valueListKonsentrasi;
    var valueAWadir, valueBWadir

    function setValueKetercapaianWadir(param1, param2, param3) {
        valueAWadir = param1;
        valueBWadir = param2;
        valueListKonsentrasi = param3;
        renderKetercapaianWadir();
    }

    function renderKetercapaianWadir() {
        var ketercapaianpertemuanwadir = Highcharts.chart('container-ketercapaianwadir', {
            chart: {
                type: 'column'
            },

            title: {
                text: ''
            },

            subtitle: {
                text: 'Rata-Rata Ketercapaian Pertemuan dan Materi'
            },

            credits: {
                enabled: false
            },

            xAxis: {
                categories: valueListKonsentrasi,
                crosshair: true
            },

            yAxis: {
                min: 0,
                max: 100,
                title: {
                    text: ''
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:13px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} %</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },

            plotOptions: {
                column: {
                    pointPadding: 0,
                    borderWidth: 0
                }
            },

            series: [{
                name: 'Prosentase Ketercapaian Pertemuan',
                data: valueAWadir,
                showInLegend: true
            },
            {
                name: 'Prosentase Ketercapaian Materi',
                data: valueBWadir,
                showInLegend: true
            }]
        });
    }
</script>
