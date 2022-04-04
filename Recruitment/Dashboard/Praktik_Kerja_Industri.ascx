<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Praktik_Kerja_Industri.ascx.cs" Inherits="New_SIA.Dashboard.Praktik_Kerja_Industri" %>

<asp:UpdatePanel runat="server" ID="updatePanel1">
    <ContentTemplate>
        <div class="card">
            <div class="card-header">
                <asp:Label runat="server" ID="lblTitlePraktikKerjaIndustri" Font-Bold="true"></asp:Label>
            </div>
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-6">
                        <div id="chartPraktikKerjaIndustri" style="height: 400px"></div>
                    </div>
                    <div class="col-lg-6">
                        <asp:GridView runat="server" ID="gridDataPrakerin" CssClass="table table-hover table-bordered table-condensed table-striped grid" AllowPaging="true"
                            AllowSorting="false" AutoGenerateColumns="false" EmptyDataText="Tidak ada data" PageSize="10" PagerStyle-CssClass="pagination-ys"
                            ShowHeaderWhenEmpty="true">
                            <PagerSettings Mode="NumericFirstLast" FirstPageText="<<" LastPageText=">>" />
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="konsentrasi" HeaderText="Prodi" NullDisplayText="-" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="jumlahMahasiswa" HeaderText="Jumlah Mahasiswa" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="jumlahTeralokasi" HeaderText="Jumlah Teralokasi" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">
    Highcharts.chart('chartPraktikKerjaIndustri', {
        chart: {
            width: 500
        },
        title: {
            text: 'Mahasiswa Praktik Kerja Industri'
        },
        tooltip: {
            headerFormat: '<b>{point.x}</b><br/>',
            pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> <br/>Total Mahasiswa: <b>{point.stackTotal}</b>'
        },
        xAxis: {
            <%=Data1%>
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Jumlah'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: 'gray'
                }
            }
        },
        plotOptions: {
            column: {
                stacking: 'normal'
            }
        },
        series: [{
            type: 'column',
            name: 'Mahasiswa Teralokasi',
            color: Highcharts.getOptions().colors[0],
            <%=Data2%>
        }, {
            type: 'column',
            name: 'Mahasiswa Belum Teralokasi',
            color: Highcharts.getOptions().colors[1],
            <%=Data3%>
        }]
    });
</script>