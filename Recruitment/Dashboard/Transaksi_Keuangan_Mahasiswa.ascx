<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Transaksi_Keuangan_Mahasiswa.ascx.cs" Inherits="New_SIA.Dashboard.Transaksi_Keuangan_Mahasiswa" %>

<asp:UpdatePanel runat="server" ID="updatePanel1">
    <ContentTemplate>
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" ID="lblTitleTransaksiMahasiswa" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-5">
                        <div id="chartTransaksiMahasiswa" style="width: 100%; height: 400px;"></div>
                    </div>
                    <div class="col-lg-7">
                        <div class="scrollstyle" style="overflow-x: auto;">
                            <table class="table table-hover table-bordered table-condensed table-striped grid" id="tableTransaksiMahasiswa1">
                                <thead>
                                    <tr>
                                        <th style="vertical-align: middle" rowspan="2">Prodi</th>
                                        <th style="vertical-align: middle" colspan="2">Jumlah Beasiswa</th>
                                        <th style="vertical-align: middle" colspan="2">Jumlah Reguler</th>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: middle">Lunas</th>
                                        <th style="vertical-align: middle">Belum<br />
                                            Lunas</th>
                                        <th style="vertical-align: middle">Lunas</th>
                                        <th style="vertical-align: middle">Belum<br />
                                            Lunas</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-12">
                        <div class="scrollstyle" style="overflow-x: auto;">
                            <table class="table table-hover table-bordered table-condensed table-striped grid" id="tableTransaksiMahasiswa2">
                                <thead>
                                    <tr>
                                        <th style="vertical-align: middle" rowspan="2">Prodi</th>
                                        <th style="vertical-align: middle" colspan="2">Jumlah<br />
                                            Penerimaan<br />
                                            (Lunas) (Rp)</th>
                                        <th style="vertical-align: middle" colspan="2">Jumlah Potensi<br />
                                            Penerimaan<br />
                                            (Belum Lunas) (Rp)</th>
                                        <th style="vertical-align: middle" rowspan="2">Total Potensi<br />
                                            Penerimaan<br />
                                            (Rp)</th>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: middle">Beasiswa</th>
                                        <th style="vertical-align: middle">Reguler</th>
                                        <th style="vertical-align: middle">Beasiswa</th>
                                        <th style="vertical-align: middle">Reguler</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">
    $.ajax({
        type: "POST",
        url: "Default.aspx/LoadDataTransaksiMahasiswa",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            var data = JSON.parse(r.d);

            var lunasbeasiswa = data.lunasbeasiswa;
            var belumlunasbeasiswa = data.belumlunasbeasiswa;
            var lunasreguler = data.lunasreguler;
            var belumlunasreguler = data.belumlunasreguler;
            var lunasall = data.lunasall;
            var belumlunasall = data.belumlunasall;
            var statistik1 = data.statistik1;
            var statistik2 = data.statistik2;

            $('#tableTransaksiMahasiswa1').append(statistik1).floatThead({
                responsiveContainer: function ($table) {
                    return $table.closest(".scrollstyle");
                },
                top: 70,
                zIndex: 2
            });
            $('#tableTransaksiMahasiswa2').append(statistik2).floatThead({
                responsiveContainer: function ($table) {
                    return $table.closest(".scrollstyle");
                },
                top: 70,
                zIndex: 2
            });

            Highcharts.chart('chartTransaksiMahasiswa', {
                title: {
                    text: 'Piutang Mahasiswa (%)'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.2f} %</b>'
                },
                xAxis: {
                    categories: ['Total Reguler & Beasiswa', 'Beasiswa', 'Reguler']
                },
                yAxis: {
                    min: 0,
                    max: 100,
                    title: {
                        text: 'Persentase'
                    }
                },
                plotOptions: {
                    column: {
                        stacking: 'percent'
                    }
                },
                series: [{
                    type: 'column',
                    name: 'Belum Lunas',
                    color: Highcharts.getOptions().colors[3],
                    data: [belumlunasall, belumlunasbeasiswa, belumlunasreguler]
                }, {
                    type: 'column',
                    name: 'Lunas',
                    color: Highcharts.getOptions().colors[2],
                    data: [lunasall, lunasbeasiswa, lunasreguler]
                }]
            });
        }
    });
</script>
