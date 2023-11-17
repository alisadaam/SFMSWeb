<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LCGSport.aspx.cs" Inherits="BMSWeb.Pages.LCSSport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="../Content/sweetalert.css" rel="stylesheet" />
	<script src="../Scripts/sweetalert.min.js"></script>

	<%--    <link href="../Contents/simple-line-icons.min.css" rel="stylesheet" />--%>

	<link href="../Content/css/skins/_all-skins.css" rel="stylesheet" />
	<link href="../Content/bootstrap.min.css" rel="stylesheet" />
	<link href="../Content/css/AdminLTE.css" rel="stylesheet" />
	<link href="../assets/AdminLTE.min.css" rel="stylesheet" />
	<link href="../Content/Site.css" rel="stylesheet" />

	<%: Styles.Render("~/Content/css/bootstrap-slider") %>
	<%--  <%: Styles.Render("~/Content/css/bootstrap") %>
    <%: Styles.Render("~/Content/css/AdminLTE") %>--%>
	<%: Styles.Render("~/Content/fonts/font-awesome/css/font-awesome.min.css") %>
	<%: Styles.Render("~/Content/css/bootstrap-slider") %>
	<%: Styles.Render("~/Content/css/bootstrap-wysihtml5") %>
	<%: Styles.Render("~/Content/css/colorpicker") %>
	<%: Styles.Render("~/Content/css/datatables") %>
	<%: Styles.Render("~/Content/css/datepicker") %>
	<%: Styles.Render("~/Content/css/daterangepicker") %>
	<%: Styles.Render("~/Content/css/iCheck") %>
	<%: Styles.Render("~/Content/css/ionslider") %>
	<%: Styles.Render("~/Content/css/jvectormap") %>
	<%--<%: Styles.Render("~/Content/css/morris") %>--%>
	<%: Styles.Render("~/Content/css/timepicker") %>
	<%: Styles.Render("~/Content/Site.css") %>
	<%--   <%: Styles.Render("~/Content/css/FontCss/Font.css") %>
    <%: Styles.Render("~/Content/css/FontCss/Font2.css") %>--%>
	<%: Styles.Render("~/assets/simple-line-icons/simple-line-icons.min.css") %>
	<%: Scripts.Render("~/bundles/jquery") %>
	<%: Scripts.Render("~/bundles/bootstrap")%>
	<%: Scripts.Render("~/bundles/jqueryui")%>
	<%: Scripts.Render("~/bundles/datepicker")%>
	<style>
		.float-left {
			float: left;
		}

		.Upper-case {
			text-transform: uppercase;
		}

		.table-hover > tbody > tr:hover {
			background-color: rgb(191, 220, 255) !important;
			color: rgb(0, 76, 255) !important;
		}

		.border-color {
			border-color: #B3D8F5 !important;
		}

		.main-sidebar, .left-side {
			width: 175px !important;
		}

		.text-Align {
			text-align: right;
		}

		.text-Align-span {
			float: right;
		}

		.sweet-alert button {
			background-color: rgb(53, 155, 255);
			color: white;
			border: none;
			box-shadow: none;
			font-size: 17px;
			font-weight: 500;
			-webkit-border-radius: 4px;
			border-radius: 5px;
			padding: 10px 32px;
			margin: 26px 5px 0 5px;
			cursor: pointer;
		}

			.sweet-alert button:hover {
				background-color: rgb(27, 88, 150) !important;
			}

		.inline-foam-display {
			Display: initial;
			Width: 96%;
			resize: none;
		}

		.skin-blue .sidebar a {
			color: #FFFFFF;
		}

		.skin-blue .user-panel > .info, .skin-blue .user-panel > .info > a {
			color: #FFFFFF;
		}

		.skin-blue .sidebar > .sidebar-menu > li {
			border-top: 1px solid #fff;
			border-bottom: 0px;
		}

		.sidebar-menu li > a > .pull-right {
			position: absolute !important;
			top: 50% !important;
			right: -5px !important;
			margin-top: -7px !important;
		}

		.skin-blue .user-panel > .image > img {
			border: 1px solid #3C8DBC;
		}

		.skin-blue .treeview-menu > li > a {
			color: #FFF;
		}
		/*Changes*/
		.skin-blue .sidebar > .sidebar-menu > li > .treeview-menu {
			margin: 0 1px;
			/*background: rgba(0, 192, 239, 0.39);*/
			background: #72B1FF;
			/*background: rgb(4, 164, 204);*/
		}

		.skin-blue .main-header .navbar {
			/* background-color: #3c8dbc; */
			background: linear-gradient(to bottom, rgba(73,155,234,1) 0%, rgba(73,155,234,1) 43%, rgba(32,124,229,1) 55%, rgba(32,124,229,1) 100%);
		}

		.skin-blue .main-header .logo {
			background-color: #1D74D6;
			color: #ffffff;
			border-bottom: 0 solid transparent;
		}
		/**/
		.skin-blue .sidebar > .sidebar-menu > li > a:hover, .skin-blue .sidebar > .sidebar-menu > li.active > a {
			color: #222;
			background: #f9f9f9 !important;
		}

		.sidebar-menu, .main-sidebar .user-panel, .sidebar-menu > li.header {
			white-space: inherit !important;
			overflow: hidden;
		}

		.Heading-color {
			color: #207CE5;
			margin-left: 15px;
		}

		@media (min-width: 768px) {
			.sidebar-mini.sidebar-collapse .main-header .logo > .logo-mini {
				display: block;
				margin-left: -15px;
				margin-right: -15px;
				font-size: 15px;
			}
		}

		.form-group {
			margin-bottom: 6px;
		}

		.form-control {
			height: 30px !important;
			font-size: 12px !important;
		}



		.buttom-margin {
			margin-bottom: 2px;
		}

		.vertical-align-mid {
			vertical-align: middle;
		}

		.gradient {
			background: linear-gradient(to bottom, rgb(73, 155, 234) 0%, rgb(73, 155, 234) 43%, rgb(32, 124, 229) 55%, rgb(32, 124, 229) 100%) repeat scroll 0% 0% transparent;
			background: -ms-linear-gradient(to bottom, rgb(73, 155, 234) 0%, rgb(73, 155, 234) 43%, rgb(32, 124, 229) 55%, rgb(32, 124, 229) 100%) repeat scroll 0% 0% transparent;
		}

		.padingRight1px {
			padding-right: 1px;
		}

		.padingLeft1px {
			padding-left: 1px;
		}

		.padingRight5px {
			padding-right: 5px;
		}

		.padingLeft5px {
			padding-left: 5px;
		}

		.right-align {
			text-align: right;
		}
		.pagination-ys {
			/*display: inline-block;*/
			padding-left: 0;
			margin: 20px 0;
			border-radius: 4px;
		}

			.pagination-ys table > tbody > tr > td {
				display: inline;
			}

				.pagination-ys table > tbody > tr > td > a,
				.pagination-ys table > tbody > tr > td > span {
					position: relative;
					float: left;
					padding: 8px 12px;
					line-height: 1.42857143;
					text-decoration: none;
					color: #dd4814;
					background-color: #ffffff;
					border: 1px solid #dddddd;
					margin-left: -1px;
				}

				.pagination-ys table > tbody > tr > td > span {
					position: relative;
					float: left;
					padding: 8px 12px;
					line-height: 1.42857143;
					text-decoration: none;
					margin-left: -1px;
					z-index: 2;
					color: #aea79f;
					background-color: #f5f5f5;
					border-color: #dddddd;
					cursor: default;
				}

				.pagination-ys table > tbody > tr > td:first-child > a,
				.pagination-ys table > tbody > tr > td:first-child > span {
					margin-left: 0;
					border-bottom-left-radius: 4px;
					border-top-left-radius: 4px;
				}

				.pagination-ys table > tbody > tr > td:last-child > a,
				.pagination-ys table > tbody > tr > td:last-child > span {
					border-bottom-right-radius: 4px;
					border-top-right-radius: 4px;
				}

				.pagination-ys table > tbody > tr > td > a:hover,
				.pagination-ys table > tbody > tr > td > span:hover,
				.pagination-ys table > tbody > tr > td > a:focus,
				.pagination-ys table > tbody > tr > td > span:focus {
					color: #97310e;
					background-color: #eeeeee;
					border-color: #dddddd;
				}
	</style>
	<script>
		function CalulatePrive() {
			if ($("#Quantity").val() != "" && $("#Rate").val() != "") {
				$("#Amount").val($("#Quantity").val() * $("#Rate").val())
				$("#AmntHidden4Sports").val($("#Quantity").val() * $("#Rate").val())
				
			}
		}
	</script>
