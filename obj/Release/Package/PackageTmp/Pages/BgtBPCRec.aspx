<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtBPCRec.aspx.cs" Inherits="BMSWeb.Pages.BgtBPCRec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
	<style>
		hr {
			margin-top: 6px;
			margin-bottom: 6px;
			border: 0;
			border-top: 1px solid #eee;
		}

		@media (min-width: 768px) {
			.modal-dialog {
				width: 600px;
				margin: 120px auto;
			}
		}

		.btn-primary {
			box-shadow: 0 0 0 1px #428bca inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 1px 0 0 #357ebd, 0 6px 0 1px rgba(0,0,0,-0.6), 0 8px 8px 1px rgba(0,0,0,0.5);
			background-color: #428bca;
		}

		.border-color {
			border-color: #0048D2 !important;
		}

		.IframeDteGraph {
			width: 100%;
			height: 734px;
			border: none;
			margin-top: -27px;
		}

		.form-control {
			height: 30px !important;
			font-size: 13px !important;
			font-weight: 600;
			color: black;
		}

		.btn.btn-primary:hover, .btn.btn-primary:active, .btn.btn-primary.hover {
			background-color: #0671BD;
		}

		.zoom {
			-webkit-transform: all .2s ease-in-out;
			transform: all .2s ease-in-out;
		}

			.zoom:hover {
				-webkit-transform: scale(1.4);
				transform: scale(1.4);
			}

		.popover-title {
			white-space: pre-wrap;
			font-weight: 500;
			font-size: 22px;
		}

		.sweet-alert h2 {
			color: #00369E;
			font-size: 30px;
			text-align: center;
			font-weight: 600;
			text-transform: none;
			position: relative;
			margin: 25px 0;
			padding: 0;
			line-height: 40px;
			display: block;
		}

		.sweet-alert {
			background-color: white;
			font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
			width: 1200px;
			padding: 17px;
			border-radius: 5px;
			text-align: center;
			position: fixed;
			left: 24%;
			top: 50%;
			/*margin-left: -256px;*/
			margin-top: -580px !important;
			margin-top: -250px;
			overflow: hidden;
			display: none;
			z-index: 99999;
		}
		/*.sweet-alert {
			background-color: white;
			font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
			width: 1000px;
			padding: 17px;
			border-radius: 5px;
			text-align: center;
			position: fixed;
			left: 34%;
			top: 50%;
			margin-left: -256px;
			margin-top: -200px;
			overflow: hidden;
			display: none;
			z-index: 99999;
		}*/

		option {
			font-weight: normal;
			display: block;
			white-space: pre;
			min-height: 1.2em;
			padding: 0px 2px 1px;
			font-weight: 700;
		}

		.btn.btn-primary {
			background-color: #00369E;
			border-color: #074BB1;
			font-size: 12px;
			font-weight: 700;
		}
		/*.sweet-alert {
			
			min-width: 768px;
		}*/
		/*.form-control {
			height: 30px !important;
			font-size: 22px !important;
			font-weight: 700;
			/*color: black;*/
		/*}**/

		body {
			font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
			font-size: 13px;
			line-height: 1.42857143;
			color: black !important;
			background-color: #fff;
		}

		.sweet-alert p {
			color: #797979;
			font-size: 16px;
			text-align: center;
			font-weight: 700 !important;
			/* position: relative; */
			/* text-align: inherit; */
			/* float: none; */
			margin: 0;
			padding: 0;
			line-height: normal;
			max-height: 1500px;
			/*overflow: scroll;*/
		}

		.popover {
			position: absolute;
			top: 0;
			left: 0;
			z-index: 1060;
			display: none;
			max-width: 576px;
			padding: 1px;
			font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
			font-size: 14px;
			font-weight: 400;
			line-height: 1.42857143;
			text-align: left;
			white-space: normal;
			background-color: #fff;
			-webkit-background-clip: padding-box;
			background-clip: padding-box;
			border: 1px solid #ccc;
			border: 1px solid rgba(0,0,0,.2);
			border-radius: 6px;
			-webkit-box-shadow: 0 5px 10px rgba(0,0,0,.2);
			box-shadow: 0 5px 10px rgba(0,0,0,.2);
		}

		th {
			text-align: center !important;
		}

		.float-Right {
			float: right;
			font-size: 24px !important;
		}

		.float-Right1 {
			float: right;
			font-size: 18px !important;
		}

		.font15 {
			font-size: 15px !important;
		}

		.sweet-alert p {
			color: #000000;
			font-size: 16px;
			text-align: left;
			font-weight: 700 !important;
			/* position: relative; */
			/* text-align: inherit; */
			/* float: none; */
			margin: 0;
			padding: 0;
			line-height: normal;
		}

		.GVFixedHeader {
			font-weight: bold;
			background-color: Green;
			position: relative;
			top: expression(this.parentNode.parentNode.parentNode.scrollTop-1);
		}

		.GVFixedFooter {
			font-weight: bold;
			background-color: Green;
			position: relative;
			bottom: expression(getScrollBottom(this.parentNode.parentNode.parentNode.parentNode));
		}

		.marging-top1 {
			margin-top: 92px;
		}

		.btn3d {
			transition: all .08s linear;
			position: relative;
			outline: medium none;
			-moz-outline-style: none;
			border: 0px;
			margin-right: 10px;
			margin-top: 15px;
		}

			.btn3d:focus {
				outline: medium none;
				-moz-outline-style: none;
			}

			.btn3d:active {
				top: 9px;
			}

		.btn-default {
			box-shadow: 0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #adadad, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
			background-color: #fff;
		}
		.IframeDteGraph1 {
    width: 100%;
    height: 597px;
    border: none;
    margin-top: -27px;
}
		/*.btn-primary {
            box-shadow: 0 0 0 1px #428bca inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 6px 0 0 #357ebd, 0 6px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
            background-color: #428bca;
        }*/
	</style>
	<%--<script type="text/javascript" lang="javascript">
		function ShowInfo1(a, b, c) {
			//$("#desc").html(a);
			//$("#just").html(b);

			swal({
				title: "Details",

				text: "<h4 style='color:black'>Description</h4><br /><p style='color:black'>" + a + "</p>" + "<br /><h4 style='color:black'>Justification</h4><br /><p style='color:black'>" + b + "</p>" + "<br /><h4 style='color:black'>Required Amount (Amount in Million)</h4><br /><p style='color:black'>" + c + "</p>" + $("#DivDetails").html(),
				html: true,
				showCancelButton: false,
				confirmButtonColor: "#DD6B55",

				closeOnConfirm: true,
				customClass: "swal-wide",

			});


		}
	</script>--%>
	<script type="text/javascript">
		function SaveProvAmt(e) {
			var value = document.getElementById(e).value;
			var a = e.split('_');
			var t = value.split('.');
			if (t.length > 2) {
				DecimalError();
			}
			else {
				var b = "MainContent_GridEstimates_HiddenQuery_" + a[3];
				var query = document.getElementById(b).value;
				//  alert(query);
				$.ajax({
					type: "POST",
					contentType: "application/json; charset=utf-8",
					url: "BgtBPCRec.aspx/SaveProAmt",
					data: "{Amt:'" + value + "',Query:'" + query + "'}",
					dataType: "json",
					//called on jquery ajax call success
					success: function (result) {
						$("#MainContent_ViewAll").click();
					},
					//called on jquery ajax call failure
					error: function ajaxError(result) {

					}
				});
			}
		}
		function SaveBPCAmt(e) {
			var value = document.getElementById(e).value;
			var a = e.split('_');
			var t = value.split('.');
			//if (t.length > 2) {
			//    DecimalError();
			//}
			//else {
			var b = "MainContent_GridEstimates_HiddenQuery_" + a[3];
			var query = document.getElementById(b).value;
			//  alert(query);
			$.ajax({
				type: "POST",
				contentType: "application/json; charset=utf-8",
				url: "BgtBPCRec.aspx/SaveBPCAmt",
				data: "{Amt:'" + value + "',Query:'" + query + "'}",
				dataType: "json",
				//called on jquery ajax call success
				success: function (result) {
					$("#MainContent_ViewAll").click();
				},
				//called on jquery ajax call failure
				error: function ajaxError(result) {
					DecimalError();
				}
			});
			//}
		}
		function GraphModeBPC() {
			//sessionStorage.setItem("TotalBPCOandM", $("#MainContent_TotalFE_OandM").val());
			//sessionStorage.setItem("RecBPCOandM", $("#MainContent_RecFE_OandM").val());
			swal({
				title: "Graphical Report",
				type: "success",
				text: "<div><iframe src=" + 'GraphPageBPC1.aspx' + " class=" + "IframeDteGraph" + "></iframe></div>",
				html: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "OK!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false

			});
		}
		function GraphModeRsBPC() {
			//sessionStorage.setItem("TotalBPCOandM", $("#MainContent_TotalFE_OandM").val());
			//sessionStorage.setItem("RecBPCOandM", $("#MainContent_RecFE_OandM").val());
			swal({
				title: "Graphical Report",
				type: "success",
				text: "<div><iframe src=" + 'GraphPageBPCRs1.aspx' + " class=" + "IframeDteGraph" + "></iframe></div>",
				html: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "OK!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false

			});
		}
		function GraphMode() {
			//sessionStorage.setItem("TotalBPCOandM", $("#MainContent_TotalFE_OandM").val());
			//sessionStorage.setItem("RecBPCOandM", $("#MainContent_RecFE_OandM").val());
			swal({
				title: "Graphical Report",
				type: "success",
				text: "<div><iframe src=" + 'GraphPageBPC.aspx' + " class=" + "IframeDteGraph" + "></iframe></div>",
				html: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "OK!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false

			});
		}
		function DecsisionBtnClose() {
			document.getElementById("DecsisionBtnClose11").click();
		}
		function DecisionPopup(a, b, c) {
			$("#MainContent_FYDecHidden").val(b);
			$("#MainContent_SerNoDecHidden").val(a);
			$("#MainContent_DteDecHidden").val(c);


			document.getElementById("SaveDecision").click();

		}

		function Ceilingsaved() {
			document.getElementById("ceilingsavedbtn").click();

		}
		function GraphModeRs() {
			//sessionStorage.setItem("TotalBPCOandM", $("#MainContent_TotalFE_OandM").val());
			//sessionStorage.setItem("RecBPCOandM", $("#MainContent_RecFE_OandM").val());
			swal({
				title: "Graphical Report",
				type: "success",
				text: "<div><iframe src=" + 'GraphPageBPCRs.aspx' + " class=" + "IframeDteGraph" + "></iframe></div>",
				html: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "OK!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false

			});
		}
		function DirectrateMissing() {
			swal({
				title: "Error!",
				text: "Please Select Directorate",
				type: "error",
				confirmButtonColor: "rgb(53, 155, 255)"
			});
			//swal("Inserted!", "Record Inserted Sucessfully.", "success", "rgb(53, 155, 255)");
		}
		function DecimalError() {
			document.getElementById("WrongDecimalbtn").click();
			//swal("Inserted!", "Record Inserted Sucessfully.", "success", "rgb(53, 155, 255)");
		}
		function getScrollBottom(p_oElem) {
			return p_oElem.scrollHeight - p_oElem.scrollTop - p_oElem.clientHeight;
		}
	</script>
	<script type="text/javascript" lang="javascript">
		//$(window).on("load", (function (e) {
		//    var obj = new ActiveXObject("Wscript.shell");
		//    obj.SendKeys("{f11}");
		//}
		//));
		$(document).ready(function () {
			$(".sidebar-toggle").click();
			$('[data-toggle="popover"]').popover();

		});
		//$.ajax({
		//	type: "POST",
		//	contentType: "application/json; charset=utf-8",
		//	url: "BgtBPCRec.aspx/MainSumeryModel",
		//	data: "",
		//	dataType: "json",
		//	//called on jquery ajax call success
		//	success: function (result) {
		function ViewSumeryModel() {
			swal({
				title: "Summary",
				text: $("#MainContent_Main_Sumery_MOdel").html(),
				//text: "<h4 style='color:black'>Description</h4><br /><p style='color:black'>" + a + "</p>" + "<br /><h4 style='color:black'>Justification</h4><br /><p style='color:black'>" + b + "</p>" + "<br /><h4 style='color:black'>Required Amount (Amount in Million)</h4><br /><p style='color:black'>" + c + "</p>" + $("#DivDetails").html(),
				html: true,
				showCancelButton: false,
				confirmButtonColor: "#DD6B55",

				closeOnConfirm: true,
				customClass: "swal-wide",
			});
		}
		function ViewSumeryModelBPC() {
			swal({
				title: "Summary",
				text: $("#MainContent_Main_Sumery_MOdelBPC").html(),
				//text: "<h4 style='color:black'>Description</h4><br /><p style='color:black'>" + a + "</p>" + "<br /><h4 style='color:black'>Justification</h4><br /><p style='color:black'>" + b + "</p>" + "<br /><h4 style='color:black'>Required Amount (Amount in Million)</h4><br /><p style='color:black'>" + c + "</p>" + $("#DivDetails").html(),
				html: true,
				showCancelButton: false,
				confirmButtonColor: "#DD6B55",

				closeOnConfirm: true,
				customClass: "swal-wide",
			});
		}
		//	},
		//	//called on jquery ajax call failure
		//	error: function ajaxError(result) {

		//	}
		//});


		//})
		//);
		function ShowInfo1(a, b, c) {
			//$("#desc").html(a);
			//$("#just").html(b);

			swal({
				title: "Details",
				text: "<table class='form-control' style='font-size: 20px;'><tr><td style='color: #1D74D6>DESCRIPTION :   </td><td>" + a + "</td></tr><tr><td style='color: #1D74D6>JUSTIFICATION :   </td><td>" + b + "</td></tr><tr><td style='color: #1D74D6>REQUIRED AMOUNT :   </td><td>" + c + "     Million <br /><br /></td></tr></table>",
				//text: "<h4 style='color:black'>Description</h4><br /><p style='color:black'>" + a + "</p>" + "<br /><h4 style='color:black'>Justification</h4><br /><p style='color:black'>" + b + "</p>" + "<br /><h4 style='color:black'>Required Amount (Amount in Million)</h4><br /><p style='color:black'>" + c + "</p>" + $("#DivDetails").html(),
				html: true,
				showCancelButton: false,
				confirmButtonColor: "#DD6B55",

				closeOnConfirm: true,
				customClass: "swal-wide",

			});


		}

	</script>

	<script type="text/javascript">

		function NoDescMessage() {
			swal({
				title: "<h4 style='color:black'>Sorry</h4>",
				type: "warning",
				text: "No Additional Details",
				html: true,
				showCancelButton: false,
				confirmButtonColor: "#DD6B55",

				closeOnConfirm: true,
				customClass: "swal-wide",

			});

		}
		function AmountExeeded() {
			swal({
				title: "<h4 style='color:black'>Amount Exceeded</h4>",
				type: "warning",
				text: "Entered Amount is Exceeded the Demanded Amount",
				html: true,
				showCancelButton: false,
				confirmButtonColor: "#DD6B55",

				closeOnConfirm: true,
				customClass: "swal-wide",

			});
		}
		function ModelPopupUpdated() {
			$("#UpdatedBtnModel").click();
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script>
		var prm = Sys.WebForms.PageRequestManager.getInstance();
		prm.add_endRequest(function () {

			//  $(".sidebar-toggle").click();
			$('[data-toggle="popover"]').popover();
		});
		function ChangeViewOfModel() {

			if ($("#ChangeViewBtnSpan").text() == "Tabular View") {
				$("#GraphicalViewModel").hide();
				$("#TabularViewModel").show();
				$("#ChangeViewBtnSpan").text("Graphical View")
			}
			else {
				$("#GraphicalViewModel").show();
				$("#TabularViewModel").hide();
				$("#ChangeViewBtnSpan").text("Tabular View")
			}
		}
		function AllocationSumPopUp() {
			$("#AllocationSumm").click();
		}
	</script>
	<asp:Button runat="server" ID="SummaryAllocation" OnClick="SummaryAllocation_Click" />
	<button style="display: none;" type="button" id="AllocationSumm" class="btn btn-primary" data-toggle="modal" data-target="#AllocationSummMdl">
	</button>

	<div class="modal fade" id="AllocationSummMdl" tabindex="-1" role="dialog" aria-labelledby="AllocationSummlbl" aria-hidden="true" style="color: black;">
		<div class="modal-dialog" style="    margin: 0px 5%">
			<div class="modal-content" style="position: absolute;">
				<button style="width: 100px; background-color: #020AFB; color: white; height: 50px; opacity: 1"
					type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">OK</span></button>
				<button style="width: 100px; background-color: #020AFB; color: white; height: 50px; opacity: 1"
					type="button" id="ChangeViewBtn" onclick="ChangeViewOfModel()">
					<span aria-hidden="true" id="ChangeViewBtnSpan">Tabular View</span></button>
				<div class="modal-header">
				</div>
				<div class="modal-body">
					<table style="width: 1200px">
						<tr id="GraphicalViewModel">
							<td style="color: blue; font-weight: 700; font-size: 22px">
								<iframe src="AllocationSummaryGraph.aspx" class="IframeDteGraph1"></iframe>
							</td>
						</tr>
						<tr id="TabularViewModel" style="display: none">
							<td style="font-size:16px">
								<asp:GridView ID="GridView1AllocSum" Width="100%" ShowFooter="true" CssClass="Grid table-hover border-color" OnRowCreated="GridView1AllocSum_RowCreated" OnDataBound="GridView1AllocSum_DataBound" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" OnRowDataBound="GridView1AllocSum_RowDataBound">
            <FooterStyle BackColor="#00369E" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <%--<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />--%>
								<alternatingrowstyle backcolor="White" />
								<pagerstyle cssclass="pagination-ys" />

								<rowstyle cssclass="GridviewScrollItem" backcolor="#EFF3FB" />
								<headerstyle cssclass="GVFixedHeader" backcolor="#00369E" font-bold="True" forecolor="White" />


								<emptydatarowstyle backcolor="#EFF3FB" />
								<columns>
                <asp:BoundField HeaderText="Branch" DataField="BRANCH" ItemStyle-HorizontalAlign="Center" />

                <asp:TemplateField>
                    <HeaderTemplate>NM</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col1" Text='<%#Eval("AMT_REC_BPC_NM_FY1") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>O&M</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Font-Bold="true" ID="col2" Text='<%#Eval("AMT_REC_BPC_OM_FY1") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
				<asp:TemplateField>
                    <HeaderTemplate>RRC</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col3" Text='<%#Eval("AMT_RRC_FY1") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

  <asp:TemplateField>
                    <HeaderTemplate>NM</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col4" Text='<%#Eval("AMT_REC_BPC_NM_FY2") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>O&M</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Font-Bold="true" ID="col5" Text='<%#Eval("AMT_REC_BPC_OM_FY2") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
				<asp:TemplateField>
                    <HeaderTemplate>RRC</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col6" Text='<%#Eval("AMT_RRC_FY2") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


									  <asp:TemplateField>
                    <HeaderTemplate>NM</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col7" Text='<%#Eval("AMT_REC_BPC_NM_FY3") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>O&M</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Font-Bold="true" ID="col18" Text='<%#Eval("AMT_REC_BPC_OM_FY3") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
				<asp:TemplateField>
                    <HeaderTemplate>RRC</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col8" Text='<%#Eval("AMT_RRC_FY3") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
									

									  <asp:TemplateField>
                    <HeaderTemplate>NM</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col9" Text='<%#Eval("AMT_REC_BPC_NM_FY4") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>O&M</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Font-Bold="true" ID="col10" Text='<%#Eval("AMT_REC_BPC_OM_FY4") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
				<asp:TemplateField>
                    <HeaderTemplate>RRC</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col11" Text='<%#Eval("AMT_RRC_FY4") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


									  <asp:TemplateField>
                    <HeaderTemplate>NM</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col12" Text='<%#Eval("AMT_REC_BPC_NM_FY5") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>O&M</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Font-Bold="true" ID="col13" Text='<%#Eval("AMT_REC_BPC_OM_FY5") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
				<asp:TemplateField>
                    <HeaderTemplate>RRC</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col14" Text='<%#Eval("AMT_RRC_FY5") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>NM</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col19" Text='<%#Eval("TotalNm") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>O&M</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Font-Bold="true" ID="col15" Text='<%#Eval("TotalOm") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
									  <asp:TemplateField>
                    <HeaderTemplate>NM</HeaderTemplate>

                    <ItemTemplate>
						  <asp:Label runat="server" Font-Bold="true" ID="col16" Text='<%#Eval("WgtNm") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>O&M</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Font-Bold="true" ID="col17" Text='<%#Eval("WgtOm") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </columns>
								<emptydatatemplate>
                <p align="center"><strong>No Record Found</strong></p>
            </emptydatatemplate>

								</asp:GridView>
							</td>


						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<button style="display: none" type="button" id="WrongDecimalbtn" class="btn btn-primary" data-toggle="modal" data-target="#WrongDecimalMdl">
	</button>

	<div class="modal fade" id="WrongDecimalMdl" tabindex="-1" role="dialog" aria-labelledby="WrongDecimallbl" aria-hidden="true" style="color: black;">
		<div class="modal-dialog">
			<div class="modal-content">
				<button style="width: 100px; background-color: #020AFB; color: white; height: 50px; opacity: 1"
					type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">OK</span></button>
				<div class="modal-header">

					<h4 class="modal-title" id="WrongDecimallbl">Saved!</h4>
				</div>
				<div class="modal-body">
					<table style="width: 100%">
						<tr>
							<td style="color: blue; font-weight: 700; font-size: 22px">You have Entered wrong decimal!
												
							</td>


						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>

	<button style="display: none" type="button" id="ceilingsavedbtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal12">
	</button>

	<div class="modal fade" id="myModal12" tabindex="-1" role="dialog" aria-labelledby="myModalLabel12" aria-hidden="true" style="color: black;">
		<div class="modal-dialog">
			<div class="modal-content">
				<button style="width: 100px; background-color: #020AFB; color: white; height: 50px; opacity: 1"
					type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">OK</span></button>
				<div class="modal-header">

					<h4 class="modal-title" id="myModalLabel12">Saved!</h4>
				</div>
				<div class="modal-body">
					<table style="width: 100%">
						<tr>
							<td style="color: blue; font-weight: 700; font-size: 22px">Record Sucessfully Saveed!
												
							</td>


						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>



	<button style="display: none" type="button" id="UpdatedBtnModel" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">
	</button>

	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="color: black;">
		<div class="modal-dialog">
			<div class="modal-content">
				<button style="width: 100px; background-color: #020AFB; color: white; height: 50px; opacity: 1"
					type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">OK</span></button>
				<div class="modal-header">

					<h4 class="modal-title" id="myModalLabel">Updated!</h4>
				</div>
				<div class="modal-body">
					<table style="width: 100%">
						<tr>
							<td style="color: blue; font-weight: 700; font-size: 22px">Record Updated Sucessfully !
												
							</td>


						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>

	<button style="display: none" type="button" id="SaveDecision" class="btn btn-primary" data-toggle="modal" data-target="#myModalDecision">
	</button>
	<div class="modal fade" id="myModalDecision" tabindex="-1" role="dialog" aria-labelledby="myModalDecLbl" aria-hidden="true" style="color: black;">
		<div class="modal-dialog">
			<div class="modal-content">
				<button type="button" class="close" id="DecsisionBtnClose11" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
				<div class="modal-header">

					<h4 class="modal-title" id="myModalDecLbl">Decision!</h4>
				</div>
				<div class="modal-body">
					<table style="width: 100%">
						<tr>
							<td style="color: blue; font-weight: 700; font-size: 22px">
								<asp:HiddenField ID="FYDecHidden" runat="server" Value="" />
								<asp:HiddenField ID="SerNoDecHidden" runat="server" Value="" />
								<asp:HiddenField ID="DteDecHidden" runat="server" Value="" />
								<asp:TextBox CssClass="Upper-case" Width="100%" ClientIDMode="Static" ID="DecisionBPC" placeholder="Decision" runat="server" Height="100px" TextMode="MultiLine">
								</asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:Button runat="server" OnClientClick="DecsisionBtnClose()" class=" btn btn-primary btn-sm" Style="float: right; margin-top: 5px" Text="Save Decision" ID="BtnSaveDecision" OnClick="BtnSaveDecision_Click" />
							</td>
						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>
	<%--<div runat="server" ID="Main_Sumery_MOdel" ScrollBars="Auto" Height="245px" Width="100%">--%>
	<div id="Main_Sumery_MOdel" runat="server" style=""  hidden>


		<asp:GridView ID="GridBPCSumery" Width="100%"  ShowFooter="true" CssClass="Grid table-hover border-color marging-top1" OnRowCreated="GridBPCSumery_RowCreated" OnDataBound="GridBPCSumery_DataBound" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4">
			<FooterStyle BackColor="#00369E" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
			<EditRowStyle BackColor="#2461BF" />
			<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
			<%--<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />--%>
			<AlternatingRowStyle BackColor="White" />
			<PagerStyle CssClass="pagination-ys" />

			<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
			<HeaderStyle CssClass="GVFixedHeader" BackColor="#00369E" Font-Bold="True" ForeColor="White" />


			<EmptyDataRowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField HeaderText="Branch" DataField="BRANCH" ItemStyle-HorizontalAlign="Center" />

				<%--		<asp:TemplateField>
							<HeaderTemplate>Branch</HeaderTemplate>
							<ItemTemplate>
								<asp:Label ForeColor="Black" Font-Bold="true" runat="server" Text='<%#Eval("BRANCH") %>'></asp:Label>
							</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
						</asp:TemplateField>--%>
				<asp:TemplateField>
					<HeaderTemplate>Mode</HeaderTemplate>

					<ItemTemplate>
						<asp:Label runat="server" ForeColor="Black" Font-Bold="true" Text='<%#Eval("UTILIZATION_DECODE") %>'></asp:Label>
					</ItemTemplate>
					<%--	<ItemStyle HorizontalAlign="Center" />--%>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>FE</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("REQ_AMT_FE") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_ReqFe" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>RS</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("REQ_AMT_RS") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_ReqRs" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>

				<asp:TemplateField>
					<HeaderTemplate>FE</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PSO_AMT_FE") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_PSOFe" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>RS</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PSO_AMT_RS") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_PSORs" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>FE</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PLANS_AMT_FE") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_PlansFe" runat="server" /><br />
							<hr />
							<asp:Label ID="lbl_SuppNdPlanFe" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>RS</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PLANS_AMT_RS") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_PlansRs" runat="server" />
							<br />
							<hr />
							<asp:Label ID="lbl_SuppNdPlanRs" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>FE</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("SUPP_AMT_FE") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_SuppFe" runat="server" />
							<br />
							<hr />
							<asp:Label ID="lbl_SuppNdPlanFe1" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>RS</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("SUPP_AMT_RS") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_SuppRs" runat="server" /><br />
							<hr />
							<asp:Label ID="lbl_SuppNdPlanRs1" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
			</Columns>
			<EmptyDataTemplate>
				<p align="center"><strong>No Record Found</strong></p>
			</EmptyDataTemplate>

		</asp:GridView>

	</div>
	<div id="Main_Sumery_MOdelBPC" runat="server" style="" hidden>


		<asp:GridView ID="GridBPCSumeryBpc" Width="100%" ShowFooter="true" CssClass="Grid table-hover border-color marging-top1" OnRowCreated="GridBPCSumeryBpc_RowCreated" OnDataBound="GridBPCSumery_DataBound" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4">
			<FooterStyle BackColor="#00369E" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
			<EditRowStyle BackColor="#2461BF" />
			<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
			<%--<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />--%>
			<AlternatingRowStyle BackColor="White" />
			<PagerStyle CssClass="pagination-ys" />

			<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
			<HeaderStyle CssClass="GVFixedHeader" BackColor="#00369E" Font-Bold="True" ForeColor="White" />


			<EmptyDataRowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField HeaderText="Branch" DataField="BRANCH" ItemStyle-HorizontalAlign="Center" />

				<%--		<asp:TemplateField>
							<HeaderTemplate>Branch</HeaderTemplate>
							<ItemTemplate>
								<asp:Label ForeColor="Black" Font-Bold="true" runat="server" Text='<%#Eval("BRANCH") %>'></asp:Label>
							</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
						</asp:TemplateField>--%>
				<asp:TemplateField>
					<HeaderTemplate>Mode</HeaderTemplate>

					<ItemTemplate>
						<asp:Label runat="server" ForeColor="Black" Font-Bold="true" Text='<%#Eval("UTILIZATION_DECODE") %>'></asp:Label>
					</ItemTemplate>
					<%--	<ItemStyle HorizontalAlign="Center" />--%>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>FE</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("REQ_AMT_FE") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
                    <%--<ItemStyle Width="10px" />--%>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_ReqFe" runat="server" />
						</div>
					</FooterTemplate>
                    
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>RS</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("REQ_AMT_RS") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_ReqRs" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>

				<asp:TemplateField>
					<HeaderTemplate>FE</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PSO_AMT_FE") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_PSOFe" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>RS</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PSO_AMT_RS") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_PSORs" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>FE</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PLANS_AMT_FE") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_PlansFe" runat="server" /><br />
							<hr />
							<asp:Label ID="lbl_SuppNdPlanFe" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>RS</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PLANS_AMT_RS") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_PlansRs" runat="server" />
							<br />
							<hr />
							<asp:Label ID="lbl_SuppNdPlanRs" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>FE</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("SUPP_AMT_FE") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_SuppFe" runat="server" />
							<br />
							<hr />
							<asp:Label ID="lbl_SuppNdPlanFe1" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>RS</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("SUPP_AMT_RS") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">
							<asp:Label ID="lbl_SuppRs" runat="server" /><br />
							<hr />
							<asp:Label ID="lbl_SuppNdPlanRs1" runat="server" />
						</div>
					</FooterTemplate>
				</asp:TemplateField>

				<asp:TemplateField>
					<HeaderTemplate>FE</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PRO_AMT_REC_FE") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">

							<asp:Label ID="lbl_BPCFe" runat="server" />

						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>RS</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PRO_AMT_REC_RS") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">

							<asp:Label ID="lbl_BPCRs" runat="server" />

						</div>
					</FooterTemplate>
				</asp:TemplateField>


				<asp:TemplateField>
					<HeaderTemplate>FE</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("AMT_REC_BPC_FE") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">

							<asp:Label ID="lbl_BPCFe" runat="server" />

						</div>
					</FooterTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<HeaderTemplate>RS</HeaderTemplate>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("AMT_REC_BPC_RS") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
					</ItemTemplate>
					<FooterTemplate>
						<div style="padding: 0 0 5px 0; text-align: right;">

							<asp:Label ID="lbl_BPCRs" runat="server" />

						</div>
					</FooterTemplate>
				</asp:TemplateField>
			</Columns>
			<EmptyDataTemplate>
				<p align="center"><strong>No Record Found</strong></p>
			</EmptyDataTemplate>

		</asp:GridView>

	</div>
	<div class="row" id="main_form" runat="server" style="font-size: 13px; margin-top: -25px;">
		<div class="form-group" style="width: 1024px; margin-left: 17px; margin-top: 17px;">
			<section id="secMessage" runat="server"></section>
		</div>
		<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">

			<div class="col-lg-8 col-md-6">
				<h3 runat="server" style="color: #00369E; margin: 0px">BPC Recommendations- <span runat="server" id="yearlabel"></span></h3>
			</div>

			<div class="col-lg-5 col-md-5" style="padding-left: 7px;">

				<div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

					<div class="box-body" style="padding-bottom: 2px;">


						<div class="row">
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px">
								<asp:TextBox Visible="false" ID="SrNoUpdate" runat="server"></asp:TextBox>
								<asp:DropDownList CssClass="form-control" DataValueField="BGT_TYPE_CODE" DataTextField="BGT_TYPE" ID="BGT_TYPE" runat="server" OnSelectedIndexChanged="BGT_TYPE_SelectedIndexChanged" AutoPostBack="True">
								</asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">

								<asp:DropDownList CssClass="form-control" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

							</div>
							<div hidden class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
								<asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="BPC" runat="server">
									<asp:ListItem Value=""> Select BPC</asp:ListItem>
									<asp:ListItem Value="B"> Annual</asp:ListItem>
									<asp:ListItem Value="2"> 2</asp:ListItem>
									<asp:ListItem Value="3"> 3</asp:ListItem>
									<asp:ListItem Value="4"> 4</asp:ListItem>
								</asp:DropDownList>
								<%--<asp:DropDownList CssClass="form-control" ID="APPENDIX" DataValueField="APPENDIX_CODE" AutoPostBack="true" DataTextField="APPENDIX_DECODE" runat="server" OnSelectedIndexChanged="APPENDIX_SelectedIndexChanged"></asp:DropDownList>--%>
							</div>

							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px" style="display: none;">

								<asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="ESTIMATION_TYPE" DataValueField="BGT_EST_CODE" DataTextField="BGT_EST_DECODE" runat="server" OnSelectedIndexChanged="ESTIMATION_TYPE_SelectedIndexChanged"></asp:DropDownList>
							</div>
						</div>
						<div class="row">




							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px">
								<asp:DropDownList CssClass="form-control" ID="PSOddl" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" runat="server" OnSelectedIndexChanged="PSOddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px">
								<asp:DropDownList CssClass="form-control" ID="ACASddl" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ACASddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
								<asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="Directorateddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Directorateddl_SelectedIndexChanged"></asp:DropDownList>
							</div>


							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px ">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Currency</asp:Label>
							<%--	<asp:RadioButtonList ID="" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="">
									<asp:ListItem Value="F" Selected="True"> Foreign</asp:ListItem>
									<asp:ListItem Value="P">Local</asp:ListItem>
								</asp:RadioButtonList>--%>
								<asp:RadioButtonList ID="rbListCurr"  RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbListCurr_SelectedIndexChanged"  Style="width: 99%"  runat="server">
																<asp:ListItem Value="P" Selected="True">&nbsp;Local</asp:ListItem>
																<asp:ListItem Value="F">&nbsp;Foreign</asp:ListItem>
															</asp:RadioButtonList>
								<%-- <asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="currancy" runat="server" OnSelectedIndexChanged="currancy_SelectedIndexChanged">
                                    <asp:ListItem Value="F"> FE</asp:ListItem>
                                    <asp:ListItem Value="P"> Rs</asp:ListItem>
                                </asp:DropDownList>--%>
							</div>

							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Requirement Type</asp:Label>
								<asp:RadioButtonList ID="rbListReqType" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbListReqType_SelectedIndexChanged">
									<asp:ListItem Value="" Selected="True"> &nbsp;&nbsp;ALL&nbsp;&nbsp;</asp:ListItem>
									<asp:ListItem Value="N"> &nbsp;&nbsp;NM&nbsp;&nbsp;</asp:ListItem>
									<asp:ListItem Value="M"> &nbsp;&nbsp;O & M</asp:ListItem>
								</asp:RadioButtonList>
								<%--<asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="REQUIREMENT_TYPE" DataValueField="REQUIREMENT_CODE" DataTextField="REQUIREMENT_DECODE" runat="server" OnSelectedIndexChanged="REQUIREMENT_TYPE_SelectedIndexChanged"></asp:DropDownList>--%>
							</div>

							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Purchase Type</asp:Label>
								<asp:RadioButtonList ID="rbListPurType" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbListPurType_SelectedIndexChanged">
									<asp:ListItem Value="" Selected="True"> &nbsp;&nbsp;ALL&nbsp;&nbsp;</asp:ListItem>
									<asp:ListItem Value="C"> &nbsp;&nbsp;CP&nbsp;&nbsp;</asp:ListItem>
									<asp:ListItem Enabled="true" Value="L"> &nbsp;&nbsp;LP</asp:ListItem>
								</asp:RadioButtonList>
								<%--<asp:DropDownList CssClass="form-control" ID="PURCHASE_TYPE" DataValueField="PURCHASE_CODE" DataTextField="PURCHASE_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="PURCHASE_TYPE_SelectedIndexChanged"></asp:DropDownList>--%>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px " style="height: 64px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Utilization Mode</asp:Label>
								<asp:RadioButtonList ID="rbListUtiMode" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbListUtiMode_SelectedIndexChanged">
									<asp:ListItem Value="" Selected="True">&nbsp;ALL&nbsp;</asp:ListItem>
									<asp:ListItem Value="C">&nbsp;OTC&nbsp;</asp:ListItem>
									<asp:ListItem Value="T">&nbsp;TOF&nbsp;</asp:ListItem>
									<asp:ListItem Value="R">&nbsp; RRC</asp:ListItem>
									<%-- <asp:ListItem Value="L"> LP</asp:ListItem>--%>
								</asp:RadioButtonList>
								<%--<asp:DropDownList CssClass="form-control" ID="UTILIZATION_MODE" DataValueField="UTILIZATION_CODE" DataTextField="UTILIZATION_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="UTILIZATION_MODE_SelectedIndexChanged"></asp:DropDownList>--%>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px" style="height: 64px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Priority </asp:Label>
								<asp:RadioButtonList ID="rbListPeriorty" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbListPeriorty_SelectedIndexChanged">
									<asp:ListItem Value="" Selected="True">  &nbsp;&nbsp;ALL &nbsp;&nbsp;</asp:ListItem>
									<asp:ListItem Value="1"> &nbsp;&nbsp; I &nbsp;&nbsp;</asp:ListItem>
									<asp:ListItem Value="2">  &nbsp;&nbsp;II &nbsp;&nbsp;</asp:ListItem>
									<asp:ListItem Value="3">  &nbsp;&nbsp;III</asp:ListItem>
									<%-- <asp:ListItem Value="L"> LP</asp:ListItem>--%>
								</asp:RadioButtonList>
								<%--<asp:DropDownList CssClass="form-control" ID="UTILIZATION_MODE" DataValueField="UTILIZATION_CODE" DataTextField="UTILIZATION_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="UTILIZATION_MODE_SelectedIndexChanged"></asp:DropDownList>--%>
							</div>
							<div id="RRCNoddl" runat="server" class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px" style="height: 64px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">RRC</asp:Label>
								<asp:DropDownList CssClass="form-control" ID="RRC_NoDDL" DataValueField="RRC_NO" DataextField="RRC_NO" AutoPostBack="true" runat="server" OnSelectedIndexChanged="RRC_NoDDL_SelectedIndexChanged" OnDataBound="RRC_NoDDL_DataBound"></asp:DropDownList>

							</div>
							<div id="TofAgnDiv" runat="server" class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px" style="height: 64px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Agency</asp:Label>
								<asp:DropDownList CssClass="form-control" ID="Tof_agencies" DataValueField="AGENCY_CODE" DataTextField="AGENCY_DECODE" runat="server" OnSelectedIndexChanged="Tof_agencies_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
							</div>

							<div id="TofDiv" runat="server" class="col-lg-4 col-md-4 buttom-margin padingRight1px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">TOF Head</asp:Label>
								<asp:DropDownList CssClass="form-control" ID="TOF_Headsddl" DataValueField="HEAD_CODE" DataTextField="HEAD_DESC_LONG" runat="server" OnSelectedIndexChanged="TOF_Headsddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
							</div>


							<div id="LPHeadDiv" runat="server" class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">LP Head</asp:Label>
								<asp:DropDownList CssClass="form-control" ID="LP_Headsddl" DataValueField="LP_HEAD_CODE" DataTextField="LP_HEAD_DECODE" runat="server" AutoPostBack="True" OnSelectedIndexChanged="LP_Headsddl_SelectedIndexChanged"></asp:DropDownList>
							</div>



							<div hidden class="col-lg-2 col-md-2 buttom-margin padingRight1px padingLeft1px">
								<asp:DropDownList CssClass="form-control" ID="Type" runat="server">
									<asp:ListItem Value=""> Select Type</asp:ListItem>
									<asp:ListItem Value="F"> Fresh</asp:ListItem>
									<asp:ListItem Value="C"> Carry Over</asp:ListItem>
								</asp:DropDownList>
							</div>
							<div class="col-lg-12 col-md-12">
								<%--<asp:TextBox runat="server" Width="32%" Font-Bold="true" ForeColor="Black" placeholder="Celling" ID="RRCCelling" Visible="false"></asp:TextBox>--%>
								<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" ValidationGroup="grp_est" Style="float: right; margin-top: 0px; width: 120px" Text="View All" ID="ViewAll" OnClick="ViewAll_Click" />
								<%--<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Visible="false" Style="float: right; margin-top: 0px; margin-right: 5px; width: 120px" Text="Save Celling" ID="SaveCeling" OnClick="SaveCeling_Click" />--%>
							</div>
							<div class="col-lg-12 col-md-12">
								<asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" ValidationGroup="grp_est" runat="server" />
							</div>

							<div class="col-lg-1">
							</div>
						</div>


					</div>

				</div>


			</div>
			<div id="Div3" runat="server" class="col-md-7 col-lg-7 padingLeft5px" style="margin-top: -27px;">

				<div class="col-lg-8 col-md-6">
					<h3 id="H4" runat="server" style="color: #00369E; margin: 0px">Summary</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H5" runat="server" style="color: #00369E; margin: 0px">(Amount in Million)</h4>
				</div>

				<div runat="server" id="Div4" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px; top: 0px; left: 0px;">

					<div class="box-body" style="padding-top: 2px">
						<div id="DivSumery1" runat="server" visible="false" style="padding-left: 5px; padding-right: 5px">
							<asp:GridView ID="gvSummaryInfo" Width="100%" ShowFooter="true" CssClass="Grid table-hover border-color" OnRowCreated="gvSummaryInfo_RowCreated" AllowPaging="false" runat="server" OnRowDataBound="gvSummaryInfo_RowDataBound" AutoGenerateColumns="false" CellPadding="4">
								<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
								<EditRowStyle BackColor="#2461BF" />
								<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
								<%--<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />--%>
								<AlternatingRowStyle BackColor="White" />
								<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
								<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
								<EmptyDataRowStyle BackColor="#EFF3FB" />
								<PagerStyle CssClass="pagination-ys" />
								<Columns>


									<%--<asp:TemplateField>
							<HeaderTemplate>UTILIZATION CODE </HeaderTemplate>
							<ItemTemplate>
								<asp:Label ID="lblWpnSys" runat="server" Text='<%#Eval("UTILIZATION_CODE") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>--%>
									<asp:TemplateField>
										<HeaderTemplate>FY</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="col1" Font-Bold="true" Text='<%#Eval("FY") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Ceiling</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("Ceiling") %>' ID="col2" CssClass="text-Align-span"></asp:Label>
										</ItemTemplate>

									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Order</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("Order") %>' ID="col3" CssClass="text-Align-span"></asp:Label>
										</ItemTemplate>

									</asp:TemplateField>

									<asp:TemplateField>
										<HeaderTemplate>Balance</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("Balance") %>' ID="col4" CssClass="text-Align-span"></asp:Label>
										</ItemTemplate>

									</asp:TemplateField>

								</Columns>
								<EmptyDataTemplate>
									<p align="center"><strong>No Record Found</strong></p>
								</EmptyDataTemplate>

							</asp:GridView>
						</div>
						<div id="DivSumery2" runat="server" style="padding-left: 5px; padding-right: 5px">
							<asp:GridView ID="GridViewMainSummery"  Width="100%" ShowFooter="true" CssClass="Grid table-hover border-color" AllowPaging="false" runat="server" OnRowDataBound="GridViewMainSummery_RowDataBound" AutoGenerateColumns="false" CellPadding="4">
								<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
								<EditRowStyle BackColor="#2461BF" />
								<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
								<%--<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />--%>
								<AlternatingRowStyle BackColor="White" />
								<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
								<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
								<EmptyDataRowStyle BackColor="#EFF3FB" />
								<PagerStyle CssClass="pagination-ys" />
								<Columns>


									<%--<asp:TemplateField>
							<HeaderTemplate>UTILIZATION CODE </HeaderTemplate>
							<ItemTemplate>
								<asp:Label ID="lblWpnSys" runat="server" Text='<%#Eval("UTILIZATION_CODE") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>--%>
									<asp:TemplateField>
										<HeaderTemplate>Mode</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="Utilizationlbl" ForeColor="Black" Font-Bold="true" Text='<%#Eval("UTILIZATION_DECODE") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Req Amt</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="col1" Font-Bold="true" Text='<%#Eval("REQ_AMT") %>' CssClass="text-Align-span"></asp:Label>
										</ItemTemplate>

									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>PSO Amt</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="col2" Font-Bold="true" Text='<%#Eval("PSO_AMT") %>' CssClass="text-Align-span"></asp:Label>
										</ItemTemplate>

									</asp:TemplateField>

									<asp:TemplateField>
										<HeaderTemplate>Plans Amt</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="col3" Font-Bold="true" Text='<%#Eval("PLANS_AMT") %>' CssClass="text-Align-span"></asp:Label>
										</ItemTemplate>

									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Supp Amt</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="col4" Font-Bold="true" Text='<%#Eval("SUPP_AMT") %>' CssClass="text-Align-span"></asp:Label>
										</ItemTemplate>

									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Pv BPC Rec</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="col5" Font-Bold="true" Text='<%#Eval("PROV_BPC_REC_AMT") %>' CssClass="text-Align-span"></asp:Label>
										</ItemTemplate>

									</asp:TemplateField>
                                    <asp:TemplateField>
										<HeaderTemplate>BPC Rec</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="col6" Font-Bold="true" Text='<%#Eval("BPC_REC_AMT") %>' CssClass="text-Align-span"></asp:Label>
										</ItemTemplate>

									</asp:TemplateField>
								</Columns>
								<EmptyDataTemplate>
									<p align="center"><strong>No Record Found</strong></p>
								</EmptyDataTemplate>

							</asp:GridView>
						</div>

						<div class="col-lg-12 col-md-12" style="padding-right: 6px;">
							<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="float: right; margin-top: 5px; width: 150px" Text="Detailed Summary BPC" ID="ViewSummaryBPC" OnClick="ViewSummaryBPC_Click" />
							<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="float: right; margin-top: 5px; width: 150px; margin-right: 10px" Text="Detailed Summary" ID="ViewSummary" OnClick="ViewSummary_Click" />
							<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="float: right; margin-top: 5px; width: 150px; margin-right: 10px" Text="Graphical View Prov" ID="GraphicalView" OnClick="GraphicalView_Click" />
							<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="float: right; margin-top: 5px; width: 150px; margin-right: 10px" Text="Graphical View BPC" ID="GraphicalViewBPC" OnClick="GraphicalViewBPC_Click" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">

			<div class="col-md-12 col-lg-12" style="padding-left: 0px; padding-right: 0px; padding-top: 0px">
				<div id="GridDiv" visible="false" runat="server" class="col-md-12 col-lg-12 " style="padding-left: 0px; padding-right: 0px;">
					<div class="col-lg-8 col-md-6">
						<h3 id="TReq" runat="server" style="color: #00369E; margin: 0px">Total Requirements</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h4 id="H1" runat="server" style="color: #00369E; margin: 0px">(Amount in Million)</h4>
					</div>

					<div runat="server" id="MainDetails" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px">

						<div class="box-body" style="padding-left: 0px; padding-right: 0px;">

							<div id="gridContainer" style="font-family: Arial; font-size: 18px;">
								<%--<input type="checkbox" checked data-toggle="toggle">

<input type="checkbox" data-toggle="toggle" data-on="Enabled" data-off="Disabled">--%>
								<asp:GridView ID="GridEstimates" DataKeyNames="FY,DTE_SYMBOL1,SER_NO,AMOUNT_DEMANDED_MIL,AMOUNT_REC_PLANS,AMOUNT_REC_DCAS_EL,PROV_AMOUNT_REC_BPC" AllowPaging="True" PageSize="5" OnRowDataBound="GridEstimates_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridEstimates_RowCreated" OnRowCommand="GridEstimates_RowCommand" OnPageIndexChanging="GridEstimates_PageIndexChanging" OnSelectedIndexChanged="GridEstimates_SelectedIndexChanged">
									<FooterStyle BackColor="#00369E" Font-Bold="True" ForeColor="White" />
									<EditRowStyle BackColor="#2461BF" />
									<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
									<%--<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />--%>
									<AlternatingRowStyle BackColor="White" />
									<PagerStyle CssClass="pagination-ys" />

									<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
									<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked test" BackColor="#00369E" Font-Bold="True" ForeColor="White" />
									<EmptyDataRowStyle BackColor="#EFF3FB" />



									<Columns>

										<%--<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>--%>
										<asp:TemplateField>
											<HeaderTemplate>SNO</HeaderTemplate>
											<ItemTemplate>
												<%--<asp:Label runat="server" ID="srno" Text='<%#Container.DataItemIndex+1%>' />--%>
												<p><%#Container.DataItemIndex+1%> <sub style="color: blue; font-size: 18px"><b><%#Eval("UTILIZATION_MODE1")%></b></sub></p>
											</ItemTemplate>
											<ItemStyle Width="40px" />
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>Description</HeaderTemplate>
											<ItemTemplate>
												<asp:Label ID="lblDescWithToolTip" runat="server" Text='<%#Eval("DESCRIPTION") %>' Visible="false"></asp:Label>
												<p style="padding-top: 0px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
													<code style="color: purple; font-size: 18px"><%#Eval("DTE_SYMBOL1")%></code>
													<code style="color: blue; font-size: 18px"><%#Eval("TOF_AGENCY")%></code>
													<asp:LinkButton ID="btnDes" ForeColor="Black" Height="23px" Font-Size="22px" display="initial" CssClass="vertical-align-mid" Text='<%#Eval("DESCRIPTION") %>' runat="server"
														data-toggle="popover" data-trigger="hover" />
												</p>
												<p style="padding-top: 0px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">

													<asp:LinkButton ID="SupplierRRC" ForeColor="Black" Height="23px" Font-Size="22px" display="initial" CssClass="vertical-align-mid" Text='<%#Eval("RRC_SUPPLIER") %>' runat="server"
														data-toggle="popover" data-trigger="hover" />
												</p>



											</ItemTemplate>
											<%--  <ItemStyle Width="310px" />--%>
										</asp:TemplateField>
										<asp:TemplateField Visible="false">
											<HeaderTemplate>Justification</HeaderTemplate>

											<ItemTemplate>
												<p style="padding-top: 9px; white-space: nowrap; width: 300px; text-overflow: ellipsis; overflow: hidden;">
													<asp:Label ID="lblJustWithToolTip" white-space="nowrap" Font-Bold="true" runat="server" Text='<%#Eval("JUSTIFICATION") %>'></asp:Label>
												</p>
											</ItemTemplate>
											<ItemStyle Width="210px" />
										</asp:TemplateField>
										<%--<asp:BoundField DataField="DTE_SYMBOL2" HeaderText="Dte" ItemStyle-BackColor="#EFEFEF">
											<ItemStyle BackColor="#EFEFEF"></ItemStyle>
										</asp:BoundField>--%>

										<asp:TemplateField>
											<HeaderTemplate>WPN SYS</HeaderTemplate>
											<ItemTemplate>
												<asp:Label ID="lblWpnSys" Height="23px" Font-Size="22px" Font-Bold="true" runat="server" Text='<%#Eval("WEAPON_SYS") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="150" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>PDIB Status</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Height="23px" Font-Size="22px" Font-Bold="true" Text='<%#Eval("PDIB_STATUS_DECODE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="50" />
										</asp:TemplateField>
										<%--<asp:TemplateField>
											<HeaderTemplate>Priority</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Text='<%#Eval("PRIORITY") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>--%>
										<%--<asp:TemplateField>
											<HeaderTemplate>Dem</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" ID="lblDEMANDED_LAST" Font-Bold="true" runat="server" Text='<%#Eval("AMOUNT_DEMANDED_LAST_YEAR_MIL") %>'></asp:Label>
											</ItemTemplate>

										</asp:TemplateField>--%>
										<asp:TemplateField>
											<HeaderTemplate>Alloc</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" position="absolute" ID="lblAlloc_LAST" Font-Bold="true" runat="server" Text='<%#Eval("AMOUNT_ALLOCATED_LAST_YEAR_MIL") %>'></asp:Label>
												<%--<asp:TextBox ID="lblAlloc_LAST" Font-Bold="true" CssClass="text-Align float-Right zoom" position="absolute" runat="server" Width="60px" Height="25px" Text='<%# Eval("AMOUNT_ALLOCATED_LAST_YEAR_MIL") %>' ></asp:TextBox>--%>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lblAlloc_LASTTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="100px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Current Req</HeaderTemplate>
											<ItemTemplate>
												<%--<asp:TextBox ID="lblALLOC" Font-Bold="true" CssClass="text-Align float-Right zoom" position="absolute" runat="server" Width="60px" Height="25px" Text='<%# Eval("AMOUNT_DEMANDED_MIL") %>' ></asp:TextBox>--%>
												<asp:Label CssClass="text-Align-span float-Right" position="absolute" Font-Bold="true" ID="lblALLOC" runat="server" Text='<%# Eval("AMOUNT_DEMANDED_MIL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="100px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Rec<br />
												PSO</HeaderTemplate>
											<ItemTemplate>
												<%--<asp:TextBox ID="RecPSO" Font-Bold="true" CssClass="text-Align float-Right zoom" position="absolute" runat="server" Width="60px" Height="25px" Text='<%# Eval("AMOUNT_REC_PSO") %>' ></asp:TextBox>--%>
												<asp:Label CssClass="text-Align-span float-Right" position="absolute" Font-Bold="true" ID="RecPSO" runat="server" Text='<%# Eval("AMOUNT_REC_PSO") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lqblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="100px" />
										</asp:TemplateField>
										<%--8--%>
										<asp:TemplateField>
											<HeaderTemplate>Rec<br />
												Plan</HeaderTemplate>
											<ItemTemplate>
												<%--<asp:TextBox ID="RecPlan" Font-Bold="true" CssClass="text-Align float-Right zoom" position="absolute" runat="server" Width="60px" Height="25px" Text='<%# Eval("AMOUNT_REC_PLANS") %>' ></asp:TextBox>--%>
												<asp:Label CssClass="text-Align-span float-Right" position="absolute" Font-Bold="true" ID="RecPlan" runat="server" Text='<%# Eval("AMOUNT_REC_PLANS") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lqblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="100px" />
										</asp:TemplateField>
										<%--9--%>
										<asp:TemplateField>
											<HeaderTemplate>Rec<br />
												SUPP</HeaderTemplate>
											<ItemTemplate>
												<%--<asp:TextBox ID="RecDCAS" Font-Bold="true" CssClass="text-Align float-Right zoom" position="absolute" runat="server" Width="60px" Height="25px" Text='<%# Eval("AMOUNT_REC_DCAS_EL") %>' ></asp:TextBox>--%>
												<asp:Label CssClass="text-Align-span float-Right" ID="RecDCAS" position="absolute" Font-Bold="true" runat="server" Text='<%# Eval("AMOUNT_REC_DCAS_EL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lqblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="100px" />
										</asp:TemplateField>



										<asp:TemplateField ItemStyle-HorizontalAlign="Center">
											<HeaderTemplate>Rec<br />
												Prov</HeaderTemplate>
											<ItemTemplate>
												<asp:TextBox runat="server" CssClass="hidden" ID="HiddenQuery" Text='<%#Eval("SER_NO")+"~"+Eval("FY")+"~"+Eval("DTE_SYMBOL2") %>'></asp:TextBox>

												<asp:CheckBox ID="SameAmtCheckBoxpro" AutoPostBack="true" OnCheckedChanged="SameAmtCheckBoxpro_CheckedChanged" runat="server" /><br />
												<asp:TextBox ID="txtNewAMt1" AutoCompleteType="None" autocomplete="off" Font-Bold="true" CssClass="text-Align float-Right" onblur="SaveProvAmt(this.id)" onkeypress="return onlyNumbers();" AutoPostBack="false" runat="server" Width="115px" Height="34px" Text='<%# DataBinder.Eval(Container.DataItem, "PROV_AMOUNT_REC_BPC") %>'></asp:TextBox>
												<asp:CheckBox ID="SameAmtCheckBox1pro" AutoPostBack="true" OnCheckedChanged="SameAmtCheckBox1pro_CheckedChanged" runat="server" />
											</ItemTemplate>
											<ItemStyle Width="115px" />
										</asp:TemplateField>
										<%-- <asp:TemplateField>
                                            <HeaderTemplate></HeaderTemplate>
                                            <ItemTemplate>
                                            
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                        </asp:TemplateField>--%>
										<%--  <asp:TemplateField>
                                            <HeaderTemplate></HeaderTemplate>
                                            <ItemTemplate>
                                             
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                        </asp:TemplateField>--%>

										<%--<asp:CheckBoxField DataField="IS_FINALIZED" SortExpression="IS_FINALIZED" />--%>
										<asp:TemplateField ItemStyle-HorizontalAlign="Center">
											<HeaderTemplate>Rec<br />
												BPC</HeaderTemplate>
											<ItemTemplate>
												<asp:CheckBox ID="SameAmtCheckBox" AutoPostBack="true" OnCheckedChanged="SameAmtCheckBox_CheckedChanged" runat="server" /><br />
												<asp:TextBox ID="txtNewAMt" AutoCompleteType="None" autocomplete="off" Font-Bold="true" CssClass="text-Align float-Right" onblur="SaveBPCAmt(this.id)" onkeypress="return onlyNumbers();" AutoPostBack="false" runat="server" Width="115px" Height="34px" Text='<%# DataBinder.Eval(Container.DataItem, "AMOUNT_REC_BPC") %>'></asp:TextBox>
												<asp:CheckBox CssClass="hidden" ID="SameAmtCheckBox1" AutoPostBack="true" OnCheckedChanged="SameAmtCheckBox1_CheckedChanged" runat="server" />
												<p style="height: 48px;"></p>
											</ItemTemplate>
											<ItemStyle Width="115px" />
										</asp:TemplateField>
										<%--<asp:CheckBoxField DataField='' HeaderText="Status" SortExpression="PLANS_DESCISION" />--%>

										<asp:TemplateField Visible="false">
											<HeaderTemplate>SerNo</HeaderTemplate>
											<ItemTemplate>

												<asp:Label runat="server" Text='<%#Eval("SER_NO") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField Visible="false">
											<HeaderTemplate>FY</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Text='<%#Eval("FY") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField Visible="false">
											<HeaderTemplate>DTE_Symbol</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Text='<%#Eval("DTE_SYMBOL2") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>



										<%--  <asp:TemplateField HeaderText="Decision">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtDecision" ToolTip='<%# Eval("BPC_DECISION") %>' data-placement="left" data-toggle="popover" data-trigger="hover" AutoCompleteType="None" Font-Bold="true" Style="vertical-align: middle" Font-Size="22px" TextMode="MultiLine" AutoPostBack="true" runat="server" Width="100%" Height="34px" Text='<%# DataBinder.Eval(Container.DataItem, "BPC_DECISION") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
										<%-- <asp:TemplateField>
                                            <HeaderTemplate></HeaderTemplate>
                                            <ItemTemplate>
                                            
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                        </asp:TemplateField>--%>
										<%-- <asp:TemplateField>
                                            <HeaderTemplate></HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="SameAmtCheckBox1" AutoPostBack="true" OnCheckedChanged="SameAmtCheckBox1_CheckedChanged" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                        </asp:TemplateField>--%>

										<asp:TemplateField>
											<HeaderTemplate></HeaderTemplate>
											<ItemTemplate>
												<asp:ImageButton ID="ImgBtndec" CssClass="vertical-align-mid" ImageUrl="../assets/img/1477300690_icon-136-document-edit.png" Height="20" runat="server"
													CommandName="AddDec" data-placement="left" data-toggle="popover" data-trigger="hover" ToolTip='<%# Eval("BPC_DECISION") %>' CommandArgument='<%#GetCommandArgument1(Eval("SER_NO"),Eval("FY"),Eval("DTE_SYMBOL2")) %>' />
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="30px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate></HeaderTemplate>
											<ItemTemplate>
												<asp:ImageButton ID="ImgBtndetail" CssClass="vertical-align-mid" ImageUrl="../Content/img/1479732623_application_view_detail.png" Height="20" runat="server"
													CommandName="ViewDetail1" ToolTip="View Detail" CommandArgument='<%#GetCommandArgument(Eval("SER_NO"),Eval("DESCRIPTION"),Eval("JUSTIFICATION"),Eval("AMOUNT_DEMANDED_MIL"),Eval("DTE_SYMBOL2")) %>' />
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="30px" />
										</asp:TemplateField>

									</Columns>

									<EmptyDataTemplate>
										<p align="center"><strong>No Record Found</strong></p>
									</EmptyDataTemplate>

								</asp:GridView>


							</div>
							<div class="col-lg-12 col-md-12" style="text-align: right; padding-right: 5px">
								<div class="col-lg-6 col-md-6" style="text-align: right; margin-top: 5px">
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="float: left; margin-top: 0px; margin-right: 5px; width: 120px" Text="Hide Details" ID="hideDetail" OnClick="hideDetail_Click" />
									<asp:TextBox runat="server" Width="32%" Font-Bold="true" Style="margin-top: 5px; margin-right: 5px; text-align: right" onkeypress="return onlyNumbers();" Font-Size="22px" ForeColor="Black" placeholder="Ceiling" ID="RRCCelling" Visible="false"></asp:TextBox>
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Visible="false" Style="float: right; margin-top: 0px; margin-right: 5px; width: 120px" Text="Update Ceiling" ID="UpdateCeling" OnClick="UpdateCeling_Click" />
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Visible="false" Style="float: right; margin-top: 7px; margin-right: 5px; width: 120px" Text="Save Ceiling" ID="SaveCeling" OnClick="SaveCeling_Click" />

								</div>
								<div class="col-lg-6 col-md-6" style="text-align: right;">
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="margin-top: 5px; width: 120px; display: none" Text="Save" ID="BtnSave" OnClick="BtnSave_Click1" />
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="margin-top: 5px; width: 120px" Text="Reset" ID="BtnReset" OnClick="BtnReset_Click1" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%--other grid--%>

			<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 0px; padding-top: 0px; margin-top: -20px; padding-right: 0px;" id="DivDetails">
				<div id="Div1" visible="false" runat="server" class="col-md-12 col-lg-12 " style="padding-left: 0px; padding-right: 0px; font-size: 16px">
					<div class="col-lg-8 col-md-6">
						<h3 id="H2" runat="server" style="color: #00369E; margin: 0px; float: left;">Description Detail</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h4 id="H3" runat="server" style="color: #00369E; margin: 0px"></h4>
					</div>
					<%--<div class="col-lg-6 col-md-6" style="padding-left: 0px;padding-right: 5px; "> --%>
					<div runat="server" id="Div2" class="box box-info " style="padding-left: 0px; padding-right: 0px">

						<div class="box-body" style="padding-left: 0px; padding-right: 0px;">

							<div id="gridContainer2" style="overflow: auto; max-height: 180px; width: 99%; font-family: Arial">


								<asp:GridView ID="GridViewEstDetail" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowCreated="GridViewEstDetail_RowCreated">
									<FooterStyle BackColor="#499BEA" Font-Bold="True" ForeColor="White" />
									<EditRowStyle BackColor="#2461BF" />
									<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
									<%--<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />--%>
									<AlternatingRowStyle BackColor="White" />
									<PagerStyle CssClass="pagination-ys" />

									<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
									<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked test" BackColor="#00369E" Font-Bold="True" ForeColor="White" />
									<EmptyDataRowStyle BackColor="#EFF3FB" />

									<Columns>

										<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>

										<asp:TemplateField>
											<HeaderTemplate>Part No</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0;">
													<asp:Label Text="" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle HorizontalAlign="Center" />
										</asp:TemplateField>


										<asp:TemplateField>
											<HeaderTemplate>Nomenclature</HeaderTemplate>
											<ItemTemplate>
												<asp:Label ID="lbl_NOMENCLATURE" Font-Bold="true" runat="server" Text='<%#Eval("NOMENCLATURE") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
												</div>
											</FooterTemplate>
											<ItemStyle HorizontalAlign="Center" />
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>Auth</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("QTY_AUTH") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />

										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Hold</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("HOLD_QTY") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label CssClass="text-Align-span" ID="dasd" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>U I</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("UNIT_OF_ISSUE") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
											</FooterTemplate>
											<ItemStyle HorizontalAlign="Center" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Price</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right1" Font-Bold="true" ID="lbl_PO_NO" runat="server" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
												</div>
											</FooterTemplate>

										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Qty</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("QTY") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />

										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Total Amt</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right1" Font-Bold="true" runat="server" Text='<%#Eval("NET_DEMANDED") %>'></asp:Label>
											</ItemTemplate>

										</asp:TemplateField>




									</Columns>
									<EmptyDataTemplate>
										<p align="center"><strong>No Record Found</strong></p>
									</EmptyDataTemplate>

								</asp:GridView>



							</div>

						</div>
					</div>
					<%--</div>--%>
					<%--<div class="col-lg-6 col-md-6" style="padding-left: 5px;padding-right: 0px; "> 
						<div runat="server" class="box box-info" style="padding-left: 0px; padding-right: 0px">

							<div class="box-body" style="padding-left: 0px;padding-right: 0px; "> 

								<div id="gridContainer3" style="overflow: auto; max-height: 180px; font-family: Arial">


									<asp:GridView ID="GridViewLog" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowCreated="GridViewLog_RowCreated">
										<FooterStyle BackColor="#499BEA" Font-Bold="True" ForeColor="White" />
										<EditRowStyle BackColor="#2461BF" />
										<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
										<%--<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />-->
										<AlternatingRowStyle BackColor="White" />
										<PagerStyle CssClass="pagination-ys" />

										<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
										<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked test" BackColor="#00369E" Font-Bold="True" ForeColor="White" />
										<EmptyDataRowStyle BackColor="#EFF3FB" />

										<Columns>

											<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>

											<asp:TemplateField>
												<HeaderTemplate>Part No</HeaderTemplate>
												<ItemTemplate>
													<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>
												</ItemTemplate>
												<FooterTemplate>
													<div style="padding: 0 0 5px 0;">
														<asp:Label Text="" runat="server" />
													</div>
												</FooterTemplate>
												<ItemStyle HorizontalAlign="Center" />
											</asp:TemplateField>


											<asp:TemplateField>
												<HeaderTemplate>Nomenclature</HeaderTemplate>
												<ItemTemplate>
													<asp:Label ID="lbl_NOMENCLATURE" Font-Bold="true" runat="server" Text='<%#Eval("NOMENCLATURE") %>'></asp:Label>
												</ItemTemplate>
												<FooterTemplate>
													<div style="padding: 0 0 5px 0">
													</div>
												</FooterTemplate>
												<ItemStyle HorizontalAlign="Center" />
											</asp:TemplateField>
                                            <asp:TemplateField>
												<HeaderTemplate>Auth</HeaderTemplate>
												<ItemTemplate>
													<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("QTY_AUTH") %>'></asp:Label>
												</ItemTemplate>
												<ItemStyle HorizontalAlign="Center" />

											</asp:TemplateField>
											<asp:TemplateField>
												<HeaderTemplate>Hold</HeaderTemplate>
												<ItemTemplate>
													<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("HOLD_QTY") %>'></asp:Label>
												</ItemTemplate>
												<ItemStyle HorizontalAlign="Center" />
												<FooterTemplate>
													<div style="padding: 0 0 5px 0">
														<asp:Label CssClass="text-Align-span" ID="dasd" runat="server" />
													</div>
												</FooterTemplate>
											</asp:TemplateField>

											<asp:TemplateField>
												<HeaderTemplate>LPR_MODE</HeaderTemplate>
												<ItemTemplate>
													<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("LPR_MODE") %>'></asp:Label>
												</ItemTemplate>
												<FooterTemplate>
												</FooterTemplate>
												<ItemStyle HorizontalAlign="Center" />
											</asp:TemplateField>
											<asp:TemplateField>
												<HeaderTemplate>Price</HeaderTemplate>
												<ItemTemplate>
													<asp:Label CssClass="text-Align-span float-Right1" Font-Bold="true" ID="lbl_PO_NO" runat="server" Text='<%#Eval("LPR") %>'></asp:Label>
												</ItemTemplate>
												<FooterTemplate>
													<div style="padding: 0 0 5px 0">
													</div>
												</FooterTemplate>

											</asp:TemplateField>
											<asp:TemplateField>
												<HeaderTemplate>DIFR</HeaderTemplate>
												<ItemTemplate>
													<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("DIFR") %>'></asp:Label>
												</ItemTemplate>
												<ItemStyle HorizontalAlign="Center" />

											</asp:TemplateField>
											<asp:TemplateField>
												<HeaderTemplate>DIFM</HeaderTemplate>
												<ItemTemplate>
													<asp:Label CssClass="text-Align-span float-Right1" Font-Bold="true" runat="server" Text='<%#Eval("DIFM") %>'></asp:Label>
												</ItemTemplate>

											</asp:TemplateField>

										</Columns>
										<EmptyDataTemplate>
											<p align="center"><strong>No Record Found</strong></p>
										</EmptyDataTemplate>

									</asp:GridView>



								</div>

							</div>
						</div>
					</div>--%>
				</div>
			</div>
		</div>

	</div>

</asp:Content>
