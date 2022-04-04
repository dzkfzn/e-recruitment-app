<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Dashboard_Dosen_SPDA.ascx.cs" Inherits="New_SIA.Dashboard.Dashboard_Dosen_SPDA" %>

<asp:UpdatePanel runat="server" ID="updatePanel1">
    <ContentTemplate>
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" ID="lblDashboardDosen" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <b>Jabatan Akademik</b>
                            </div>
                            <div class="card-block">
                                <div id="donut-jabatan" style="height: 300px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="scrollstyle" style="overflow-x: auto;">
                            <asp:GridView runat="server" ID="gridData" CssClass="table table-hover table-bordered table-condensed table-striped grid" AllowPaging="true"
                                AllowSorting="false" AutoGenerateColumns="true" EmptyDataText="Tidak ada data" PageSize="10" PagerStyle-CssClass="pagination-ys"
                                ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridData_PageIndexChanging">
                                <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="card" style="display: none;">
            <div class="card-header">
                <asp:Label runat="server" ID="lblDashboardDosen2" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-block">
                <div class="row" id="dbdosen">
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="scrollstyle" style="overflow-x: auto;">
                            <asp:GridView runat="server" ID="gridData2" CssClass="table table-hover table-bordered table-condensed table-striped grid" AllowPaging="true"
                                AllowSorting="false" AutoGenerateColumns="true" EmptyDataText="Tidak ada data" PageSize="10" PagerStyle-CssClass="pagination-ys"
                                ShowHeaderWhenEmpty="true" OnPageIndexChanging="gridData2_PageIndexChanging">
                                <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="template" style="display: none">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <b>[TITLE]</b>
                    </div>
                    <div class="card-block">
                        <div id="donut-[TITLE]" style="height: 300px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 46 || charCode > 57)) {
            return false;
        } return true;
    }

    $('.dropdown-menu').click(function (event) {
        event.stopPropagation();
    });

    function pageLoad() {
        var val = parseInt($("#MainContent_addTahunAkademik").val());
        val += 1;
        if (val < 1000)
            $("#spanTahunAkademik").html('n/a');
        else
            $("#spanTahunAkademik").html('/' + val);
        var val = parseInt($("#MainContent_addTahunAkademik2").val());
        val += 1;
        if (val < 1000)
            $("#spanTahunAkademik2").html('n/a');
        else
            $("#spanTahunAkademik2").html('/' + val);
    }

    $(document).ready(function () {
        var val = parseInt($("#MainContent_addTahunAkademik").val());
        val += 1;
        if (val < 1000)
            $("#spanTahunAkademik").html('n/a');
        else
            $("#spanTahunAkademik").html('/' + val);
        var val = parseInt($("#MainContent_addTahunAkademik2").val());
        val += 1;
        if (val < 1000)
            $("#spanTahunAkademik2").html('n/a');
        else
            $("#spanTahunAkademik2").html('/' + val);

        var dbdosen = [];

        for (var i = 0; i < dbdosen.length; i++) {
            var data = dbdosen[i][0];
            var temp = $('#template').html().replace(/\[TITLE]/g, data.nama);
            $('#dbdosen').append(temp);
            
            Highcharts.chart('donut-' + data.nama, {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 0,
                    plotShadow: false
                },
                title: {
                    text: '',
                    align: 'center',
                    verticalAlign: 'top',
                    y: 40
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.y:.0f} ({point.percentage:.1f}%)</b>'
                },
                plotOptions: {
                    pie: {
                        dataLabels: {
                            enabled: true,
                            distance: 10,
                            style: {
                                fontWeight: 'bold',
                                color: 'black'
                            }
                        },
                        startAngle: 0,
                        endAngle: 360
                    }
                },
                series: [{
                    type: 'pie',
                    name: 'Jabatan',
                    innerSize: '50%',
                    data: data.data
                }]
            });
        }

        Highcharts.chart('donut-jabatan', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: 0,
                plotShadow: false
            },
            title: {
                text: '',
                align: 'center',
                verticalAlign: 'top',
                y: 40
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y:.0f} ({point.percentage:.1f}%)</b>'
            },
            plotOptions: {
                pie: {
                    dataLabels: {
                        enabled: true,
                        distance: 10,
                        style: {
                            fontWeight: 'bold',
                            color: 'black'
                        }
                    },
                    startAngle: 0,
                    endAngle: 360
                }
            },
            series: [{
                type: 'pie',
                name: 'Jabatan',
                innerSize: '50%',
                data: <%=Data1%>
            }]
        });
    });

    function getTahunAkademik(input) {
        var val = parseInt(input.value);
        val += 1;
        if (val < 1000)
            $("#spanTahunAkademik").html('n/a');
        else
            $("#spanTahunAkademik").html('/' + val);
    }

    function getTahunAkademik2(input) {
        var val = parseInt(input.value);
        val += 1;
        if (val < 1000)
            $("#spanTahunAkademik2").html('n/a');
        else
            $("#spanTahunAkademik2").html('/' + val);
    }
</script>
