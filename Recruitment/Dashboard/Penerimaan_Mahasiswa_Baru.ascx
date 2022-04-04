<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Penerimaan_Mahasiswa_Baru.ascx.cs" Inherits="New_SIA.Dashboard.Penerimaan_Mahasiswa_Baru" %>

<asp:UpdatePanel runat="server" ID="updatePanel1">
    <ContentTemplate>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label style='font-weight: bold;' for="ddWaktu">Periode</label>
                    <asp:DropDownList runat="server" ID="ddWaktu" ClientIDMode="Static" CssClass="form-control dropdown" Style="min-width: 260px !important;" onchange="initMap();">
                        <asp:ListItem Text="Harian" Value="harian"></asp:ListItem>
                        <asp:ListItem Text="Mingguan" Value="mingguan"></asp:ListItem>
                        <asp:ListItem Text="Bulanan" Value="bulanan"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label style='font-weight: bold;' for="ddKonsentrasi">Program Studi</label>
                    <asp:DropDownList ID="ddKonsentrasi" runat="server" ClientIDMode="Static" CssClass="form-control dropdown" Style="min-width: 260px !important;" onchange="initMap();"></asp:DropDownList>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label style='font-weight: bold;' for="ddStatus">Status Pendaftar</label>
                    <asp:DropDownList runat="server" ID="ddStatus" ClientIDMode="Static" CssClass="form-control dropdown" Style="min-width: 260px !important;" onchange="initMap();">
                        <asp:ListItem Text="Semua Data" Value="semua"></asp:ListItem>
                        <asp:ListItem Text="Beasiswa" Value="beasiswa"></asp:ListItem>
                        <asp:ListItem Text="Reguler" Value="reguler"></asp:ListItem>
                        <asp:ListItem Text="Reguler (Belum Menyelesaikan Pendaftaran)" Value="creguler"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header">
                <b id="titleDBPMB1" runat="server">Dashboard Mahasiswa</b>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-md-8">
                        <div id="linechart"></div>
                    </div>
                    <div class="col-md-4">
                        <div id="tabelPMB"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header">
                <b id="titleDBPMB2" runat="server">Dashboard Penerimaan Mahasiswa Baru (Peta Sebaran)</b>
            </div>
            <div class="card-block">
                <style>
                    #mapPMB, #mapMHSSebaran {
                        height: 400px;
                        width: 100%;
                    }
                </style>
                <div id="mapPMB"></div>
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

        map = new google.maps.Map(document.getElementById('mapPMB'), {
            zoom: 5,
            center: center,
            fullscreenControl: false,
            mapTypeControl: false,
            streetViewControl: false,
            minZoom: 5,
        });

        $.ajax({
            type: "POST",
            url: "Default.aspx/GetDataDashboardPMB",
            contentType: "application/json; charset=utf-8",
            data: '{waktu: "' + $('#ddWaktu').val() + '", konsentrasi: "' + $('#ddKonsentrasi').val() + '", status: "' + $('#ddStatus').val() + '" }',

            success: function (r) {
                data = JSON.parse(r.d);
                var features = data.features;
                var xaxis = data.xaxis;
                var dataSeries = data.dataSeries;
                var persen = data.persen;
                $('#tabelPMB').html("");
                $('#tabelPMB').html(data.tabel);
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

                var highChart = Highcharts.chart('linechart', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: 'Grafik Pendaftar Mahasiswa Baru Politeknik Manufaktur Astra'
                    },
                    subtitle: {
                        text: 'Source: pmb.polman.astra.ac.id'
                    },
                    xAxis: xaxis,
                    yAxis: {
                        title: {
                            text: 'Jumlah Pendaftar'
                        }
                    },
                    plotOptions: {
                        line: {
                            dataLabels: {
                                enabled: true
                            },
                            enableMouseTracking: false
                        }
                    },
                    series: [{
                        name: 'Pendaftar',
                        data: dataSeries
                    }]
                });

                var gaugeOptions = {
                    chart: {
                        type: 'solidgauge'
                    },
                    title: null,
                    pane: {
                        center: ['50%', '85%'],
                        size: '70%',
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
                            [0.1, '#DF5353'], // green
                            [0.5, '#DDDF0D'], // yellow
                            [0.9, '#55BF3B'] // red
                        ],
                        lineWidth: 0,
                        minorTickInterval: null,
                        tickAmount: 2,
                        title: {
                            y: -70
                        },
                        labels: {
                            y: 16
                        }
                    },
                    plotOptions: {
                        solidgauge: {
                            dataLabels: {
                                y: 5,
                                borderWidth: 0,
                                useHTML: true
                            }
                        }
                    }
                };

                var chartSpeed = Highcharts.chart('chartPMB', Highcharts.merge(gaugeOptions, {
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Target'
                        }
                    },
                    credits: {
                        enabled: false
                    },
                    series: [{
                        name: 'Target',
                        data: [persen],
                        dataLabels: {
                            format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                                    '<span style="font-size:12px;color:silver">%</span></div>'
                        },
                        tooltip: {
                            valueSuffix: ' %'
                        }
                    }]
                }));
            },

            error: function (response) {
                alert('Maaf, Data Belum Ada');
                var highChart = Highcharts.chart('linechart', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: 'Grafik Pendaftar Mahasiswa Baru Politeknik Manufaktur Astra'
                    },
                    subtitle: {
                        text: 'Source: pmb.polman.astra.ac.id'
                    },
                    xAxis: {
                        "categories": []
                    },
                    yAxis: {
                        title: {
                            text: 'Jumlah Pendaftar'
                        }
                    },
                    plotOptions: {
                        line: {
                            dataLabels: {
                                enabled: true
                            },
                            enableMouseTracking: false
                        }
                    },
                    series: [{
                        name: 'Pendaftar',
                        data: []
                    }]
                });
            }
        });
    }
</script>
