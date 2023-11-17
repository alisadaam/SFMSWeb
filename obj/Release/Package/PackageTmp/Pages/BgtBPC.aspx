<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtBPC.aspx.cs" Inherits="BMSWeb.Pages.BgtBPC" %>



<asp:Content ID="Content2" ContentPlaceHolderID="scripts" runat="server">
	<style>
		.resr > th {
			text-align: center !important;
		}

		.IframeDteGraph {
			width: 100%;
			height: 420px;
			border: none;
		}

		.sweet-alert input {
			width: 100%;
			box-sizing: border-box;
			border-radius: 3px;
			border: 1px solid #DC2525;
			height: 43px;
			margin-top: 10px;
			margin-bottom: 17px;
			font-size: 18px;
			box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.06);
			padding: 0 12px;
			display: none;
			-webkit-transition: all 0.3s;
			transition: all 0.3s;
		}

		.sweet-alert p {
			color: #797979;
			font-size: 16px;
			text-align: center;
			font-weight: 300;
			position: relative;
			text-align: left;
			float: none;
			margin: 0;
			padding: 0;
			line-height: normal;
		}

		.swal-wide {
			width: 783px !important;
			color: #000000 !important;
		}
	</style>
	<script type="text/javascript">
		function CalNetDem() {
			var UnitCost = Number($("#MainContent_UnitCost").val());
			var ReqQty = Number($("#MainContent_ReqQuantity").val());
			var UnitCost = Number($("#MainContent_UnitCost").val());
			var RepairCheck = Number($("#MainContent_RepairBit").val());
			if (ReqQty != "" && UnitCost != "") {
				var check = (ReqQty * UnitCost).toFixed(3);
				$("#MainContent_NetDemandedValue").val((ReqQty * UnitCost).toFixed(3));
				if (RepairCheck != "") {
					if (check > RepairCheck) {
						swal("Cancelled", "Your Entered Value Exceeded", "error");
						$("#MainContent_UnitCost").val('');
						$("#MainContent_ReqQuantity").val('');
						$("#MainContent_NetDemandedValue").val('');
					}
				}
			}
		}
		
		function counter(e) {
			var count = e.value.length;
			if (count > 2) {
				$("#MainContent_SearchPartNo").click();
			}
		}
		function IsFinalize() {
			swal({
				title: "<h4 style='color:black'>You have entered the data as described below. Please authenticate?</h4>",
				type: "warning",
				text: $("#Model_Finalize").html(),
				html: true,
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Yes, finalize it!",
				cancelButtonText: "No, cancel plz!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false
			}, function (isConfirm) {
				if (isConfirm) {
					$("#MainContent_FreezeDte").click();
				} else {
					swal("Cancelled", "Your imaginary file is safe :)", "error");
				}
			});
		}
		function Detail_type() {
			swal({
				title: "Are you sure",
				type: "warning",
				text: "You want to Enter Parts No detail",
				html: true,
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "No!",
				cancelButtonText: "Yes I want to Enter!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false
			}, function (isConfirm) {
				if (isConfirm) {
					swal("Misc", "Enter Current Requirement as Misc", "success");
					$("#MainContent_Est_Detail_Misc").click();

				} else {
					swal("Part No", "Now Enter Part No Details", "success");

					$("#MainContent_Est_Detail_Part").click();
				}
			});
		}

		$(document).ready(function () {
			var winwidth = $(window).width();
			if (winwidth < 1199) {
				$('#HEadingDiv').html('');
				$('#HEadingDiv').html('<div class="col-lg-6 col-md-6" style="padding-right: 0px;padding-left: 9px;"><h3  runat="server" style="color: #1D74D6; margin: 0px">User Req</h3></div><div class="col-lg-6 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amt in Million)</h4></div>');
			}
			else {
				$('#HEadingDiv').html('');
				$('#HEadingDiv').html(' <div class="col-lg-8 col-md-6"><h3  runat="server" style="color: #1D74D6; margin: 0px">User Requirements</h3></div><div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4></div>');
			}
			$(window).on('resize', function () {

				var winwidth = $(window).width();

				if (winwidth < 1199) {
					$('#HEadingDiv').html('');
					$('#HEadingDiv').html('<div class="col-lg-6 col-md-6" style="padding-right: 0px;padding-left: 9px;"><h3  runat="server" style="color: #1D74D6; margin: 0px">User Req</h3></div><div class="col-lg-6 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amt in Million)</h4></div>');
				}
				else {
					$('#HEadingDiv').html('');
					$('#HEadingDiv').html(' <div class="col-lg-8 col-md-6"><h3  runat="server" style="color: #1D74D6; margin: 0px">User Requirements</h3></div><div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4></div>');
				}
			});

		});
		function onlyNumbers(evt) {
			var e = event || evt; // for trans-browser compatibility
			var charCode = e.which || e.keyCode;
			if (charCode == 46)
				return true;
			else if (charCode > 31 && (charCode < 48 || charCode > 57 && charCode != 46))
				return false;

			return true;

		}
		function SlptDteValue(e) {
			//sessionStorage.setItem("SpltDte", e.options[e.selectedIndex].value);
		}
		function IndentorValue(e) {
			//sessionStorage.setItem("Indentor", e.options[e.selectedIndex].value);
		}
		function Estimates() {
			swal({
				title: "<h4 style='color:black'>Do you want to pick data from Estimates?</h4>",
				type: "warning",
				text: $("#gridContainer").html(),
				html: true,
				//showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Cancel!",
				//cancelButtonText: "No, cancel plz!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false
			}, function (isConfirm) {
				//if (isConfirm) {
				//	//$("#MainContent_FreezeDte").click();
				//} else {
				swal("Cancelled", "Your imaginary file is safe :)", "error");
				//}
			});
		}

		function AddBPCMain(e) {
			//alert(e);
			var values = e.toString().split(".");
			var t = sessionStorage.getItem("SpltDte");
			var s = sessionStorage.getItem("Indentor");
			
			$.ajax({
				type: "POST",
				contentType: "application/json; charset=utf-8",
				url: "BgtBPC.aspx/AddBPCMain",
				data: "{Appendix: '" + $("#MainContent_APPENDIX :selected").val() + "',Dte:'" + $("#MainContent_Directorateddl :selected").val() + "',Fy:'" + values[1] + "',SrNo:'" + values[0] + "',SpltDte:'" + t + "',Indentor:'" + s + "',BPCNo:'" + $("#MainContent_BPC :selected").val() + "'}",
				dataType: "json",
				//called on jquery ajax call success
				success: function (result) {
					sessionStorage.setItem("SpltDte", "");
					sessionStorage.setItem("Indentor", "");
					$("#MainContent_Hidden4BPC").click();
					swal("Success", "Inserted Successfully", "success");
				},
				//called on jquery ajax call failure
				error: function ajaxError(result) {

				}
			});
			//}
		}
	</script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<style>
		.FreezHeader {
			position: relative;
			top: expression(this.parentNode.parentNode.parentNode.scrollTop-1);
		}

		.swal-wide {
			/*width: 660px !important;*/
			color: #000000 !important;
		}

		.sweet-alert p {
			color: black !important;
		}

		.legend1 {
			display: block;
			width: 30% !important;
			padding: 0;
			margin-bottom: 20px;
			font-size: 21px;
			line-height: inherit;
			color: #333;
			border: 0;
			/* border-bottom: 1px solid #e5e5e5; */
		}

		.fieldset1 {
			/*padding: .35em .625em .75em;*/
			margin: 2px;
			border: 1px solid silver !important;
		}
	</style>
	<script>
		var prm = Sys.WebForms.PageRequestManager.getInstance();
		prm.add_endRequest(function () {
			var winwidth = $(window).width();
			if (winwidth < 1199) {
				$('#HEadingDiv').html('');
				$('#HEadingDiv').html('<div class="col-lg-6 col-md-6" style="padding-right: 0px;padding-left: 9px;"><h3  runat="server" style="color: #1D74D6; margin: 0px">User Req</h3></div><div class="col-lg-6 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amt in Million)</h4></div>');
			}
			else {
				$('#HEadingDiv').html('');
				$('#HEadingDiv').html(' <div class="col-lg-8 col-md-6"><h3  runat="server" style="color: #1D74D6; margin: 0px">User Requirements</h3></div><div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4></div>');
			}
			$(window).on('resize', function () {

				var winwidth = $(window).width();
				if (winwidth < 1199) {
					$('#HEadingDiv').html('');
					$('#HEadingDiv').html('<div class="col-lg-6 col-md-6" style="padding-right: 0px;padding-left: 9px;"><h3  runat="server" style="color: #1D74D6; margin: 0px">User Req</h3></div><div class="col-lg-6 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amt in Million)</h4></div>');
				}
				else {
					$('#HEadingDiv').html('');
					$('#HEadingDiv').html(' <div class="col-lg-8 col-md-6"><h3  runat="server" style="color: #1D74D6; margin: 0px">User Requirements</h3></div><div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4></div>');
				}
			});

		});

	</script>

	<div class="row" id="main_form" runat="server">
		<%-- Model display on finalize button data --%>

		<div hidden id="Model_Finalize" style="overflow: auto; height: 117px;">
			<asp:GridView ID="GridViewSumery1" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDataBound="GridViewSumery1_RowDataBound" OnRowCreated="GridViewSumery1_RowCreated">
				<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
				<EditRowStyle BackColor="#2461BF" />
				<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
				<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
				<AlternatingRowStyle BackColor="White" />
				<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
				<HeaderStyle CssClass="FreezHeader" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
				<EmptyDataRowStyle BackColor="#EFF3FB" />

				<Columns>




					<asp:TemplateField>
						<HeaderTemplate>Utilization Mode</HeaderTemplate>
						<ItemTemplate>
							<asp:Label runat="server" Text='<%#Eval("UTILIZATION_DECODE") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<div style="padding: 0 0 5px 0;">
								<asp:Label Text="" runat="server" />
							</div>
						</FooterTemplate>
					</asp:TemplateField>

					<asp:TemplateField ControlStyle-ForeColor="Red">
						<HeaderTemplate>FE</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("FE") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<div style="padding: 0 0 5px 0">
								<asp:Label ID="lblTotalFE" CssClass="text-Align-span" Text="" runat="server" />
							</div>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField ControlStyle-ForeColor="Red">
						<HeaderTemplate>RS</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("RS") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<div style="padding: 0 0 5px 0">
								<asp:Label ID="lblTotalRS" CssClass="text-Align-span" Text="" runat="server" />
							</div>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField ControlStyle-ForeColor="Red">
						<HeaderTemplate>LP</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("LP") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<div style="padding: 0 0 5px 0">
								<asp:Label ID="lblTotalRS" CssClass="text-Align-span" Text="" runat="server" />
							</div>
						</FooterTemplate>
					</asp:TemplateField>


				</Columns>


			</asp:GridView>
		</div>
		<%-- Model display on finalize button data --%>
		<div class="col-md-5 col-lg-5 padingRight5px">
			<asp:Panel runat="server" ID="EstPanal">
				<%--  <h3 style="color: #1D74D6; margin: 0px">Budget Estimates Stores</h3> Budget Estimates Stores --%>
				<div id="HEadingDiv">
					<div class="col-lg-8 col-md-6">
						<h3 id="BgtEstStor" runat="server" style="color: #1D74D6; margin: 0px">User Requirements</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h4 runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
					</div>
				</div>
				<div class="col-lg-12 col-md-12" style="padding-right: 0px; padding-left: 0px">

					<div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

						<div class="box-body" style="padding-bottom: 2px;">
							<asp:Panel runat="server" ID="PanelSub">
								<div class="row">
									<div class="row" style="margin-left: 0; margin-right: 0px">
										<div class="col-lg-4 col-md-4 buttom-margin padingRight1px">
											<asp:TextBox Visible="false" ID="SrNoUpdate" runat="server"></asp:TextBox>
											<asp:DropDownList CssClass="form-control" DataValueField="BGT_TYPE_CODE" DataTextField="BGT_TYPE" ID="BGT_TYPE" runat="server" OnSelectedIndexChanged="BGT_TYPE_SelectedIndexChanged" AutoPostBack="True">
											</asp:DropDownList>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="BGT_TYPE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Bgt Type Missing"></asp:RequiredFieldValidator>
										</div>
										<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
											<asp:DropDownList Enabled="false" CssClass="form-control" ID="APPENDIX" DataValueField="APPENDIX_CODE" AutoPostBack="true" DataTextField="APPENDIX_DECODE" runat="server" OnSelectedIndexChanged="APPENDIX_SelectedIndexChanged"></asp:DropDownList>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="APPENDIX" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Appendix Missing"></asp:RequiredFieldValidator>
										</div>


										<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px">

											<asp:DropDownList CssClass="form-control" Visible="false" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
											<div class="col-lg-4 col-md-4" style="padding-top: 7px; padding-right: 0px; padding-left: 10px;">
												<asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="Label1" runat="server">BPC No</asp:Label>
											</div>
											<div class="col-lg-8 col-md-8" style="padding: 0px;">
												<asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="BPC" runat="server">
													<asp:ListItem Value=""> Select BPC</asp:ListItem>
													<asp:ListItem Value="B"> Annual</asp:ListItem>
													<asp:ListItem Value="2"> 2</asp:ListItem>
													<asp:ListItem Value="3"> 3</asp:ListItem>
													<asp:ListItem Value="4"> 4</asp:ListItem>
												</asp:DropDownList>
											</div>
										</div>
									</div>


									<div class="col-lg-4 col-md-4 buttom-margin padingRight1px">

										<asp:DropDownList CssClass="form-control" ID="PSOddl" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" runat="server" OnSelectedIndexChanged="PSOddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="PSOddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="PSO Missing"></asp:RequiredFieldValidator>
									</div>
									<div id="ACASDiv" class="col-lg-4 col-md-4 col-md-4 buttom-margin padingLeft1px padingRight1px">
										<asp:DropDownList CssClass="form-control" ID="ACASddl" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ACASddl_SelectedIndexChanged"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ACASddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="ACAS Missing"></asp:RequiredFieldValidator>
									</div>
									<div id="DTEDiv" class="col-lg-4 col-md-4 buttom-margin padingLeft1px">
										<asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="Directorateddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Directorateddl_SelectedIndexChanged"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="Directorateddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Directorate Missing"></asp:RequiredFieldValidator>
									</div>

									<div class="col-lg-4 col-md-4 buttom-margin  padingRight1px">
										<asp:DropDownList Enabled="false" AutoPostBack="true" CssClass="form-control" ID="currancy" runat="server" OnSelectedIndexChanged="currancy_SelectedIndexChanged">
											<asp:ListItem Value=""> Select Currency</asp:ListItem>
											<asp:ListItem Value="F"> FE</asp:ListItem>
											<asp:ListItem Value="P"> Rs</asp:ListItem>
										</asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="currancy" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Currancy Missing"></asp:RequiredFieldValidator>
									</div>

									<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px">
										<asp:DropDownList CssClass="form-control" ID="PURCHASE_TYPE" DataValueField="PURCHASE_CODE" DataTextField="PURCHASE_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="PURCHASE_TYPE_SelectedIndexChanged"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="PURCHASE_TYPE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Purchase Type Missing"></asp:RequiredFieldValidator>
									</div>
									<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px">
										<asp:DropDownList Enabled="false" CssClass="form-control" ID="UTILIZATION_MODE" DataValueField="UTILIZATION_CODE" DataTextField="UTILIZATION_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="UTILIZATION_MODE_SelectedIndexChanged"></asp:DropDownList>

									</div>

									<div id="TofDiv" visible="false" runat="server" class="col-lg-4 col-md-4 buttom-margin  padingRight1px">
										<asp:DropDownList CssClass="form-control" ID="TOF_Headsddl" DataValueField="HEAD_CODE" DataTextField="HEAD_DESC_LONG" runat="server" AutoPostBack="True"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="TOF_Headsddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="TOF Head Missing"></asp:RequiredFieldValidator>
									</div>

									<div id="TofAgnDiv" visible="false" runat="server" class="col-lg-4 col-md-4 buttom-margin  padingLeft1px padingRight1px">
										<asp:DropDownList CssClass="form-control" ID="Tof_agencies" DataValueField="AGENCY_CODE" DataTextField="AGENCY_DECODE" runat="server" AutoPostBack="True"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator31" ControlToValidate="Tof_agencies" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="AGENCY Missing"></asp:RequiredFieldValidator>
									</div>
									<div class="col-lg-4 col-md-4 buttom-margin  padingRight1px" runat="server" visible="false" id="LPDiv">
										<asp:DropDownList CssClass="form-control" ID="LP_Headsddl" DataValueField="LP_HEAD_CODE" DataTextField="LP_HEAD_DECODE" runat="server" AutoPostBack="True" OnSelectedIndexChanged="LP_Headsddl_SelectedIndexChanged"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="LP_Headsddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="LP Head Missing"></asp:RequiredFieldValidator>

									</div>
									<div hidden class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
									<asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="REQUIREMENT_TYPE" DataValueField="REQUIREMENT_CODE" DataTextField="REQUIREMENT_DECODE" runat="server" OnSelectedIndexChanged="REQUIREMENT_TYPE_SelectedIndexChanged"></asp:DropDownList>
									
								</div>
								</div>

								<div class="col-lg-12 padingRight1px" runat="server" id="ViewGridDiv">
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Style="float: right;" Text="View BPC Req" ID="ViewBPC" OnClick="ViewBPC_Click" />
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Style="float: right; margin-right: 5px" Text="Add From Estimates" ID="btnViewGrid" OnClick="btnViewGrid_Click" />
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Style="float: right; margin-right: 5px" Text="Clear Selection" ID="Button1" OnClick="ReloadPage_Click" />

								</div>
							</asp:Panel>
						</div>

					</div>

					<div class="box box-primary">
						<div class="box-body">

							<div class="row  buttom-margin">
								<div class="col-lg-4 col-md-4 padingRight1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="SpltDirlbl" runat="server">Splt Dte</asp:Label>
									<asp:TextBox CssClass="form-control" placeholder="Splt Dte " ID="SpltDtetext" Visible="false" Enabled="false" runat="server"></asp:TextBox>
									<asp:DropDownList CssClass="form-control" ID="SpltDte1" runat="server" AutoPostBack="True">
										<asp:ListItem Value=""> Select Splt Dte</asp:ListItem>
										<asp:ListItem Value="WKS"> Dte of Works</asp:ListItem>
										<asp:ListItem Value="DIT"> Dte of IS(Bases)</asp:ListItem>
										<asp:ListItem Value="MGT"> Dte of LAS</asp:ListItem>
										<asp:ListItem Value="DAV"> Dte of Avionics</asp:ListItem>
										<asp:ListItem Value="SUP"> Dte of C&GE</asp:ListItem>
										<asp:ListItem Value="NA"> Not Applicable</asp:ListItem>
									</asp:DropDownList>
									<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="SpltDte1" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Splt Dte Missing"></asp:RequiredFieldValidator>--%>
								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px padingRight1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Project</asp:Label>
									<asp:DropDownList CssClass="form-control" ID="PROJECT_IDddl" DataValueField="PROJECT_CODE" DataTextField="PROJECT_DECODE" runat="server" OnSelectedIndexChanged="PROJECT_IDddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="PROJECT_IDddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Project Missing"></asp:RequiredFieldValidator>

								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Priorty</asp:Label>
									<asp:DropDownList CssClass="form-control" ID="Priorty" runat="server" AutoPostBack="True">
										<asp:ListItem Value=""> Select Priorty</asp:ListItem>
										<asp:ListItem Value="1"> I</asp:ListItem>
										<asp:ListItem Value="2"> II</asp:ListItem>
										<asp:ListItem Value="3"> III</asp:ListItem>
									</asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="Priorty" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Priorty Missing"></asp:RequiredFieldValidator>

								</div>
								<div class="col-lg-4 col-md-4 padingRight1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Indentor</asp:Label>
									<asp:DropDownList CssClass="form-control" ID="Indentorddl1" runat="server">
										<asp:ListItem Value=""> Select Indentor</asp:ListItem>
										<asp:ListItem Value="DCM"> DCM</asp:ListItem>
										<asp:ListItem Value="RRC"> RRC</asp:ListItem>
									</asp:DropDownList>
								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px padingRight1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Wpns Sys</asp:Label>
									<asp:DropDownList CssClass="form-control" ID="WEAPON_SYS" DataValueField="WPN_SYS_CODE" DataTextField="WEAPON_SYSTEM" runat="server" OnDataBound="WEAPON_SYS_DataBound" AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="WEAPON_SYS" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Weapon Sys Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">PDIB Status</asp:Label>
									<asp:DropDownList CssClass="form-control" ID="PDIB_STATUS" DataValueField="PDIB_STATUS_CODE" DataTextField="PDIB_STATUS_DECODE" runat="server" AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="PDIB_STATUS" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="PDIB Missing"></asp:RequiredFieldValidator>
								</div>

							</div>
							<div class="row  buttom-margin">

								<div class="col-lg-4 col-md-4 padingLeft1px ">
								</div>

							</div>

							<div class="row">

								<div class="col-lg-12 buttom-margin" runat="server" id="DesDiv">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Description</asp:Label>
									<asp:TextBox CssClass="Upper-case" Width="100%" ID="Description" placeholder="Description" runat="server" Height="50px" TextMode="MultiLine">
									</asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="Description" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Description Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-12 buttom-margin padingLeft1px" runat="server" visible="false" id="RrcDiv">
									<div class="col-lg-4 col-md-4 padingRight1px">
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">RRC</asp:Label>
										<asp:DropDownList CssClass="form-control" ID="RRC_NoDDL" DataValueField="RRC_NO" DataTextField="RRC_NO" AutoPostBack="true" runat="server" OnDataBound="RRC_NoDDL_DataBound" OnSelectedIndexChanged="RRC_NoDDL_SelectedIndexChanged"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator32" ControlToValidate="RRC_NoDDL" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="RRC Missing"></asp:RequiredFieldValidator>
									</div>
									<div class="col-lg-4 col-md-4 padingLeft1px padingRight1px">
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Supplier</asp:Label>
										<asp:TextBox CssClass="form-control" placeholder="Supplier " ID="Suppliertxt" Enabled="false" runat="server"></asp:TextBox>
									</div>

								</div>
								<div class="col-lg-12 buttom-margin" runat="server" id="Div5">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Justification</asp:Label>
									<asp:TextBox CssClass="Upper-case" Width="100%" ID="Justification" placeholder="Justification" runat="server" Height="50px" TextMode="MultiLine">
									</asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="Justification" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Justification Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 buttom-margin">
									<fieldset class="fieldset1">
										<legend style="margin-bottom: 0px !important; color: #3C8DBC; font-weight: 700; font-size: 14px">LFY's Details</legend>
										<%--<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Amount Dem</asp:Label>
											<asp:TextBox CssClass="text-Align" Width="40%" placeholder="Demanded " onkeypress="return onlyNumbers();" ID="AMT_DEMANDED_LAST_YEAR" AutoComplete="Off" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="AMT_DEMANDED_LAST_YEAR" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Demanded Last Year Missing"></asp:RequiredFieldValidator>
										</div>--%>
										<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Amount Aloc</asp:Label>
											<asp:TextBox CssClass="text-Align" Width="40%" onkeypress="return onlyNumbers();" placeholder="Allocated " ID="AMT_ALLOCATED_LAST_YEAR" AutoComplete="Off" runat="server"></asp:TextBox>
											<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="AMT_ALLOCATED_LAST_YEAR" runat="server" ForeColor="Red" ErrorMessage="Numbers Only Amt Alloc" Display="None" ValidationExpression="((\d+)((\.\d{1,3})?))$" ValidationGroup="grp_est"></asp:RegularExpressionValidator>--%>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator22" ControlToValidate="AMT_ALLOCATED_LAST_YEAR" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Allocated Last Year Missing"></asp:RequiredFieldValidator>
										</div>

									</fieldset>
								</div>
								<div class="col-lg-9 col-md-8" style="padding-right: 0px;">
									<div class="col-lg-6 col-md-6">
										<div hidden>
											<asp:Button runat="server" OnClick="Hidden4BPC_Click" Text="Hitrert" ID="Hidden4BPC" />
										</div>

										<asp:Button class="btn btn-primary btn-sm" runat="server" ID="ShowDetail" Text="Hide Detail" OnClick="ShowDetail_Click" Style="float: right; margin-top: 5px" />
									</div>
									<div class="col-lg-6 col-md-6">
										<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="float: right; margin-top: 5px" Text="Reset" ID="ReloadPage" OnClick="ReloadPage_Click" />

									</div>
								</div>
								<div class="col-lg-3 col-md-4" runat="server" id="btnAddDiv">

									<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="grp_est" Style="float: right; margin-top: 5px" Text="Save Demand" ID="btnSave" OnClick="btnSave_Click" />
								</div>
								<div class="col-lg-3 col-md-4 " runat="server" id="btnUpdateDiv">

									<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="grp_est" Style="float: right; margin-top: 5px" Text="Update Demand" ID="btnUpdate" OnClick="btnUpdate_Click" />
								</div>
								<div class="col-lg-12 col-md-12">
									<asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" ValidationGroup="grp_est" runat="server" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</asp:Panel>
		</div>
		<div id="Div3" runat="server" class="col-md-7 col-lg-7 padingLeft5px">
			
				<div class="col-lg-8 col-md-6">
					<h3 id="H3" runat="server" style="color: #1D74D6; margin: 0px">Summary</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H4" runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
				</div>

				<div runat="server" id="Div4" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px;">

					<div class="box-body" style="padding-top: 2px">

						<div style="overflow: hidden; height: 109px;">
							<asp:GridView ID="GridViewSummery" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowCreated="GridViewSummery_RowCreated" OnRowDataBound="GridViewSummery_RowDataBound">
								<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
								<EditRowStyle BackColor="#2461BF" />
								<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
								<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
								<AlternatingRowStyle BackColor="White" />
								<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
								<HeaderStyle CssClass="FreezHeader  resr" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
								<EmptyDataRowStyle BackColor="#EFF3FB" />

								<Columns>




									<asp:TemplateField>
										<HeaderTemplate>Utilization Mode</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" Text='<%#Eval("UTILIZATION_DECODE") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0;">
												<asp:Label Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>

									<asp:TemplateField ControlStyle-ForeColor="Red">
										<HeaderTemplate>Foreign Exchange</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("FE") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lblTotalFE" CssClass="text-Align-span" Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField ControlStyle-ForeColor="Green">
										<HeaderTemplate>Pak Rupee</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("RS") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lblTotalRS" CssClass="text-Align-span" Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField ControlStyle-ForeColor="Green">
										<HeaderTemplate>Pak Rupee</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("LP") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lblTotalRS" CssClass="text-Align-span" Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>


								</Columns>


							</asp:GridView>
						</div>
					</div>
				</div>
		
		</div>
		<div id="GridDiv" runat="server" class="col-md-7 col-lg-7 padingLeft5px">
			<div class="col-lg-8 col-md-7">
				<h3 id="TReq" runat="server" style="color: #1D74D6; margin: 0px">Total Requirements</h3>
			</div>
			<div class="col-lg-4 col-md-5" style="text-align: right; padding-top: 5px;">
				<h4 id="H1" runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
			</div>

			<div runat="server" id="MainDetails" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px">

				<div class="box-body">

					<div id="gridContainer" hidden style="overflow: auto; height: 479px;">
						<div>
							<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Splt Dte</asp:Label>
								<asp:DropDownList CssClass="form-control" onchange="SlptDteValue(this)" ID="SpltDte" runat="server" AutoPostBack="True">
									<asp:ListItem Value=""> Select Splt Dte</asp:ListItem>
									<asp:ListItem Value="WKS"> Dte of Works</asp:ListItem>
									<asp:ListItem Value="DIT"> Dte of IS(Bases)</asp:ListItem>
									<asp:ListItem Value="MGT"> Dte of LAS</asp:ListItem>
									<asp:ListItem Value="DAV"> Dte of Avionics</asp:ListItem>
									<asp:ListItem Value="SUP"> Dte of C&GE</asp:ListItem>
									<asp:ListItem Value="NA"> Not Applicable</asp:ListItem>
								</asp:DropDownList>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Directorateddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Directorate Missing"></asp:RequiredFieldValidator>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Indentor</asp:Label>
								<asp:DropDownList onchange="IndentorValue(this)" CssClass="form-control" ID="DropDownList2" runat="server">
									<asp:ListItem Value=""> Select Indentor</asp:ListItem>
									<asp:ListItem Value="DCM"> DCM</asp:ListItem>
									<asp:ListItem Value="RRC"> RRC</asp:ListItem>
								</asp:DropDownList>
							</div>
						</div>
						<asp:GridView ID="GridViewBAC" RowStyle-Wrap="false" ShowFooter="true" DataKeyNames="FY,DTE_SYMBOL,APPENDIX,SER_NO,DESCRIPTION,PROJECT_ID,PDIB_STATUS,PDIB_MEETING_NO,PRIORITY,EQUIPMENT_CAT,WEAPON_SYS,AMT_DEMANDED_LAST_YEAR,AMT_ALLOCATED_LAST_YEAR,JUSTIFICATION,CURRENT_REQ,ESTIMATED_TO_BE_PAID,BAC_NO,BAC_ALLOC_AMOUNT" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowCommand="GridViewBAC_RowCommand" OnRowDeleting="GridViewBAC_RowDeleting" OnRowDataBound="GridViewBAC_RowDataBound">
							<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
							<EditRowStyle BackColor="#2461BF" />
							<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
							<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
							<AlternatingRowStyle BackColor="White" />
							<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
							<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
							<EmptyDataRowStyle BackColor="#EFF3FB" />

							<Columns>

								<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>
								<asp:TemplateField>
									<HeaderTemplate>Description</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="RemarksBAC" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>

								<asp:TemplateField>
									<HeaderTemplate>Req</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" ID="lblEqpmt_Cat" runat="server" Text='<%#Eval("CURRENT_REQ") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="BAC_ALLOC_AMOUNT" Text="Total" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>PDIB</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("PDIB_STATUS_DECODE") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label ID="ESTIMATED_TO_BE_PAID_BAC" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Wpn sys</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("WEAPON_SYS") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="CURRENT_REQ_BAC" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Detail">
									<ItemTemplate>
										<asp:Label CssClass="btn btn-primary" onclick='<%# "AddBPCMain("+Eval("SER_NO")+"."+Eval("FY")+");" %>' runat="server" Text='Add'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
							</Columns>
							<EmptyDataTemplate>
								<p align="center"><strong>No Record Found</strong></p>
							</EmptyDataTemplate>

						</asp:GridView>

					</div>
					<div id="gridContainerBPC" style="overflow: auto; height: 295px;">

						<asp:GridView ID="GridViewBPC1" RowStyle-Wrap="false" DataKeyNames="DTE_CODE" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowCommand="GridViewBPC1_RowCommand" OnRowDeleting="GridViewBPC1_RowDeleting" OnRowDataBound="GridViewBPC1_RowDataBound" OnRowEditing="GridViewBPC1_RowEditing">
							<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
							<EditRowStyle BackColor="#2461BF" />
							<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
							<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
							<AlternatingRowStyle BackColor="White" />
							<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
							<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
							<EmptyDataRowStyle BackColor="#EFF3FB" />

							<Columns>

								<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>
								<asp:TemplateField>
									<HeaderTemplate>Description</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="Description" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Justification</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="Justification" runat="server" Text='<%#Eval("Justification") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<%--<asp:TemplateField>
									<HeaderTemplate>Amt Dem LFY</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("AMOUNT_DEMANDED_LAST_YEAR_MIL") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label ID="ESTIMATED_TO_BE_PAID_BAC" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>--%>
								<asp:TemplateField>
									<HeaderTemplate>Amt Alloc LFY</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" CssClass="text-Align-span" Text='<%#Eval("AMOUNT_ALLOCATED_LAST_YEAR_MIL") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="CURRENT_REQ_BAC" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Curr Req</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" ID="lblDem_Cat" runat="server" Text='<%#Eval("AMOUNT_DEMANDED_MIL") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="BAC_ALLOC_AMOUNT" Text="" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>PDIB</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="lblPDIB" runat="server" Text='<%#Eval("PDIB_STATUS") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="BAC_ALLOC_AMOUNT" Text="" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Wpn Sys</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="lblWpn_Cat" runat="server" Text='<%#Eval("WEAPON_SYS") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="BAC_ALLOC_AMOUNT" Text="" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Detail">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtnAddDes" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732623_application_view_detail.png" runat="server"
											CommandName="addDes" ToolTip="Add Description" CommandArgument='<%#Eval("SER_NO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Edit">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtnEdit" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/assets/img/1477300690_icon-136-document-edit.png" runat="server"
											CommandName="editRecord" ToolTip="Edit" CommandArgument='<%#Eval("SER_NO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Delete">
									<ItemTemplate>
										<asp:ImageButton ID="ImgBtndel2" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732554_trash.png" runat="server"
											CommandName="delete" ToolTip="Delete" CommandArgument='<%#Eval("SER_NO") %>' />
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
							</Columns>
							<EmptyDataTemplate>
								<p align="center"><strong>No Record Found</strong></p>
							</EmptyDataTemplate>

						</asp:GridView>
						<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="float: right; margin-top: 5px" Text="Finalize" ID="FinalizeModel" OnClick="FinalizeModel_Click" />
						<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="float: right; margin-top: 5px; display: none" Text="Finalize" ID="FreezeDte" OnClick="FreezeDte_Click" />

					</div>
				</div>

			</div>
		</div>

	</div>

	<div class="row" id="DetailsDiv" runat="server">
		<div id="SubFoamDiv" runat="server" class="col-md-5 col-lg-5 padingRight5px">
			<h3 id="desHEading" runat="server" style="color: #1D74D6; margin: 0px">Part No Detail</h3>
			<asp:Panel runat="server" ID="Sub_foamPanal">
				<div runat="server" id="Sub_foam" class="box box-primary">
					<div class="box-body">
						<div class="row">
							<div class="col-lg-12 buttom-margin" style="padding-left: 0px; padding-right: 0px">
								<div class="col-lg-12 padingRight1px">
									<asp:RadioButton Checked="true" AutoPostBack="true" GroupName="PartNoGrp" ID="PartNo" runat="server" Text="Part No" OnCheckedChanged="PartNo_CheckedChanged" />
									<asp:RadioButton AutoPostBack="true" GroupName="PartNoGrp" ID="MiscPart" runat="server" Text="Misc" OnCheckedChanged="MiscPart_CheckedChanged" />
								</div>
								<div class="col-lg-4 col-md-4" hidden>
									<div>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Server</asp:Label>
									</div>
									<div>
										<asp:DropDownList CssClass="form-control" ID="ServerDdl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ServerDdl_SelectedIndexChanged">
											<asp:ListItem Value=""> Select Server</asp:ListItem>
											<asp:ListItem Value="NRK1"> NRK1</asp:ListItem>
											<asp:ListItem Value="NRK2"> NRK2</asp:ListItem>
											<asp:ListItem Value="NRK3"> NRK3</asp:ListItem>
											<asp:ListItem Value="MSF1"> MSF1</asp:ListItem>
											<asp:ListItem Value="MSF2"> MSF2</asp:ListItem>
										</asp:DropDownList>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">SD No</asp:Label>
									</div>
									<div>
										<asp:DropDownList CssClass="form-control" ID="SDNoddl" DataValueField="SD" DataTextField="SD" runat="server" OnDataBound="SDNoddl_DataBound" OnSelectedIndexChanged="SDNoddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Nomenclature</asp:Label>
									</div>
									<div>
										<asp:TextBox Width="100%" ID="Nomenclature" CssClass="Upper-case" Enabled="false" ToolTip="" placeholder="Nomenclature" AutoComplete="Off" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator24" ControlToValidate="Nomenclature" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Nomenclature Missing"></asp:RequiredFieldValidator>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Button runat="server" ID="SearchPartNo" OnClick="SearchPartNo_Click" Style="margin-top: 15px; display: none" Text="Search" CssClass="btn btn-sm btn-primary" />
									</div>
								</div>

							</div>
							<div class="col-lg-12 buttom-margin" style="padding-left: 0px; padding-right: 0px">

								<div class="col-lg-4 col-md-4">
									<div>
										<asp:TextBox Visible="false" ID="BACAllocAmtHidn" runat="server"></asp:TextBox>
										<asp:TextBox Visible="false" ID="BACPArtAmtHidn" runat="server"></asp:TextBox>
										<asp:TextBox Visible="false" ID="SrNohidden" runat="server"></asp:TextBox>
										<asp:TextBox Visible="false" ID="DteNohidden" runat="server"></asp:TextBox>
										<asp:TextBox Visible="false" ID="SrNoSunHiden" runat="server"></asp:TextBox>
										<asp:HiddenField ID="RepairBit" runat="server"></asp:HiddenField>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Part No</asp:Label>
									</div>
									<div>
										<asp:TextBox Width="100%" ID="PartNotxt" CssClass="Upper-case" Enabled="false" onkeyup="counter(this)" ToolTip="" placeholder="Part No" AutoComplete="Off" runat="server"></asp:TextBox>
										<asp:DropDownList CssClass="form-control" Visible="false" Enabled="false" ID="PartNoDdl" DataValueField="PARTS_NO_NSN" DataTextField="PARTS_NO_NSN" runat="server" OnDataBound="PartNoDdl_DataBound" OnSelectedIndexChanged="PartNoDdl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator23" ControlToValidate="PartNoDdl" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Part NO Missing"></asp:RequiredFieldValidator>

										<asp:DropDownList CssClass="form-control" Visible="false" ID="PartNoDDlMisc" runat="server" OnSelectedIndexChanged="PartNoDDlMisc_SelectedIndexChanged" AutoPostBack="True">
											<asp:ListItem Value=""> Select Part No</asp:ListItem>
											<asp:ListItem Value="SERVICES"> Services</asp:ListItem>
											<asp:ListItem Value="LPLRMISCREQ"> LP/LR Misc Req</asp:ListItem>
											<asp:ListItem Value="UNFORESEEN"> Unforeseen Req</asp:ListItem>
											<asp:ListItem Value="REPAIR"> Repair/Maint</asp:ListItem>
											<asp:ListItem Value="TAXES"> Taxes/Duties</asp:ListItem>
										</asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator15" Visible="false" ControlToValidate="PartNoDDlMisc" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Part NO Missing"></asp:RequiredFieldValidator>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">ERRC</asp:Label>
									</div>
									<div>
										<%--<asp:TextBox Width="100%" ID="" placeholder="ERRC" runat="server"></asp:TextBox>--%>
										<asp:DropDownList CssClass="form-control" ID="ERRC" Enabled="false" DataValueField="ERRC_CODE" DataTextField="PROJECT_DECODE" AutoPostBack="true" runat="server" OnDataBound="ERRC_DataBound"></asp:DropDownList>

										<asp:RequiredFieldValidator ID="RequiredFieldValidator25" ControlToValidate="ERRC" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="ERRC Missing"></asp:RequiredFieldValidator>
									</div>
								</div>


								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Unit Of Issue</asp:Label>
									</div>
									<div>
										<asp:TextBox Width="100%" ID="Type1" placeholder="Unit Of Issue" CssClass="Upper-case" AutoComplete="Off" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator26" ControlToValidate="Type1" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Unit of Issue Missing"></asp:RequiredFieldValidator>
									</div>
								</div>

							</div>
							<div class="col-lg-12 buttom-margin" style="padding-left: 0px; padding-right: 0px">


								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Req Quantity</asp:Label>
									</div>
									<div>
										<asp:TextBox Width="100%" ID="ReqQuantity" onblur="CalNetDem()" CssClass="text-Align" onkeypress="return onlyNumbers();" AutoComplete="Off" AutoPostBack="true" placeholder="Req Quantity" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator29" ControlToValidate="ReqQuantity" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Req Quantity Missing"></asp:RequiredFieldValidator>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Unit Cost (Not in Million)</asp:Label>
									</div>
									<div>
										<asp:TextBox Width="100%" ID="UnitCost" onblur="CalNetDem()" CssClass="text-Align" onkeypress="return onlyNumbers();" AutoComplete="Off" placeholder="UnitCost" AutoPostBack="true" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator30" ControlToValidate="UnitCost" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Unit Cost Missing"></asp:RequiredFieldValidator>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Net Demanded</asp:Label>
									</div>

									<div>
										<asp:TextBox ID="NetDemandedValue" placeholder="Net Demanded Value" CssClass="text-Align" AutoComplete="Off" Enabled="false" runat="server"></asp:TextBox>
										<asp:TextBox ID="NetDemandedValue1" Visible="false" Enabled="false" AutoComplete="Off" runat="server"></asp:TextBox>
										<asp:TextBox ID="DteSymbol" Visible="false" runat="server"></asp:TextBox>
									</div>
								</div>
							</div>
						</div>
						<div style="text-align: center" class="row buttom-margin">
						</div>
						<div class="row buttom-margin">
							<fieldset class="fieldset1 buttom-margin" style="margin-left: 15px; margin-right: 15px;">
								<legend id="ReqLegend1" style="margin-bottom: 0px !important; color: #3C8DBC; font-weight: 700; font-size: 14px">Definitize Asset Details</legend>
								<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Auth Asset</asp:Label>
									<asp:TextBox Width="100px" ID="AuthAsset" placeholder="Auth Asset" CssClass="text-Align" onkeypress="return onlyNumbers();" AutoComplete="Off" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator256" ControlToValidate="AuthAsset" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Auth Asset Missing"></asp:RequiredFieldValidator>
								</div>

								<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Holding&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
									<asp:TextBox Width="100px" ID="Holding" placeholder="Holding" CssClass="text-Align" onkeypress="return onlyNumbers();" AutoComplete="Off" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator27" ControlToValidate="Holding" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Holding Missing"></asp:RequiredFieldValidator>

								</div>
							</fieldset>
						</div>
						<div class="col-lg-12 buttom-margin" style="padding-left: 0px; padding-right: 0px" runat="server" id="Div2">
							<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Justification</asp:Label>
							<asp:TextBox CssClass="Upper-case" Width="100%" ID="Justification1" placeholder="Justification" runat="server" Height="50px" TextMode="MultiLine">
							</asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="Justification1" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Justification Missing"></asp:RequiredFieldValidator>
						</div>
					</div>
					<asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" ValidationGroup="DetailAddEst" runat="server" />
					<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="DetailAddEst" Style="float: right; margin-top: 5px" Text="Save Item/Part No" ID="BtnSubSave" OnClick="BtnSubSave_Click" />
					<%--<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="DetailAddEst" Style="float: right; margin-top: 5px" Text="Update Item/Part No" ID="BtnUpdate1" OnClick="BtnUpdate1_Click" />--%>
				</div>
			</asp:Panel>
		</div>
		<div id="SubFormGrid" runat="server" class="col-md-7 col-lg-7 padingLeft5px">

			<div class="col-lg-8 col-md-6">
				<h3 id="H2" runat="server" style="color: #1D74D6; margin: 0px">Description Detail</h3>
			</div>
			<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
				<h4 id="H5" runat="server" style="color: #1D74D6; margin: 0px">(Amount in $/Rs)</h4>
			</div>
			<div class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px" runat="server" id="Div1">

				<div class="box-body" style="height: 245px; overflow: auto">
					<asp:GridView ID="GridBPC_detail" DataKeyNames="PARTS_NO_NSN,QTY,PRICE_PER_UNIT,DTE_CODE,UPDATE_FLAG,NET_DEMANDED,REC_NO" OnRowCommand="GridBPC_detail_RowCommand" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDeleting="GridBPC_detail_RowDeleting" OnRowDataBound="GridBPC_detail_RowDataBound">
						<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
						<EditRowStyle BackColor="#2461BF" />
						<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
						<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
						<AlternatingRowStyle BackColor="White" />
						<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
						<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
						<EmptyDataRowStyle BackColor="#EFF3FB" />

						<Columns>

							<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>

							<asp:TemplateField>
								<HeaderTemplate>Part No</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0;">
										<asp:Label Text="" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>


							<asp:TemplateField>
								<HeaderTemplate>Nom</HeaderTemplate>
								<ItemTemplate>
									<asp:Label ID="lbl_NOMENCLATURE" runat="server" Text='<%#Eval("NOMENCLATURE") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>




							<asp:TemplateField>
								<HeaderTemplate>Unit Issue</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("UNIT_OF_ISSUE") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Price Per Unit</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span" ID="lbl_PO_NO" runat="server" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Qty Auth</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span"  runat="server" Text='<%#Eval("QTY_AUTH") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Qty Hold</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span"  runat="server" Text='<%#Eval("HOLD_QTY") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Qty</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("QTY") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
										<asp:Label CssClass="text-Align-span" ID="PRICE_PER_UNIT" Text="Total" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Net Dem</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("NET_DEMANDED") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
										<asp:Label CssClass="text-Align-span" ID="V_NET_DEMANDEDa" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							
							<asp:TemplateField HeaderText="Delete">
								<ItemTemplate>
									<asp:ImageButton ID="ImgBtndel2" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732554_trash.png" runat="server"
										CommandName="delete" ToolTip="Delete" CommandArgument='<%#Eval("SER_NO") %>' />
								</ItemTemplate>
								<ItemStyle HorizontalAlign="Center" />
							</asp:TemplateField>

						</Columns>


					</asp:GridView>
					
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12">
					<p style="font-size:17px;    color: green;background-color: #BAFD9E;" class="bg-success">Please Click "Finalize Current Req" to update Current Req</p>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12" style="padding-right:0px">
				<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" Style="float: right; margin-top: 5px;margin-right: 10px;" Text="Finalize Current Req" ID="FinalizeCurrentReq" OnClick="FinalizeCurrentReq_Click" />
				</div>
			</div>

		</div>
	</div>

	<asp:Button runat="server" ID="Est_Detail_Misc" OnClick="Est_Detail_Misc_Click" Style="display: none" />
	<asp:Button runat="server" ID="Est_Detail_Part" OnClick="Est_Detail_Part_Click" Style="display: none" />
</asp:Content>
