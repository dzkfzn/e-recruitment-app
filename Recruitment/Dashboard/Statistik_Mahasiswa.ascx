<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Statistik_Mahasiswa.ascx.cs" Inherits="New_SIA.Dashboard.Statistik_Mahasiswa" %>

<asp:UpdatePanel runat="server" ID="updatePanel1">
    <ContentTemplate>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <b id="titleDBMHS1" runat="server">Dashboard Statistik Mahasiswa</b>
                    </div>
                    <div class="card-block">
                        <table class="table table-hover table-bordered table-condensed table-striped grid" id="tabelMHSStatistik">
                            <thead>
                                <tr>
                                    <th style="vertical-align: middle;" rowspan="2">Prodi</th>
                                    <th colspan="3">Tingkat</th>
                                    <th style="vertical-align: middle;" rowspan="2">Total Aktif</th>
                                    <th style="vertical-align: middle;" rowspan="2">Alumni</th>
                                </tr>
                                <tr>
                                    <th>I</th>
                                    <th>II</th>
                                    <th>III</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <b id="titleDBMHS2" runat="server">Dashboard Jenis Mahasiswa (Beasiswa/Reguler)</b>
                    </div>
                    <div class="card-block">
                        <table class="table table-hover table-bordered table-condensed table-striped grid" id="tabelMHSJenis">
                            <thead>
                                <tr>
                                    <th style="vertical-align: middle;" rowspan="2">Jenis Mahasiswa</th>
                                    <th colspan="3">Tingkat</th>
                                    <th style="vertical-align: middle;" rowspan="2">Total</th>
                                </tr>
                                <tr>
                                    <th>I</th>
                                    <th>II</th>
                                    <th>III</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <b id="titleDBMHS3" runat="server">Dashboard Jenis Kelamin Mahasiswa</b>
                    </div>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-5">
                                <div id="chartMHSJK"></div>
                            </div>
                            <div class="col-7">
                                <table class="table table-hover table-bordered table-condensed table-striped grid" id="tabelMHSJK">
                                    <thead>
                                        <tr>
                                            <th style="vertical-align: middle;" rowspan="2">Jenis Kelamin</th>
                                            <th colspan="3">Tingkat</th>
                                            <th style="vertical-align: middle;" rowspan="2">Total</th>
                                        </tr>
                                        <tr>
                                            <th>I</th>
                                            <th>II</th>
                                            <th>III</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <b>Dashboard Sebaran Mahasiswa Aktif</b>
                    </div>
                    <div class="card-block">
                        <style>
                            #mapMHS {
                                height: 400px;
                                width: 100%;
                            }
                        </style>
                        <div id="mapMHS"></div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDuGPu9EVIuKozA8-ytab2F4F3_qWAVhTI"></script>
<script type="text/javascript">
    var markers = [];
    var map;

    $(document).ready(function () {
        initMap();
    });

    function initMap() {
        var center = { lat: -2.6000285, lng: 118.015776 };
        var iconMarker = {
            url: "Images/IMG_FlagMap.png",
            scaledSize: new google.maps.Size(30, 25)
        };
        var infowindow = new google.maps.InfoWindow();

        map = new google.maps.Map(document.getElementById('mapMHS'), {
            zoom: 5,
            center: center,
            fullscreenControl: false,
            mapTypeControl: false,
            streetViewControl: false,
            minZoom: 5,
        });
        
        $.ajax({
            type: "POST",
            url: "Default.aspx/GetDataMapMahasiswa",
            contentType: "application/json; charset=utf-8",
            success: function (r) {
                data = JSON.parse(r.d);
                var features = data.features;
                markers.forEach(function (marker) {
                    marker.setMap(null);
                });
                markers = [];
                features.forEach(function (feature) {
                    if (feature.lbl != '0') {
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(feature.lat, feature.lang),
                            icon: iconMarker,
                            label: feature.lbl,
                            title: feature.title,
                            map: map,
                        });
                        marker.addListener('click', function () {
                            infowindow.setContent(feature.info);
                            infowindow.open(map, marker);
                        });
                        markers.push(marker);
                    }
                });
            }
        });
    }

    $.ajax({
        type: "POST",
        url: "Default.aspx/GetDataDashboardMahasiswa",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            var data = JSON.parse(r.d);

            var pria = data.pria;
            var wanita = data.wanita;
            var statistik = data.statistik;
            var jenis = data.jenis;
            var jk = data.jk;

            $('#tabelMHSStatistik').append(statistik).floatThead({
                top: 70,
                zIndex: 2
            });
            $('#tabelMHSJenis').append(jenis).floatThead({
                top: 70,
                zIndex: 2
            });
            $('#tabelMHSJK').append(jk).floatThead({
                top: 70,
                zIndex: 2
            });

            Highcharts.chart('chartMHSJK', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'Jenis Kelamin (%)'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: false
                        },
                        showInLegend: true
                    }
                },
                series: [{
                    name: 'Jenis Kelamin',
                    colorByPoint: true,
                    data: [{
                        name: 'Pria',
                        y: pria
                    }, {
                        name: 'Wanita',
                        y: wanita
                    }]
                }]
            });
        }
    });
</script>
