<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtRRCCeilingManager.aspx.cs" Inherits="BMSWeb.Pages.BgtRRCCeilingManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
	<style>
		th {
			text-align: center;
		}

		.form-control {
			height: 30px !important;
			font-size: 13px !important;
			font-weight: 600;
			color: black;
		}

		option {
			font-weight: normal;
			display: block;
			white-space: pre;
			min-height: 1.2em;
			padding: 0px 2px 1px;
			font-weight: 700;
		}

		.popover-title {
			white-space: pre-wrap;
			font-weight: 500;
			font-size: 22px;
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
	</style>
	<script>
		$(document).ready(function () {
			$(".sidebar-toggle").click();
			$('[data-toggle="popover"]').popover();

		});
		function DirectorateMissing() {
			swal({
				title: "Error!",
				text: "System Error. Please Select Directorate",
				type: "error",
				confirmButtonColor: "rgb(53, 155, 255)"
			});
			//swal("Inserted!", "Record Inserted Sucessfully.", "success", "rgb(53, 155, 255)");
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
	</script>
	<div class="row" id="main_form" runat="server">

		<div class="col-md-12 col-lg-12 col-sm-12 padingRight5px" style="padding-left: 11px;">

			<div class="col-lg-12 col-md-12 col-sm-12">
				<h3 runat="server" style="color: #00369E; margin: 0px">RRC Ceiling Manager</h3>
			</div>

			<div class="col-lg-8 col-md-8 col-sm-12" style="padding-left: 7px;">

				<div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

					<div class="box-body" style="padding-bottom: 2px;">

						<div class="row">

							<div class="col-lg-3 col-md-3 col-sm-3 buttom-margin padingRight1px">
								<%--<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">PSO</asp:Label><br />--%>
								<asp:DropDownList CssClass="form-control" ID="PSOddl" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" runat="server" OnSelectedIndexChanged="PSOddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 buttom-margin padingLeft1px padingRight1px">
								<%--<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">ACAS</asp:Label><br />--%>
								<asp:DropDownList CssClass="form-control" ID="ACASddl" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ACASddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 buttom-margin  padingLeft1px padingRight1px">
								<%--<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Directorate</asp:Label><br />--%>
								<asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="Directorateddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Directorateddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 buttom-margin padingLeft1px ">
								<%--<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">FY</asp:Label><br />--%>
								<asp:DropDownList CssClass="form-control" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

							</div>
						</div>
						<div class="row">
							

							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px padingLeft1px" hidden>
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Currency</asp:Label>
								<asp:RadioButtonList ID="rbListCurr" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbListCurr_SelectedIndexChanged" Style="width: 99%" runat="server">
									<asp:ListItem Value="P">&nbsp;Local</asp:ListItem>
									<asp:ListItem Value="F" Selected="True">&nbsp;Foreign</asp:ListItem>
								</asp:RadioButtonList>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin  padingLeft1px" hidden>
								<%--<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">RRC</asp:Label>--%>
								<asp:DropDownList CssClass="form-control" ID="RRC_NoDDL" DataValueField="RRC_NO" DataTextField="RRC_NO" AutoPostBack="true" runat="server" OnDataBound="RRC_NoDDL_DataBound" OnSelectedIndexChanged="RRC_NoDDL_SelectedIndexChanged"></asp:DropDownList>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div id="CeilingDetailDivFE" runat="server" class="col-lg-6 col-md-6 col-sm-6">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<h3 id="H3" runat="server" style="color: #00369E; margin: 0px">Ceiling Detail ($)</h3>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H4" runat="server" style="color: #00369E; margin: 0px">(Amount in Million)</h4>
				</div>
			</div>
			<div class="row">


				<div class="col-lg-12 col-md-12 col-sm-12">


					<div runat="server" id="Div4" class="box box-info" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px;">

						<div class="box-body" style="padding-top: 2px">

							<div style="font-family: Arial; font-size: 16px; color: black; overflow-y: hidden">
								<asp:GridView ID="GridRRCCeilingDetail" AllowPaging="true" DataKeyNames="" OnRowDataBound="GridRRCCeilingDetail_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridRRCCeilingDetail_RowCreated" OnRowCommand="GridRRCCeilingDetail_RowCommand" OnPageIndexChanging="GridRRCCeilingDetail_PageIndexChanging">
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
										<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#499BEA"></asp:BoundField>

										<%--<asp:TemplateField>
									<HeaderTemplate>FY</HeaderTemplate>
									<ItemTemplate>
										<asp:Label  runat="server" ID="srno" Text='<%#Eval("FY")%>' />
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>--%>
										<asp:TemplateField>
											<HeaderTemplate>Directorate</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("DTE_SYMBOL") %>'></asp:Label>

											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Ceiling Amount</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("CEILING_AMT_FE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="100px" />
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalCEILING_AMT_FE" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Allocation Date</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("FormatedAllocDateFE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="150px" />
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Order Amount">
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("TOTAL_AMT_FE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="100px" />
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalOrder_AMT_FE" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Balance">
											<ItemTemplate>
												<asp:Label BackColor='<%#GetBGChecked(Eval("BalanceColorFE")) %>' ForeColor='<%#GetForColorChecked(Eval("BalanceColorFE")) %>' runat="server" Font-Bold="true" Text='<%#Eval("BalanceFE")%>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="100px" />
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalBalance_AMT_FE" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Add Alloc</HeaderTemplate>
											<ItemTemplate>
												<asp:ImageButton ID="ImgBtndetail" CssClass="vertical-align-mid" ImageUrl="../Content/img/1479732623_application_view_detail.png" Height="20" runat="server"
													CommandName="AddAllocDetail" ToolTip="Add Alloc Detail" CommandArgument='<%#GetCommandArgument(Eval("CEILING_AMT_RS"),Eval("CEILING_AMT_FE")) %>' />
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="50px" />
										</asp:TemplateField>

									</Columns>

									<%--	<EmptyDataTemplate>
										<p align="center"><strong>No Record Found</strong></p>
									</EmptyDataTemplate>--%>
								</asp:GridView>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="CeilingDetailDivRs" runat="server" class="col-lg-6 col-md-6 col-sm-6">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<h3 id="H7" runat="server" style="color: #00369E; margin: 0px">Ceiling Detail Rs</h3>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H9" runat="server" style="color: #00369E; margin: 0px">(Amount in Million)</h4>
				</div>
			</div>
			<div class="row">


				<div class="col-lg-12 col-md-12 col-sm-12">


					<div runat="server" id="Div6" class="box box-info" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px;">

						<div class="box-body" style="padding-top: 2px">

							<div style="font-family: Arial; font-size: 16px; color: black; overflow-y: hidden">
								<asp:GridView ID="GridRRCCeilingDetailRs" AllowPaging="true" DataKeyNames="" OnRowDataBound="GridRRCCeilingDetailRs_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridRRCCeilingDetailRs_RowCreated" OnRowCommand="GridRRCCeilingDetailRs_RowCommand" OnPageIndexChanging="GridRRCCeilingDetailRs_PageIndexChanging">
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
										<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#499BEA"></asp:BoundField>

										<%--<asp:TemplateField>
									<HeaderTemplate>FY</HeaderTemplate>
									<ItemTemplate>
										<asp:Label  runat="server" ID="srno" Text='<%#Eval("FY")%>' />
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>--%>
										<asp:TemplateField>
											<HeaderTemplate>Directorate</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("DTE_SYMBOL") %>'></asp:Label>

											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>Ceiling Amount</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("CEILING_AMT_RS") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="100px" />
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalCEILING_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>


										<asp:TemplateField>
											<HeaderTemplate>Allocation Date</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("FormatedAllocDate") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="150px" />
										</asp:TemplateField>

										<asp:TemplateField HeaderText="Order Amount">
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("TOTAL_AMT_RS") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="100px" />
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalOrder_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>

										<asp:TemplateField HeaderText="Balance">
											<ItemTemplate>
												<asp:Label BackColor='<%#GetBGChecked(Eval("BalanceColor")) %>' ForeColor='<%#GetForColorChecked(Eval("BalanceColor")) %>' runat="server" Font-Bold="true" Text='<%#Eval("Balance")%>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="100px" />
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalBalance_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Add Alloc</HeaderTemplate>
											<ItemTemplate>
												<asp:ImageButton ID="ImgBtndetail" CssClass="vertical-align-mid" ImageUrl="../Content/img/1479732623_application_view_detail.png" Height="20" runat="server"
													CommandName="AddAllocDetail" ToolTip="Add Alloc Detail" CommandArgument='<%#GetCommandArgument(Eval("CEILING_AMT_RS"),Eval("CEILING_AMT_FE")) %>' />
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="50px" />
										</asp:TemplateField>

									</Columns>

								</asp:GridView>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="DetailsDiv" runat="server" visible="false">
			<div class="col-md-12 col-lg-12 col-sm-12">


				<div id="SubFoamDiv" runat="server" class="col-md-5 col-lg-5 padingRight5px">
					<h3 runat="server" style="color: #00369E; margin: 0px">Additional Allocation/Withdrawls of RRC ceiling</h3>
					<div id="DivDataEntryRS" runat="server" visible="false">

						<h3 runat="server" style="color: #00369E; margin: 0px">Data Entry Rs</h3>
						<asp:Panel runat="server" ID="Sub_foamPanal">
							<div runat="server" id="Sub_foam" class="box box-primary">
								<div class="box-body">

									<div class="col-lg-12 buttom-margin" style="padding-left: 0px; padding-right: 0px">
										<div class="row">
											<div class="col-lg-4 col-md-4" hidden>
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Date</asp:Label><br />
												<asp:TextBox AutoCompleteType="None" ID="txtAllocDate" runat="server" Width="55%" placeholder="Date" CssClass=" input-sm datepicker inline form-control"></asp:TextBox>
												<span style="background: #00369E;" class=" form-control inline">
													<i style="color: #FFF;" class="fa fa-calendar"></i>
												</span>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="txtAllocDate" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Date Missing"></asp:RequiredFieldValidator>--%>
											</div>
											<div class="col-lg-4 col-md-4">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Initial Ceiling</asp:Label><br />
												<asp:TextBox Width="100%" ID="txtInitialCeiling" CssClass="text-Align float-Right" Enabled="false" onkeypress="return onlyNumbers();" placeholder="Initial Ceiling" AutoComplete="Off" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtInitialCeiling" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Initial Ceiling Missing"></asp:RequiredFieldValidator>
											</div>
											<div class="col-lg-4 col-md-4">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Action</asp:Label>
												<asp:DropDownList CssClass="form-control" ID="Actionddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Actionddl_SelectedIndexChanged">
													<asp:ListItem Value=""> Select Action</asp:ListItem>
													<asp:ListItem Value="A"> Additional</asp:ListItem>
													<asp:ListItem Value="B"> Withdrawl</asp:ListItem>
												</asp:DropDownList>
												<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Actionddl" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Action Missing"></asp:RequiredFieldValidator>
											</div>

											<div class="col-lg-4 col-md-4" runat="server" id="AdditonCeilingDiv">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Additional Ceiling</asp:Label><br />
												<asp:TextBox Width="100%" ID="txtAdditionalCeiling" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" placeholder="Additional Ceiling" AutoComplete="Off" runat="server"></asp:TextBox>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtAdditionalCeiling" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Additional Ceiling Missing"></asp:RequiredFieldValidator>--%>
											</div>
											<div class="col-lg-4 col-md-4" runat="server" id="WithdrwalDiv" visible="false">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Withdrawl Ceiling</asp:Label><br />
												<asp:TextBox Width="100%" ID="txtWithdrawlCeiling" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" placeholder="Withdrawl Ceiling" AutoComplete="Off" runat="server"></asp:TextBox>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtWithdrawlCeiling" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Withdrawl Ceiling Missing"></asp:RequiredFieldValidator>--%>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4 col-md-4">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Net Ceiling</asp:Label><br />
												<asp:TextBox Width="100%" Enabled="false" ID="txtNetCeiling" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" placeholder="Net Ceiling" AutoComplete="Off" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtNetCeiling" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Net Ceiling Missing"></asp:RequiredFieldValidator>
											</div>

										</div>
										<div class="row">
											<div class="col-lg-4 col-md-4" hidden>
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Currency</asp:Label><br />
												<asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="currancyddl" runat="server">
													<asp:ListItem Value=""> Select Currency</asp:ListItem>
													<asp:ListItem Value="F"> FE</asp:ListItem>
													<asp:ListItem Value="P"> Rs</asp:ListItem>
												</asp:DropDownList>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="currancyddl" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Currancy Missing"></asp:RequiredFieldValidator>--%>
											</div>
											<div class="col-lg-12 col-md-12">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Remarks</asp:Label><br />
												<asp:TextBox CssClass="Upper-case" Width="100%" ID="txtRemarks" placeholder="Remarks" runat="server" Height="50px" TextMode="MultiLine"></asp:TextBox>
												<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtRemarks" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Remarks Missing"></asp:RequiredFieldValidator>
											</div>
										</div>
										<div class="row" style="padding: 15px">
											<asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" ValidationGroup="AllocCeiling" runat="server" />
											<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="AllocCeiling" Style="float: right; margin-top: 5px" Text="Save" ID="BtnSubSave" OnClick="BtnSubSave_Click" />
										</div>
									</div>



								</div>
								<%--<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="DetailAddEst" Style="float: right; margin-top: 5px" Text="Update Item/Part No" ID="BtnUpdate1" OnClick="BtnUpdate1_Click" />--%>
							</div>
						</asp:Panel>
					</div>
					<div id="DivDataEntryFE" runat="server" visible="false">
						<h3 runat="server" style="color: #00369E; margin: 0px">Data Entry $</h3>
						<asp:Panel runat="server" ID="Panel1">
							<div runat="server" id="Div2" class="box box-primary">
								<div class="box-body">

									<div class="col-lg-12 buttom-margin" style="padding-left: 0px; padding-right: 0px">
										<div class="row">
											<div class="col-lg-4 col-md-4" hidden>
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Date</asp:Label><br />
												<asp:TextBox AutoCompleteType="None" ID="DateFE" runat="server" Width="55%" placeholder="Date" CssClass=" input-sm datepicker inline form-control"></asp:TextBox>
												<span style="background: #00369E;" class=" form-control inline">
													<i style="color: #FFF;" class="fa fa-calendar"></i>
												</span>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="txtAllocDate" ValidationGroup="AllocCeilingFE" runat="server" Display="None" ErrorMessage="Date Missing"></asp:RequiredFieldValidator>--%>
											</div>
											<div class="col-lg-4 col-md-4">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Initial Ceiling</asp:Label><br />
												<asp:TextBox Width="100%" ID="txtInitialCeilingFE" CssClass="text-Align float-Right" Enabled="false" onkeypress="return onlyNumbers();" placeholder="Initial Ceiling" AutoComplete="Off" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtInitialCeilingFE" ValidationGroup="AllocCeilingFE" runat="server" Display="None" ErrorMessage="Initial Ceiling Missing"></asp:RequiredFieldValidator>
											</div>
											<div class="col-lg-4 col-md-4">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Action</asp:Label>
												<asp:DropDownList CssClass="form-control" ID="ActionddlFE" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ActionddlFE_SelectedIndexChanged">
													<asp:ListItem Value=""> Select Action</asp:ListItem>
													<asp:ListItem Value="A"> Additional</asp:ListItem>
													<asp:ListItem Value="B"> Withdrawl</asp:ListItem>
												</asp:DropDownList>
												<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ActionddlFE" ValidationGroup="AllocCeilingFE" runat="server" Display="None" ErrorMessage="Action Missing"></asp:RequiredFieldValidator>
											</div>

											<div class="col-lg-4 col-md-4" runat="server" id="AdditonCeilingDivFE">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Additional Ceiling</asp:Label><br />
												<asp:TextBox Width="100%" ID="txtAdditionalCeilingFE" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" placeholder="Additional Ceiling" AutoComplete="Off" runat="server"></asp:TextBox>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtAdditionalCeiling" ValidationGroup="AllocCeilingFE" runat="server" Display="None" ErrorMessage="Additional Ceiling Missing"></asp:RequiredFieldValidator>--%>
											</div>
											<div class="col-lg-4 col-md-4" runat="server" id="WithdrwalDivFE" visible="false">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Withdrawl Ceiling</asp:Label><br />
												<asp:TextBox Width="100%" ID="txtWithdrawlCeilingFE" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" placeholder="Withdrawl Ceiling" AutoComplete="Off" runat="server"></asp:TextBox>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtWithdrawlCeiling" ValidationGroup="AllocCeilingFE" runat="server" Display="None" ErrorMessage="Withdrawl Ceiling Missing"></asp:RequiredFieldValidator>--%>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4 col-md-4">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Net Ceiling</asp:Label><br />
												<asp:TextBox Width="100%" Enabled="false" ID="txtNetCeilingFE" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" placeholder="Net Ceiling" AutoComplete="Off" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtNetCeilingFE" ValidationGroup="AllocCeilingFE" runat="server" Display="None" ErrorMessage="Net Ceiling Missing"></asp:RequiredFieldValidator>
											</div>

										</div>
										<div class="row">
											<div class="col-lg-4 col-md-4" hidden>
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Currency</asp:Label><br />
												<asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="DropDownList2" runat="server">
													<asp:ListItem Value=""> Select Currency</asp:ListItem>
													<asp:ListItem Value="F"> FE</asp:ListItem>
													<asp:ListItem Value="P"> Rs</asp:ListItem>
												</asp:DropDownList>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="currancyddl" ValidationGroup="AllocCeilingFE" runat="server" Display="None" ErrorMessage="Currancy Missing"></asp:RequiredFieldValidator>--%>
											</div>
											<div class="col-lg-12 col-md-12">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Remarks</asp:Label><br />
												<asp:TextBox CssClass="Upper-case" Width="100%" ID="txtRemarksFE" placeholder="Remarks" runat="server" Height="50px" TextMode="MultiLine"></asp:TextBox>
												<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtRemarksFE" ValidationGroup="AllocCeilingFE" runat="server" Display="None" ErrorMessage="Remarks Missing"></asp:RequiredFieldValidator>
											</div>
										</div>
										<div class="row" style="padding: 15px">
											<asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" ValidationGroup="AllocCeilingFE" runat="server" />
											<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="AllocCeilingFE" Style="float: right; margin-top: 5px" Text="Save" ID="BtnSubSaveFE" OnClick="BtnSubSaveFE_Click" />
										</div>
									</div>



								</div>
								<%--<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="DetailAddEst" Style="float: right; margin-top: 5px" Text="Update Item/Part No" ID="BtnUpdate1" OnClick="BtnUpdate1_Click" />--%>
							</div>
						</asp:Panel>
					</div>
				</div>
				<div id="SubFormGrid" runat="server" class="col-md-7 col-lg-7 padingLeft5px">
					<div id="DivGridRS" runat="server" visible="false">

					<div class="col-lg-8 col-md-6">
						<h3 id="H1" runat="server" style="color: #FFFFFF; margin: 0px">s</h3>
						<h3 id="H2" runat="server" style="color: #00369E; margin: 0px">Ceiling History</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h3 id="H6" runat="server" style="color: #FFFFFF; margin: 0px">s</h3>
						<h4 id="H5" runat="server" style="color: #00369E; margin: 0px">(Amount in Rs)</h4>
					</div>
					<div class="box box-primary col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px" runat="server" id="Div1">

						<div class="box-body" style="height: 245px; overflow: auto">
							<div style="font-family: Arial; font-size: 16px; color: black; overflow-y: hidden">
								<asp:GridView ID="GridRRC_Alloc_Detail" OnRowCommand="GridRRC_Alloc_Detail_RowCommand" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDataBound="GridRRC_Alloc_Detail_RowDataBound">
									<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
									<EditRowStyle BackColor="#2461BF" />
									<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
									<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
									<AlternatingRowStyle BackColor="White" />
									<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
									<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
									<EmptyDataRowStyle BackColor="#EFF3FB" />

									<Columns>

										<%--<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>--%>

										<asp:TemplateField>
											<HeaderTemplate>
												Withdrwal<br />
												Date
											</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("FormatedAllocDate") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />
										</asp:TemplateField>


										<asp:TemplateField>
											<HeaderTemplate>
												Initial<br />
												Ceiling
											</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("OPENING_BAL") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" />
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>
												Additional<br />
												Ceiling
											</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("CEILING_AMT") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>
												Withdrawl<br />
												Ceiling
											</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span" Font-Bold="true" ID="lbl_PO_NO" runat="server" Text='<%#Eval("CEILING_WITHDRAWL") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>
												Net<br />
												Ceiling
											</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span" Font-Bold="true" runat="server" Text='<%#Eval("NET_CEILING") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Remarks</HeaderTemplate>
											<ItemTemplate>
												<%--	<asp:Label CssClass="text-Align-span" runat="server" ToolTip='<%#Eval("REMARKS") %>' Text='<%#Eval("REMARKS") %>'></asp:Label>--%>
												<p style="white-space: nowrap; width: 295px; padding-top: 4px; text-overflow: ellipsis; overflow: hidden;">
													<asp:LinkButton ID="btnDes" Height="18px" CssClass="vertical-align-mid" Text='<%#Eval("REMARKS") %>' runat="server"
														data-toggle="popover" data-placement="left" data-trigger="hover" CommandName="viewDes" ToolTip='<%#Eval("REMARKS") %>' />
												</p>
											</ItemTemplate>

										</asp:TemplateField>


									</Columns>


								</asp:GridView>
							</div>
						</div>


					</div>
						</div>
					<div id="DivGridFE" runat="server" visible="false">

					<div class="col-lg-8 col-md-6">
						<h3 id="H11" runat="server" style="color: #FFFFFF; margin: 0px">s</h3>
						<h3 id="H8" runat="server" style="color: #00369E; margin: 0px">Ceiling History</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h3 id="H12" runat="server" style="color: #FFFFFF; margin: 0px">s</h3>
						<h4 id="H10" runat="server" style="color: #00369E; margin: 0px">(Amount in $)</h4>
					</div>
					<div class="box box-primary col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px" runat="server" id="Div3">
						<div class="box-body" style="height: 245px; overflow: auto">
							<div style="font-family: Arial; font-size: 16px; color: black; overflow-y: hidden">
								<asp:GridView ID="GridRRC_Alloc_DetailFE" OnRowCommand="GridRRC_Alloc_DetailFE_RowCommand" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDataBound="GridRRC_Alloc_DetailFE_RowDataBound">
									<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
									<EditRowStyle BackColor="#2461BF" />
									<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
									<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
									<AlternatingRowStyle BackColor="White" />
									<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
									<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
									<EmptyDataRowStyle BackColor="#EFF3FB" />

									<Columns>

										<%--<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>--%>

										<asp:TemplateField>
											<HeaderTemplate>
												Withdrwal<br />
												Date
											</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("FormatedAllocDate") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />
										</asp:TemplateField>


										<asp:TemplateField>
											<HeaderTemplate>
												Initial<br />
												Ceiling
											</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("OPENING_BAL") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" />
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>
												Additional<br />
												Ceiling
											</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("CEILING_AMT") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>
												Withdrawl<br />
												Ceiling
											</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span" Font-Bold="true" ID="lbl_PO_NO" runat="server" Text='<%#Eval("CEILING_WITHDRAWL") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>
												Net<br />
												Ceiling
											</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span" Font-Bold="true" runat="server" Text='<%#Eval("NET_CEILING") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Remarks</HeaderTemplate>
											<ItemTemplate>
												<%--	<asp:Label CssClass="text-Align-span" runat="server" ToolTip='<%#Eval("REMARKS") %>' Text='<%#Eval("REMARKS") %>'></asp:Label>--%>
												<p style="white-space: nowrap; width: 295px; padding-top: 4px; text-overflow: ellipsis; overflow: hidden;">
													<asp:LinkButton ID="btnDes" Height="18px" CssClass="vertical-align-mid" Text='<%#Eval("REMARKS") %>' runat="server"
														data-toggle="popover" data-placement="left" data-trigger="hover" CommandName="viewDes" ToolTip='<%#Eval("REMARKS") %>' />
												</p>
											</ItemTemplate>

										</asp:TemplateField>


									</Columns>


								</asp:GridView>
							</div>
						</div>
					</div>
						</div>
				</div>
			</div>
		</div>
	</div>

</asp:Content>
