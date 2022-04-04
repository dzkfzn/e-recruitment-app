<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Dashboard_SKPI.ascx.cs" Inherits="New_SIA.Dashboard.Dashboard_SKPI" %>

<asp:UpdatePanel runat="server" ID="updatePanel1">
    <ContentTemplate>
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" ID="lblTitleDashboardSKPI" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-12">
                        <div id="chartDashboardSKPI" style="height: 400px; width: 100%; max-width: 100%;"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:GridView runat="server" ID="gridDataSKPI" CssClass="table table-hover table-bordered table-condensed table-striped grid" AllowPaging="false"
                            AllowSorting="false" AutoGenerateColumns="false" EmptyDataText="Tidak ada data" ShowHeaderWhenEmpty="true">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="prodi" HeaderText="Prodi" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="jumlahmhs" HeaderText="Jumlah Mahasiswa Tingkat III" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="jumlahdraft" HeaderText="Belum Mengisi" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="jumlahpendingadmin" HeaderText="Dalam Persetujuan Admin KHA" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="jumlahpendingkepala" HeaderText="Dalam Persetujuan Kepala KHA" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="jumlahdisetujui" HeaderText="Disetujui" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">
    Highcharts.chart('chartDashboardSKPI', {
        title: {
            text: 'Rekapitulasi Ketercapaian Pengisian SKPI'
        },
        tooltip: {
            headerFormat: '<b>{series.name}</b><br/>',
            pointFormat: '<span style="color:{series.color}">Jumlah Mahasiswa: <b>{point.y}</b>'
        },
        xAxis: {
            categories: ['']
        },
        yAxis: {
            min: 0,
            <%=Data1%>,
            tickInterval: 10,
            title: {
                text: 'Jumlah Mahasiswa Tingkat III'
            },
            plotLines: [{
                color: 'red',
                dashStyle: 'longdashdot',
                <%=Data2%>,
                width: 2
            }]
    },
        series: [{
            type: 'column',
            color: 'tomato',
            name: 'Belum Mengisi',
            <%=Data3%>
        },
            {
                type: 'column',
                color: 'orange',
                name: 'Dalam Persetujuan Admin KHA',
            <%=Data4%>
            },
            {
                type: 'column',
                color: 'orange',
                name: 'Dalam Persetujuan Kepala KHA',
            <%=Data5%>
            },
            {
                type: 'column',
                color: 'green',
                name: 'Disetujui',
            <%=Data6%>
            }]
    });

    $(document).ready(function () {
        try { $('#chartDashboardSKPI').highcharts().setSize(undefined, undefined, false); } catch (err) { }
    });
</script>
