<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Operasional_Akademik_Dosen.ascx.cs" Inherits="New_SIA.Dashboard.Operasional_Akademik_Dosen" %>

<asp:UpdatePanel runat="server" ID="updatePanel1">
    <ContentTemplate>
        <div class="card" runat="server" id="dashboardDosen">
            <div class="card-header">
                <asp:Label runat="server" ID="lbDashboardDosen" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-block">
                <br />
                <div class="row" runat="server" id="rowDashboardDosen">

                    <% for (int i = 0; i < Convert.ToInt32(Jumlah); i++)
                        { %>
                    <div class="col-lg-6">
                        <div id="container-kehadiranMataKuliah<%=i+1%>" style="width: 100%; height: 200px;"></div>
                    </div>
                    <div class="col-lg-6">
                        <div id="container-ketercapaianMataKuliah<%=i+1%>" style="width: 100%; height: 200px;"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">
    function renderDashboardDosen() {
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
        x = '<%=Jumlah%>'
        //satu
            <% for (int i = 0; i < Convert.ToInt32(Jumlah); i++)
    { %>

        var kehadiranMataKuliah<%=i+1%> = Highcharts.chart('container-kehadiranMataKuliah<%=i+1%>', Highcharts.merge(gaugeOptions, {
            yAxis: {
                min: 0,
                max: 100,
                title: {
                    text: 'Kehadiran Mata Kuliah ' + '<%=Matkul[i]%>'
                }
            },

            credits: {
                enabled: false
            },

            series: [{
                name: 'Kehadiran Mata Kuliah',
                data: [<%=DosK[i]%>],
                dataLabels: {
                    format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                        ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y} %</span></div>'
                },
                tooltip: {
                    valueSuffix: '%'
                }
            }]

        }));

        var ketercapaianMataKuliah<%=i+1%> = Highcharts.chart('container-ketercapaianMataKuliah<%=i+1%>', Highcharts.merge(gaugeOptions, {
            yAxis: {
                min: 0,
                max: 100,
                title: {
                    text: 'Ketercapaian Materi Mata Kuliah ' + '<%=Matkul[i]%>'
                }
            },

            credits: {
                enabled: false
            },

            series: [{
                name: 'Ketercapaian Materi Mata Kuliah',
                data: [<%=DosKM[i]%>],
                dataLabels: {
                    format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                        ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y} %</span></div>'
                },
                tooltip: {
                    valueSuffix: '%'
                }
            }]
        }));

            <% } %>

    }
</script>
