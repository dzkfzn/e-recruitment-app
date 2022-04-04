<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Operasional_Akademik_Admin_SIA.ascx.cs" Inherits="New_SIA.Dashboard.Operasional_Akademik_Admin_SIA" EnableViewState="true" %>

<asp:UpdatePanel runat="server" ID="updatePanel1">
    <ContentTemplate>
        <div class="card" runat="server" id="dashboardKetercapaian">
            <div class="card-header">
                <asp:Label runat="server" ID="lblDashboardKetercapaian" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-block">
                <br />
                <div class="row" runat="server" id="rowKetercapaian">
                    <div class="col-lg-6">
                        <div id="container-ketercapaianpertemuan" style="width: 100%; height: 200px;"></div>
                    </div>
                    <div class="col-lg-6">
                        <div id="container-ketercapaianmateri" style="width: 100%; height: 200px;"></div>
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

        <div class="card" runat="server" id="dashboardKehadiranMahasiswa">
            <div class="card-header">
                <asp:Label runat="server" ID="lblDashboardKehadiranMahasiswa" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-block">
                <br />
                <div class="row" runat="server" id="rowKehadiranMahasiswa">
                    <div class="col-lg-4">
                        <div id="container-kehadiranmahasiswatingkat1" style="width: 100%; height: 200px;"></div>
                    </div>
                    <div class="col-lg-4">
                        <div id="container-kehadiranmahasiswatingkat2" style="width: 100%; height: 200px;"></div>
                    </div>
                    <div class="col-lg-4">
                        <div id="container-kehadiranmahasiswatingkat3" style="width: 100%; height: 200px;"></div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div style="text-align: center;">
                            <asp:LinkButton runat="server" ID="btnDetailKehadiranMahasiswaShow" CssClass="btn btn-primary" OnClick="btnDetailKehadiranMahasiswaShow_Click"><i class="fa fa-eye"></i>&nbsp;Tampilkan Detil</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnDetailKehadiranMahasiswaHide" CssClass="btn btn-danger" OnClick="btnDetailKehadiranMahasiswaHide_Click" Visible="false"><i class="fa fa-eye-slash"></i>&nbsp;Sembunyikan Detil</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div runat="server" id="divKehadiranMahasiswa" visible="false">
                            <asp:Panel runat="server" ID="panelDataKehadiranMahasiswa" DefaultButton="linkCariKehadiranMahasiswa">
                                <br />
                                <div class="input-group">
                                    <input runat="server" type="text" class="form-control" id="txtCariKehadiranMahasiswa" placeholder="Pencarian" clientidmode="static">
                                    <span class="input-group-btn">
                                        <asp:LinkButton runat="server" ID="linkCariKehadiranMahasiswa" CssClass="btn btn-secondary" OnClick="linkCariKehadiranMahasiswa_Click"><i class="fa fa-search"></i>&nbsp;Cari</asp:LinkButton>
                                    </span>
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-filter"></i>&nbsp;Filter</button>
                                        <div class="dropdown-menu dropdown-menu-right" style="padding: 20px; min-width: 300px !important;">
                                            <div class="form-group">
                                                <label style='font-weight: bold;' for="ddUrutKehadiranMahasiswa">Urut Berdasarkan</label>
                                                <asp:DropDownList runat="server" ID="ddUrutKehadiranMahasiswa" CssClass="form-control dropdown" Style="min-width: 260px !important;"></asp:DropDownList>
                                            </div>
                                            <div class="form-group" runat="server" id="divKonsentrasiKehadiranMahasiswa">
                                                <label style='font-weight: bold;' for="ddKonsentrasiKehadiranMahasiswa">Program Studi</label>
                                                <asp:DropDownList runat="server" ID="ddKonsentrasiKehadiranMahasiswa" CssClass="form-control dropdown" Style="min-width: 260px !important;"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label style='font-weight: bold;' for="ddTahunAjaranKehadiranMahasiswa">Tahun Akademik</label>
                                                <asp:DropDownList runat="server" ID="ddTahunAjaranKehadiranMahasiswa" CssClass="form-control dropdown" Style="min-width: 260px !important;"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label style='font-weight: bold;' for="ddTingkatKehadiranMahasiswa">Tingkat</label>
                                                <asp:DropDownList runat="server" ID="ddTingkatKehadiranMahasiswa" CssClass="form-control dropdown" Style="min-width: 260px !important;">
                                                    <asp:ListItem Text="-- Semua --" Value=""></asp:ListItem>
                                                    <asp:ListItem Text="Tingkat 1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Tingkat 2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Tingkat 3" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </span>
                                </div>

                                <br />

                                <div class="scrollstyle" style="overflow-x: auto;">
                                    <asp:GridView runat="server" ID="gridDataKehadiranMahasiswa" CssClass="table table-hover table-bordered table-condensed table-striped grid" AllowPaging="true"
                                        AllowSorting="false" AutoGenerateColumns="false" DataKeyNames="rownum" EmptyDataText="Tidak ada data" PageSize="10" PagerStyle-CssClass="pagination-ys"
                                        ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridDataKehadiranMahasiswa_PageIndexChanging">
                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                                        <Columns>
                                            <asp:BoundField DataField="rownum" HeaderText="No" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                            <asp:BoundField DataField="kon_singkatan" HeaderText="Prodi" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                            <asp:BoundField DataField="kel_tingkat" HeaderText="Tingkat" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                            <asp:BoundField DataField="mhs_id" HeaderText="NIM" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                            <asp:BoundField DataField="mhs_nama" HeaderText="Nama" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="percent_hadir" HeaderText="Rata-Rata Kehadiran" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                                <asp:LinkButton runat="server" ID="btnExportKehadiranMahasiswa" CssClass="btn btn-primary" Style="float: right;" OnClick="btnExportKehadiranMahasiswa_Click"><i class="fa fa-download"></i>&nbsp;Expor Detil ke Excel</asp:LinkButton>
                            </asp:Panel>
                        </div>
                        <br />
                        * Mahasiswa tingkat 2 Program Studi MO (TAB) dan MO (TO) sedang melakukan OJT
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnExportKetercapaian" />
        <asp:PostBackTrigger ControlID="btnExportKehadiranMahasiswa" />
    </Triggers>
