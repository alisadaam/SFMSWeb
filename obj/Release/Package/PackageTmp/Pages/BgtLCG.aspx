<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtLCG.aspx.cs" Inherits="BMSWeb.Pages.BgtLCG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">

	<style>
		.IframeDteGraph {
			width: 100%;
			height: 420px;
			border: none;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row" id="main_form" runat="server">

		<div class="col-md-12 col-lg-10 padingRight5px">

			<div id="HEadingDiv">
				<div class="col-lg-8 col-md-6">
					<h3 id="BgtEstStor" runat="server" style="color: #1D74D6; margin: 0px">Budget Requirements LCG</h3>
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
								<div class="col-lg-2 col-md-2 buttom-margin padingRight1px">
									<asp:DropDownList CssClass="form-control" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" AutoPostBack="true"></asp:DropDownList>

								</div>
								<div class="col-lg-2 col-md-2 buttom-margin padingRight1px padingLeft1px">
									<asp:DropDownList CssClass="form-control" ID="PSOddl" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" runat="server" OnSelectedIndexChanged="PSOddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="PSOddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="PSO Missing"></asp:RequiredFieldValidator>
								</div>
								<div id="ACASDiv" class="col-lg-2 col-md-2 buttom-margin padingLeft1px padingRight1px">
									<asp:DropDownList CssClass="form-control" ID="ACASddl" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ACASddl_SelectedIndexChanged"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ACASddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="ACAS Missing"></asp:RequiredFieldValidator>
								</div>
								<div id="DTEDiv" class="col-lg-2 col-md-2 buttom-margin padingLeft1px padingRight1px padingLeft1px">
									<asp:DropDownList CssClass="form-control" DataValueField="DTE_CODE" DataTextField="DTE_DECODE" ID="Directorateddl" runat="server" AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="Directorateddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Directorate Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-2 col-md-2 buttom-margin padingLeft1px">
									<asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="BPC" runat="server">
										<asp:ListItem Value=""> Select BPC</asp:ListItem>
										<asp:ListItem Value="B"> Annual</asp:ListItem>
										<asp:ListItem Value="2"> 2</asp:ListItem>
										<asp:ListItem Value="3"> 3</asp:ListItem>
										<asp:ListItem Value="4"> 4</asp:ListItem>
									</asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Directorateddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="BPC Missing"></asp:RequiredFieldValidator>
								</div>
							</div>
						
				

						<div class="row  buttom-margin">
							<div class="col-lg-6 col-md-6 buttom-margin" runat="server" id="DesDiv">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Description</asp:Label>
								<asp:TextBox CssClass="Upper-case" Width="100%" ID="DESCRIPTION" placeholder="Description" runat="server" Height="50px" TextMode="MultiLine"></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="DESCRIPTION" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Description Missing"></asp:RequiredFieldValidator>
							</div>
							<div class="col-lg-6 col-md-6 buttom-margin" runat="server">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Justification</asp:Label>
								<asp:TextBox CssClass="Upper-case" Width="100%" ID="Justification" placeholder="Justification" runat="server" Height="50px" TextMode="MultiLine"></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Justification" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Justification Missing"></asp:RequiredFieldValidator>
							</div>
							<div runat="server" class="col-lg-2 col-md-2 padingRight1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">LCG Heads</asp:Label>
								<asp:DropDownList CssClass="form-control" DataValueField="LG_HEAD_CODE" DataTextField="LG_HEAD_DECODE" OnDataBound="lcgHeads_DataBound" ID="lcgHeads" runat="server"  AutoPostBack="True"></asp:DropDownList>
							    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="lcgHeads" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="LCG Missing"></asp:RequiredFieldValidator>
							</div>
							<div runat="server" class="col-lg-2 col-md-2 padingLeft1px padingRight1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Funds Type</asp:Label>
							<asp:DropDownList CssClass="form-control" DataValueField="BGT_TYPE_CODE" DataTextField="BGT_TYPE" ID="Funds_TYPE" runat="server" AutoPostBack="True">
											</asp:DropDownList>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Funds_TYPE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Funds Type Missing"></asp:RequiredFieldValidator>
										

							</div>
							<div class="col-lg-2 col-md-2 padingLeft1px padingRight1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Last Year Normal</asp:Label>
								<asp:TextBox CssClass="form-control" placeholder="Last Year Normal" ID="LastYearNormal" AutoComplete="Off" runat="server"></asp:TextBox>
								</div>
							<div class="col-lg-2 col-md-2 padingLeft1px padingRight1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Last Year Special</asp:Label>
								<asp:TextBox CssClass="form-control"  placeholder="Last Year Special" ID="LastYearSpecial" AutoComplete="Off" runat="server"></asp:TextBox>
								</div>
							<div class="col-lg-2 col-md-2 padingLeft1px padingRight1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Current Required</asp:Label>
								<asp:TextBox CssClass="form-control" Enabled="false" placeholder="Current Required" ID="CurrentRequired" AutoComplete="Off" runat="server"></asp:TextBox>
							</div>
							<div class="col-lg-2 col-md-2 padingLeft1px">
								

							</div>
							<div class="col-lg-2 col-md-2 padingLeft1px" style="padding-top: 10px;">
								<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="grp_est" Style="float: right; margin-top: 5px" Text="Save Demand" ID="btnSave" OnClick="btnSave_Click" />
							</div>
							<div class="col-lg-12 col-md-12">
									<asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" ValidationGroup="grp_est" runat="server" />
								</div>
						</div>
				</asp:Panel>

						<div class="row  buttom-margin">
							<div class="col-lg-12 col-md-12 buttom-margin" runat="server" id="Div1">
								<iframe src="" id="LCGIframe" runat="server" class="IframeDteGraph"></iframe>
								</div>
							</div>
						</div>
					</div>

			</div>
		</div>
	</div>
</asp:Content>
