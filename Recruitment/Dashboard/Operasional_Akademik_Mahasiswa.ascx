<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Operasional_Akademik_Mahasiswa.ascx.cs" Inherits="New_SIA.Dashboard.Operasional_Akademik_Mahasiswa" %>

<asp:UpdatePanel runat="server" ID="updatePanel1">
    <ContentTemplate>
        <div class="card" runat="server" id="dashboardPerformaMahasiswa">
            <div class="card-header">
                <asp:Label runat="server" ID="lblDashboardPerformaMahasiswa" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-block">
                <h4>Indeks Prestasi</h4>
                <div class="row">
                    <div class="col-lg-7">
                        <div id="chartNilai"></div>
                    </div>
                    <div class="col-md-5">
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:GridView runat="server" ID="gridDataNilai" CssClass="table table-hover table-bordered table-condensed table-striped grid" AllowPaging="true"
                            AllowSorting="false" AutoGenerateColumns="false" EmptyDataText="Tidak ada data" PageSize="10" PagerStyle-CssClass="pagination-ys"
                            ShowHeaderWhenEmpty="true">
                            <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="semester" HeaderText="Semester" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="ip" HeaderText="IP" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <h4>Kehadiran</h4>
                <div class="row">
                    <div class="col-lg-7">
                        <div id="chartKehadiran"></div>
                    </div>
                    <div class="col-md-5">
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:GridView runat="server" ID="gridDataKehadiran" CssClass="table table-hover table-bordered table-condensed table-striped grid" AllowPaging="true"
                            AllowSorting="false" AutoGenerateColumns="false" EmptyDataText="Tidak ada data" PageSize="10" PagerStyle-CssClass="pagination-ys"
                            ShowHeaderWhenEmpty="true">
                            <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="semester" HeaderText="Semester" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="persentase" HeaderText="Persentase" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <h4>Jam Minus</h4>
                <div class="row">
                    <div class="col-lg-7">
                        <div id="chartJamMinus"></div>
                    </div>
                    <div class="col-lg-5">
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:GridView runat="server" ID="gridDataJamMinus" CssClass="table table-hover table-bordered table-condensed table-striped grid" AllowPaging="true"
                            AllowSorting="false" AutoGenerateColumns="false" EmptyDataText="Tidak ada data" PageSize="10" PagerStyle-CssClass="pagination-ys"
                            ShowHeaderWhenEmpty="true">
                            <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="semester" HeaderText="Semester" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="minus" HeaderText="Jam Minus" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <h4>Pelanggaran</h4>
                <div class="row">
                    <div class="col-lg-7">
                        <div id="chartPelanggaran"></div>
                    </div>
                    <div class="col-lg-5">
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:GridView runat="server" ID="gridDataPelanggaran" CssClass="table table-hover table-bordered table-condensed table-striped grid" AllowPaging="true"
                            AllowSorting="false" AutoGenerateColumns="false" EmptyDataText="Tidak ada data" PageSize="10" PagerStyle-CssClass="pagination-ys"
                            ShowHeaderWhenEmpty="true">
                            <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="semester" HeaderText="Semester" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="teguran" HeaderText="Teguran" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="sp1" HeaderText="SP1" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="sp2" HeaderText="SP2" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="sp3" HeaderText="SP3" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">
    Highcharts.chart('chartNilai', {
        chart: {
        },
        title: {
            text: 'Grafik Indeks Prestasi Mahasiswa'
        },
        subtitle: {
            text: 'Source: http://10.5.200.125/qa/pmasia5des2018'
        },
        xAxis: {
            <%=Data7%>
        },
        yAxis: {
            title: {
                text: 'Indeks Nilai'
            },
            min: 0,
            max: 4
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
            name: 'IP',
            type: 'column',
            <%=Data8%>
        }, {
            name: 'IPK',
            type: 'spline',
            <%=Data9%>
        }]
    });

    Highcharts.chart('chartKehadiran', {
        chart: {
            type: 'line'

        },
        title: {
            text: 'Grafik Persentase Kehadiran Mahasiswa'
        },
        subtitle: {
            text: 'Source: http://10.5.200.125/qa/pmasia5des2018'
        },
        xAxis: {
            <%=Data1%>
        },
        yAxis: {
            title: {
                text: 'Persentase'
            },
            min: 0,
            max: 100
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
            name: 'Kehadiran',
            <%=Data2%>
        }]
    });

    Highcharts.chart('chartJamMinus', {
        chart: {
            type: 'line'

        },
        title: {
            text: 'Grafik Jumlah Jam Minus Mahasiswa'
        },
        subtitle: {
            text: 'Source: http://10.5.200.125/qa/pmasia5des2018'
        },
        xAxis: {
            <%=Data3%>
        },
        yAxis: {
            title: {
                text: 'Jumlah'
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
            name: 'Jam Minus',
            <%=Data4%>
        }]
    });

    Highcharts.chart('chartPelanggaran', {
        chart: {
            type: 'line'

        },
        title: {
            text: 'Grafik Jumlah Pelanggaran Mahasiswa'
        },
        subtitle: {
            text: 'Source: http://10.5.200.125/qa/pmasia5des2018'
        },
        xAxis: {
            <%=Data5%>
        },
        yAxis: {
            title: {
                text: 'Jumlah'
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
            name: 'Pelanggaran',
            <%=Data6%>
        }]
    });
</script>
