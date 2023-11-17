<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtRRCFundsAvailabilitiesCertificate.aspx.cs" Inherits="BMSWeb.Pages.BgtRRCFundsAvailabilitiesCertificate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row" id="main_form" runat="server">

		<div class="col-md-12 col-lg-12 col-sm-12 padingRight5px" style="padding-left: 11px;">

			<div class="col-lg-12 col-md-12 col-sm-12">
				<h3 runat="server" style="color: #00369E; margin: 0px">Funds Availability Certificate (RRC's)</h3>
			</div>

			<div class="col-lg-5 col-md-5 col-sm-6" style="padding-left: 7px;">

				<div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

					<div class="box-body" style="padding-bottom: 2px;">

						<div class="row">

							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">PSO</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="PSOddl" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" runat="server" OnSelectedIndexChanged="PSOddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingLeft1px padingRight1px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">ACAS</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="ACASddl" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ACASddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin  padingLeft1px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Directorate</asp:Label><br />
								<asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="Directorateddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Directorateddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">FY</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

							</div>

							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px padingLeft1px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">BAC No</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="BACNoddl" DataTextField="BAC_NO" DataValueField="BAC_NO" runat="server" OnDataBound="BACNoddl_DataBound" OnSelectedIndexChanged="BACNoddl_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="BACNoddl" ValidationGroup="grp_indent" runat="server" Display="None" ErrorMessage="BAC No Missing"></asp:RequiredFieldValidator>
							</div>
						</div>
					</div>

				</div>

			</div>
			<div id="Div3" runat="server" class="col-md-7 col-lg-7 col-sm-7 padingLeft5px" style="margin-top: -27px;">

				<div class="col-lg-8 col-md-6 col-sm-6">
					<h3 id="H4" runat="server" style="color: #00369E; margin: 0px">BAC No Detail</h3>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H5" runat="server" style="color: #00369E; margin: 0px">(Amount in Million)</h4>
				</div>

				<div runat="server" id="Div4" class="box box-info col-lg-12 col-md-12 col-sm-12" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px; top: 0px; left: 0px;">

					<div class="box-body" style="padding-top: 2px">
						<table class="col-lg-12 col-md-12 col-sm-12" style="padding: 0px">
							<tr>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Net Alloc Amt ($)</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtNetAllocAmt"></asp:TextBox>
								</td>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Net Alloc Amt (Rs)</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtNetAllocAmtFE"></asp:TextBox>
								</td>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Initial Bal ($)</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtInitBal"></asp:TextBox>
								</td>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Initial Bal ($)</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtInitBalFE"></asp:TextBox>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="padding-right: 15px; padding-left: 15px;">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Purpose</asp:Label><br />
									<asp:TextBox CssClass="Upper-case" Enabled="false" Width="100%" ID="Purpose" placeholder="Description" runat="server" Height="50px" TextMode="MultiLine">
									</asp:TextBox>
								</td>
							</tr>
						</table>
					</div>

				</div>

			</div>
		</div>
	</div>
</asp:Content>
