<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="BMSWeb.Pages.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
		<style type="text/css">
		#secMessage {
			margin-bottom: 0px;
		}

		.login-btn {
			text-decoration: none;
			background-color: #20679A !important;
			color: #fff;
		}

		.btn:hover, .btn:focus, .btn.focus {
			color: #333;
			text-decoration: underline;
			color: #000102;
			background-color: rgba(230, 230, 230, 0.65) !important;
		}

		.login .btn-primary {
			background-color: rgba(202, 204, 206, 0) !important;
			border: 1px solid #72A9CC;
			color: #DEE3E6;
			font-weight: 600;
			padding: 10px 25px !important;
		}

			.login .btn-primary:hover {
				color: #333;
				text-decoration: underline;
				color: #000102;
				background-color: rgba(230, 230, 230, 0.65) !important;
				border: 1px solid #72A9CC;
			}

		.btn-primary:active, .btn-primary.active {
			background-color: rgba(202, 204, 206, 0) !important;
			border: 1px solid #72A9CC;
			color: #DEE3E6;
			font-weight: 600;
			padding: 10px 25px !important;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<h3 class="Heading-color">Change Password</h3>
		<div>
			<asp:ValidationSummary runat="server" CssClass="alert-danger" ValidationGroup="vgGetUserByPakNo" HeaderText="Form Validation Error" ID="ValidationSummary3" />
			<asp:ValidationSummary runat="server" CssClass="alert-danger" HeaderText="Form Validation Error" ID="ValidationSummary4" />

		</div>
		<div class="col-lg-6 col-xs-12 col-sm-12 col-md-6">
			<!-- general form elements -->
			<div class="form-group">
				<section id="secMessage" runat="server"></section>
			</div>
			<div class="box box-info">
				<div class="form-horizontal box-body table-responsive">

					<table class="table-responsive table">

						<tr>
							<td>User Name</td>
							<td>
								<asp:TextBox runat="server" ID="TxtUserName" CssClass="form-control input-sm" Enabled="false" />
							</td>
							<td>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtUserName" Display="Dynamic" ErrorMessage="User Name is Required" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtUserName" ID="RegularExpressionValidator2" ValidationExpression="^[\s\S]{0,100}$" runat="server" ForeColor="Red" ErrorMessage="Maximum 100 characters allowed.">*</asp:RegularExpressionValidator>


							</td>
						</tr>
						<tr>
							<td>Old Password</td>
							<td>
								<asp:TextBox runat="server" ID="txtPrevPass" CssClass="form-control input-sm" TextMode="Password" PlaceHolder="Old Password" />
							</td>
							<td>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPrevPass" Display="Dynamic" ErrorMessage="Old Password is Required" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>


							</td>
						</tr>
						<tr>
							<td>New Password</td>
							<td>
								<asp:TextBox runat="server" ID="TxtPassword" CssClass="form-control input-sm" TextMode="Password" PlaceHolder="New Password" />
								<asp:Label ID="lblmsgPwsrd" runat="server" Text="(Password must be 9-15 AlphaNumeric characters)"></asp:Label>

							</td>
							<td>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtPassword" Display="Dynamic" ErrorMessage="Password is Required" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TxtPassword" ID="RegularExpressionValidator3"
									ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{9,15})$" runat="server" ForeColor="Red" ErrorMessage="Password must be 9 - 15 characters long and AlphaNumeric .">*</asp:RegularExpressionValidator>

							</td>
						</tr>
						<tr>
							<td>Confirm Password</td>
							<td>
								<asp:TextBox runat="server" ID="TxtConfirmPassword" CssClass="form-control input-sm" TextMode="Password" PlaceHolder="Confirm Password" />
							</td>
							<td>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtConfirmPassword" Display="Dynamic" ErrorMessage="Confirm Password is Required" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>

								<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TxtPassword" ControlToValidate="TxtConfirmPassword" ErrorMessage="Password doesn't match" ForeColor="Red" Display="Dynamic">*</asp:CompareValidator>
							</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td>
								<asp:Button Text="Change" runat="server" ID="btnChangePass" CssClass="btn btn-primary btn-sm pull-right" OnClick="btnChangePass_Click" />
							</td>
							<td>
								<asp:HyperLink ID="lnkCnacel" runat="server"
									NavigateUrl="~/Pages/Default.aspx" BorderStyle="None">Cancel

								</asp:HyperLink>

							</td>
						</tr>

					</table>
				</div>
			</div>
		</div>
	</div>

</asp:Content>