</asp:UpdatePanel>

<script type="text/javascript">
    var valueA, valueB;
    var valueC, valueD, valueE;
    var valueListKonsentrasi;

    function setValueKetercapaian(param1, param2) {
        valueA = param1;
        valueB = param2;
        renderKetercapaian();
    }

    function setValueKehadiranMahasiswa(param1, param2, param3) {
        valueC = param1;
        valueD = param2;
        valueE = param3;
        renderKehadiranMahasiswa();
    }

    function renderKetercapaian() {
        var gaugeOptions = {
            chart: {
                type: 'solidgauge'
            },

            title: null,

            pane: {
                center: ['50%', '85%'],
                size: '140%',
                startAngle: -90,
                endAngle: 90,
                background: {
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },

            tooltip: {
                enabled: false
            },

            yAxis: {
                stops: [
                    [0, '#FF0000'],
                    [0.7, '#FFFF44'],
                    [1, '#00FF00']
                ],
                lineWidth: 0,
                minorTickInterval: null,
                tickAmount: 2,
                title: {
                    y: -80
                },
                labels: {
                    y: 16
                }
            },

            plotOptions: {
                solidgauge: {
                    size: '100%',
                    dataLabels: {
                        y: 5,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            }
        };

        var ketercapaianpertemuan = Highcharts.chart('container-ketercapaianpertemuan', Highcharts.merge(gaugeOptions, {
            yAxis: {
                min: 0,
                max: 100,
                title: {
                    text: 'Rata-rata Ketercapaian Pertemuan'
                }
            },

            credits: {
                enabled: false
            },

            series: [{
                name: 'Ketercapaian Pertemuan',
                data: [valueA],
                dataLabels: {
                    format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                        ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y} %</span></div>'
                },
                tooltip: {
                    valueSuffix: '%'
                }
            }]

        }));

        var ketercapaianmateri = Highcharts.chart('container-ketercapaianmateri', Highcharts.merge(gaugeOptions, {
            yAxis: {
                min: 0,
                max: 100,
                title: {
                    text: 'Rata-rata Ketercapaian Materi'
                }
            },

            credits: {
                enabled: false
            },

            series: [{
                name: 'Ketercapaian Materi',
                data: [valueB],
                dataLabels: {
                    format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                        ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y} %</span></div>'
                },
                tooltip: {
                    valueSuffix: '%'
                }
            }]
        }));
    }

    function renderKehadiranMahasiswa() {
        var gaugeOptions = {
            chart: {
                type: 'solidgauge'
            },

            title: null,

            pane: {
                center: ['50%', '85%'],
                size: '140%',
                startAngle: -90,
                endAngle: 90,
                background: {
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },

            tooltip: {
                enabled: false
            },

            yAxis: {
                stops: [
                    [0, '#FF0000'],
                    [0.7, '#FFFF44'],
                    [1, '#00FF00']
                ],
                lineWidth: 0,
                minorTickInterval: null,
                tickAmount: 2,
                title: {
                    y: -80
                },
                labels: {
                    y: 16
                }
            },

            plotOptions: {
                solidgauge: {
                    size: '100%',
                    dataLabels: {
                        y: 5,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            }
        };

        var kehadiranmahasiswatingkat1 = Highcharts.chart('container-kehadiranmahasiswatingkat1', Highcharts.merge(gaugeOptions, {
            yAxis: {
                min: 0,
                max: 100,
                title: {
                    text: 'Rata-rata Kehadiran Mahasiswa Tingkat 1'
                }
            },

            credits: {
                enabled: false
            },

            series: [{
                name: 'Kehadiran Mahasiswa Tingkat 1',
                data: [valueC],
                dataLabels: {
                    format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                        ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y} %</span></div>'
                },
                tooltip: {
                    valueSuffix: '%'
                }
            }]

        }));

        var kehadiranmahasiswatingkat2 = Highcharts.chart('container-kehadiranmahasiswatingkat2', Highcharts.merge(gaugeOptions, {
            yAxis: {
                min: 0,
                max: 100,
                title: {
                    text: 'Rata-rata Kehadiran Mahasiswa Tingkat 2'
                }
            },

            credits: {
                enabled: false
            },

            series: [{
                name: 'Kehadiran Mahasiswa Tingkat 2',
                data: [valueD],
                dataLabels: {
                    format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                        ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y} %</span></div>'
                },
                tooltip: {
                    valueSuffix: '%'
                }
            }]

        }));

        var kehadiranmahasiswatingkat3 = Highcharts.chart('container-kehadiranmahasiswatingkat3', Highcharts.merge(gaugeOptions, {
            yAxis: {
                min: 0,
                max: 100,
                title: {
                    text: 'Rata-rata Kehadiran Mahasiswa Tingkat 3'
                }
            },

            credits: {
                enabled: false
            },

            series: [{
                name: 'Kehadiran Mahasiswa Tingkat 3',
                data: [valueE],
                dataLabels: {
                    format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                        ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y} %</span></div>'
                },
                tooltip: {
                    valueSuffix: '%'
                }
            }]

        }));
    }
</script>