</head>
<body>
    <form id="form1" runat="server">
  	<div class="row" id="main_form" runat="server">

		<div class="col-md-12 col-lg-10 padingRight5px">

			<div id="HEadingDiv">
				<div class="col-lg-8 col-md-6">
					<h3 runat="server" style="color: #1D74D6; margin: 0px">LCG Sports</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
				</div>
			</div>
			<div class="col-lg-12 col-md-12" style="padding-right: 0px; padding-left: 0px">

				<div class="box box-info" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

					<div class="box-body" style="padding-bottom: 2px;">
						<asp:Panel runat="server" ID="PanelSub">
							<div class="row">
								<div class="col-lg-2 col-md-2 buttom-margin padingRight1px">
									<asp:DropDownList CssClass="form-control" ID="SportsCatddl" DataValueField="SPORT_CODE" OnDataBound="SportsCatddl_DataBound" DataTextField="SPORTS_DECODE" runat="server"  AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="SportsCatddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Category Missing"></asp:RequiredFieldValidator>
								
								</div>
								<div class="col-lg-2 col-md-2 buttom-margin padingRight1px padingLeft1px">
									<asp:DropDownList CssClass="form-control" DataValueField="SPORTS_TYPE_CODE" OnDataBound="SportTypeddl_DataBound" DataTextField="SPORTS_TYPE_DECODE" ID="SportTypeddl" runat="server" AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="SportTypeddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Sports Type Missing"></asp:RequiredFieldValidator>
								
									</div>
								<div class="col-lg-2 col-md-2 buttom-margin padingLeft1px padingRight1px">
									<asp:DropDownList CssClass="form-control" ID="SportsItemTypedll" DataValueField="CODE" OnDataBound="SportsItemTypedll_DataBound" DataTextField="DECODE" runat="server"  AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="SportsItemTypedll" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Sports Item Type Missing"></asp:RequiredFieldValidator>
								
									</div>
								<div  class="col-lg-2 col-md-2 buttom-margin  padingRight1px padingLeft1px">
									<asp:DropDownList CssClass="form-control" ID="BasesDll" DataValueField="BASE_CODE" OnSelectedIndexChanged="BasesDll_SelectedIndexChanged" OnDataBound="BasesDll_DataBound" DataTextField="BASE_DECODE_LONG" runat="server"  AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="BasesDll" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Bases Missing"></asp:RequiredFieldValidator>
								
									</div>
								<div  class="col-lg-2 col-md-2 buttom-margin  padingRight1px padingLeft1px">
									<asp:DropDownList CssClass="form-control" ID="UnitsDll" DataValueField="UNIT_CODE_NEW" OnDataBound="UnitsDll_DataBound" DataTextField="UNIT_DECODE_LONG" runat="server"  AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="UnitsDll" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Units Missing"></asp:RequiredFieldValidator>
								
									</div>
							</div>
						</asp:Panel>
					

						<div class="row  buttom-margin">
							<div class="col-lg-6 col-md-6 buttom-margin" runat="server" id="DesDiv">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Description</asp:Label>
								<asp:TextBox CssClass="Upper-case" Width="100%" ID="DESCRIPTION" placeholder="Description" runat="server" Height="50px" TextMode="MultiLine"></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="DESCRIPTION" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Description Missing"></asp:RequiredFieldValidator>
							</div>
							<div class="col-lg-6 col-md-6 buttom-margin" runat="server">
								</div>
							
							<div runat="server" class="col-lg-2 col-md-2 padingLeft1px padingRight1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;"  runat="server">Quantity</asp:Label>
								<asp:TextBox CssClass="form-control"  placeholder="Quantity" onblur="javascript: CalulatePrive()" ID="Quantity" runat="server" AutoComplete="Off"></asp:TextBox>

							</div>
							<div class="col-lg-2 col-md-2 padingLeft1px padingRight1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Rate</asp:Label>
								<asp:TextBox CssClass="form-control"  placeholder="Rate" onblur="javascript: CalulatePrive()" ID="Rate" AutoComplete="Off" runat="server"></asp:TextBox>

							</div>
							<div class="col-lg-2 col-md-2 padingLeft1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Amount</asp:Label>
								<asp:TextBox CssClass="form-control" Enabled="false" placeholder="Amount"  ID="Amount" AutoComplete="Off" runat="server"></asp:TextBox>
								<input type="text"	hidden value="" runat="server" id="AmntHidden4Sports" />
							</div>
							<div class="col-lg-2 col-md-2 padingLeft1px" style="padding-top: 10px;">
								<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="grp_est" Style="float: right; margin-top: 5px" OnClick="btnSave_Click" Text="Save Demand" ID="btnSave"  />
							</div>
							<div class="col-lg-12 col-md-12">
									<asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" ValidationGroup="grp_est" runat="server" />
								</div>
						</div>

						<div class="row">
				<asp:GridView ID="GridLCGSport" Font-Size="Small" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True">
				<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
				<EditRowStyle BackColor="#2461BF" />
				<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
				<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
				<AlternatingRowStyle BackColor="White" />
				<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
				<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
				<EmptyDataRowStyle BackColor="#EFF3FB" />
				<Columns>
					<asp:TemplateField>
						<HeaderTemplate>Appendix</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="float-left" runat="server" Text='<%#Eval("APPENDIX_DECODE") %>'></asp:Label>
						</ItemTemplate>

					</asp:TemplateField>

					<asp:TemplateField ControlStyle-ForeColor="Red">
						<HeaderTemplate>OTC(FE)</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("OTC_FE") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<div style="padding: 0 0 5px 0">
								<asp:Label ID="lblTotalFE" CssClass="text-Align-span" Text="" runat="server" />
							</div>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField ControlStyle-ForeColor="Red">
						<HeaderTemplate>RRC(FE)</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("RRC_FE") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<div style="padding: 0 0 5px 0">
								<asp:Label ID="lblTotalRS" CssClass="text-Align-span" Text="" runat="server" />
							</div>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField ControlStyle-ForeColor="Red">
						<HeaderTemplate>TOF(FE)</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("TOF_FE") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<div style="padding: 0 0 5px 0">
								<asp:Label ID="lblTotalRS" CssClass="text-Align-span" Text="" runat="server" />
							</div>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField ControlStyle-ForeColor="Green">
						<HeaderTemplate>OTC(RS)</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("OTC_RS") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<div style="padding: 0 0 5px 0">
								<asp:Label ID="lblTotalRS" CssClass="text-Align-span" Text="" runat="server" />
							</div>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField ControlStyle-ForeColor="Green">
						<HeaderTemplate>RRC(RS)</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("RRC_RS") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<div style="padding: 0 0 5px 0">
								<asp:Label ID="lblTotalRS" CssClass="text-Align-span" Text="" runat="server" />
							</div>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField ControlStyle-ForeColor="Green">
						<HeaderTemplate>TOF(RS)</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("TOF_RS") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<div style="padding: 0 0 5px 0">
								<asp:Label ID="lblTotalRS" CssClass="text-Align-span" Text="" runat="server" />
							</div>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField ControlStyle-ForeColor="Green">
						<HeaderTemplate>LP(RS)</HeaderTemplate>
						<ItemTemplate>
							<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("LP_RS") %>'></asp:Label>
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
		</div>
	</div>
    </form>
</body>
</html>
