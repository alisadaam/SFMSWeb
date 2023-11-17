<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllocationSummaryGraph.aspx.cs" Inherits="BMSWeb.Pages.AllocationSummaryGraph" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<link href="../Content/bootstrap.min.css" rel="stylesheet" />
	<%: Scripts.Render("~/bundles/jquery") %>
	<%: Scripts.Render("~/bundles/bootstrap")%>
	<%: Scripts.Render("~/bundles/jqueryui")%>
	


	<script src="../Scripts/AdminLTE/scripts.js"></script>
	<script src="../assets/highcharts/js/highcharts.js"></script>
	 <script src="../Assets/highcharts/js/modules/exporting.js"></script>
    <script src="../Assets/highcharts/js/modules/offline-exporting.js"></script>
    <script src="../Assets/highcharts/js/highcharts-3d.js"></script>
	<script type="text/javascript">
		Highcharts.setOptions({
			colors: ['#1B0AFF', '#93FB0B', '#00F1FD', '#0065FD', '#B300FD', '#E49808', '#1EFF05', '#DBB7FB']

		});
	</script>
</head>
<body style="width:99%;overflow:hidden">
	<form id="form1" runat="server">
		<div enableviewstate="true" visible="true" id="lblChart31" runat="server">
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12" enableviewstate="true" style="" visible="true" id="lblChartCap" runat="server">

		</div>
		</div>
		
	</form>
</body>
</html>