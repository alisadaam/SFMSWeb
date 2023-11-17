<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtRRCWpnSysSummary.aspx.cs" Inherits="BMSWeb.Pages.BgtRRCWpnSysSummary" %>


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
		.boundFieldStyle {
			font-weight:bold;
		}
	</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	
	<div class="row" id="main_form" runat="server">

		<div class="col-md-12 col-lg-12 col-sm-12 padingRight5px" style="padding-left: 11px;">

			<div class="col-lg-12 col-md-12 col-sm-12">
				<h3 runat="server" style="color: #00369E; margin: 0px">RRC Order Placed</h3>
			</div>

			<div class="col-lg-5 col-md-5 col-sm-6" style="padding-left: 7px;">

				<div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

					<div class="box-body" style="padding-bottom: 2px;">

						<div class="row">

							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
								<%--<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">PSO</asp:Label><br />--%>
								<asp:DropDownList CssClass="form-control" ID="PSOddl" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" runat="server" OnSelectedIndexChanged="PSOddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingLeft1px padingRight1px">
								<%--<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">ACAS</asp:Label><br />--%>
								<asp:DropDownList CssClass="form-control" ID="ACASddl" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ACASddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin  padingLeft1px">
								<%--<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Directorate</asp:Label><br />--%>
								<asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="Directorateddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Directorateddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
								<%--<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">FY</asp:Label><br />--%>
								<asp:DropDownList CssClass="form-control" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

							</div>

							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px padingLeft1px">
								<asp:DropDownList CssClass="form-control" ID="WEAPON_SYS" DataValueField="WEAPON_SYSTEM" DataTextField="WEAPON_SYSTEM" runat="server" OnDataBound="WEAPON_SYS_DataBound" OnSelectedIndexChanged="WEAPON_SYS_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin  padingLeft1px">
								<asp:DropDownList CssClass="form-control" ID="Currencyddl" DataValueField="CURRENCY_SYMBOL" DataTextField="CURRENCY_SYMBOL" runat="server" OnDataBound="Currencyddl_DataBound" OnSelectedIndexChanged="Currencyddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		</div>
		<div id="WpnSummDetailDiv" runat="server" class="col-lg-12 col-md-12 col-sm-12">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12">
					<h3 id="H3" runat="server" style="color: #00369E; margin: 0px">Wpn System Wise Summary ($)</h3>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12" style="text-align: right; padding-top: 5px;">
					<h4 id="H4" runat="server" style="color: #00369E; margin: 0px">(Amount in Million)</h4>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12">
					<h3 id="H1" runat="server" style="color: #00369E; margin: 0px">Wpn System Wise Summary (Rs)</h3>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12" style="text-align: right; padding-top: 5px;">
					<h4 id="H2" runat="server" style="color: #00369E; margin: 0px">(Amount in Million)</h4>
				</div>
			</div>
			<div class="row">


				<div class="col-lg-6 col-md-6 col-sm-6">


					<div runat="server" id="Div4" class="box box-info" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px;">

						<div class="box-body" style="padding-top: 2px">

							<div style="font-family: Arial; font-size: 16px; color: black; overflow-y: hidden">
								<asp:GridView ID="GridRRCSummaryDetail" AllowPaging="true" DataKeyNames=""  OnRowDataBound="GridRRCSummaryDetail_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridRRCSummaryDetail_RowCreated" OnRowCommand="GridRRCSummaryDetail_RowCommand" OnPageIndexChanging="GridRRCSummaryDetail_PageIndexChanging" >
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
											<HeaderTemplate>Weapon Sys</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("WEAPON_SYS") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="330px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalWEAPON_SYS" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
											<asp:TemplateField>
											<HeaderTemplate>Currency</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("CURRENCY") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="100px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalCURRENCY" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										
										<asp:TemplateField>
											<HeaderTemplate>Approved Ceiling</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("CEILING_AMT_FE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="100px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalCEILING_AMT_FE" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Approved Ceiling</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("CEILING_AMT_RS") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="100px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalCEILING_AMT_RS" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>(cs)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PO_AMT") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalPO_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>($)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PO_AMT_US") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalPO_AMT_US" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>(cs)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("RO_AMT") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalRO_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>($)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("RO_AMT_US") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalRO_AMT_US" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>(cs)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("ORDER_AMT") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalORDER_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>($)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("ORDER_AMTFE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalORDER_AMTFE" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Balance</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("BalanceRs") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalBalanceRs" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
									<asp:TemplateField>
											<HeaderTemplate>Balance</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("BalanceFE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
										<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalBalanceFE" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
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
				<div class="col-lg-6 col-md-6 col-sm-6">


					<div runat="server" id="Div1" class="box box-info" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px;">

						<div class="box-body" style="padding-top: 2px">

							<div style="font-family: Arial; font-size: 16px; color: black; overflow-y: hidden">
								<asp:GridView ID="GridRRCSummaryDetailRs" AllowPaging="true" DataKeyNames=""  OnRowDataBound="GridRRCSummaryDetailRs_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridRRCSummaryDetailRs_RowCreated" OnRowCommand="GridRRCSummaryDetailRs_RowCommand" OnPageIndexChanging="GridRRCSummaryDetailRs_PageIndexChanging" >
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
										<asp:BoundField ItemStyle-CssClass="boundFieldStyle" ControlStyle-Font-Size="XX-Large" HeaderText="Directorate" DataField="DTE_SYMBOL" ItemStyle-HorizontalAlign="Center" />
										<%--<asp:TemplateField>
											<HeaderTemplate>Directorate</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("DTE_SYMBOL") %>'></asp:Label>

											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />
										</asp:TemplateField>--%>
										<asp:TemplateField>
											<HeaderTemplate>Weapon Sys</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("WEAPON_SYS") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="330px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalWEAPON_SYS" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
											<asp:TemplateField>
											<HeaderTemplate>Currency</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("CURRENCY") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="100px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalCURRENCY" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										
										<asp:TemplateField>
											<HeaderTemplate>Approved Ceiling</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("CEILING_AMT_FE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="100px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalCEILING_AMT_FE" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Approved Ceiling</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("CEILING_AMT_RS") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="100px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalCEILING_AMT_RS" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>(cs)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PO_AMT") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalPO_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>($)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PO_AMT_US") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalPO_AMT_US" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>(cs)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("RO_AMT") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalRO_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>($)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("RO_AMT_US") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalRO_AMT_US" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>(cs)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("ORDER_AMT") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalORDER_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>(Rs)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("ORDER_AMTFE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalORDER_AMTFE" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Balance</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("BalanceRs") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
											<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalBalanceRs" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
										</asp:TemplateField>
									<asp:TemplateField>
											<HeaderTemplate>Balance</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("BalanceFE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Right" Width="150px"/>
										<FooterTemplate>
												<asp:Label Font-Bold="true" ID="TotalBalanceFE" runat="server" CssClass="text-Align-span"></asp:Label>
											</FooterTemplate>
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
</asp:Content>
