<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BMSWeb.Login" %>

<!DOCTYPE html>
<html class="bg-black">
<head>
	<meta charset="UTF-8">
	<title>BMSWeb | Log in</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<%: Styles.Render("~/assets/css/font-awesome.min.css") %>
	<!-- Theme style -->
	<%: Styles.Render("~/Content/css/bootstrap")%>


	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="Content/login2.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL SCRIPTS -->
	<!-- BEGIN THEME STYLES -->
	<link href="Content/components.css" id="style_components" rel="stylesheet" type="text/css" />


	<link href="Content/darkblue.css" rel="stylesheet" type="text/css" id="style_color" />
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


</head>
<%--style="background-image:url(/Content/img/ACMSlogin.png)"--%>
<body class="login" oncontextmenu="return false;" style="background: url(Content/img/BMS_Login.jpg) no-repeat center; background-color: #195372 !important;">


	<div class="content" id="login-box">

		<form runat="server" class="login-form" style="padding: 25px; margin-top: 439px;">

			<div class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span>Enter any username and password. </span>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Username</label>
				<asp:TextBox runat="server" ID="TxtUserName" AutoCompleteType="Disabled" CssClass="form-control form-control-solid placeholder-no-fix" placeholder="User Name" />

				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUserName" ErrorMessage="User Name is required" ForeColor="Red">

				</asp:RequiredFieldValidator>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">Password</label>
				<asp:TextBox runat="server" ID="TxtPassword" AutoCompleteType="Disabled" CssClass="form-control form-control-solid placeholder-no-fix" placeholder="Password" TextMode="Password" />
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPassword" ErrorMessage="Password is required" ForeColor="Red">

				</asp:RequiredFieldValidator>
			</div>

			<div class="form-group">
				<section id="secMessage" runat="server"></section>
			</div>

			<div class="form-actions">
				<asp:Button ID="BtnLogin" runat="server" Text="Login" class="btn bg-olive btn-block login-btn" OnClick="BtnLogin_Clicked" />

				<div style="margin-top: 10px">

					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
						Need Help?
					</button>
				</div>

				<div>

					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="color: black;">
						<div class="modal-dialog">
							<div class="modal-content">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<div class="modal-header">

									<h4 class="modal-title" id="myModalLabel">Support Phone Number</h4>
								</div>
								<div class="modal-body">
									<table>
										<tr>
											<td>
												<p>

													<video id="videoHelp" controls="controls" style="display: inline-block;" width="500" height="400">
														<source src="http://172.32.3.127:81/Video/Help2.mp4" type="video/mp4">
													</video>


												</p>
											</td>
										</tr>
										<tr>
											<td>Call customer support if you would like our friendly agents to help you resolve an issue.
												<br />
												Contact #: 7125 (IS Dev),  2674 (Dte of Bgt)</td>
											

										</tr>
									</table>
								</div>

							</div>
						</div>
					</div>


				</div>



			</div>

		</form>
		<div class="margin text-center">
		</div>
	</div>

	<%:Scripts.Render("~/bundles/jquery") %>
	<%:Scripts.Render("~/bundles/bootstrap") %>

	<script type="text/javascript">
		//var v;
		document.body.msRequestFullscreen = true;
		document.body.oncopy = function () { return false; }
		document.body.oncut = function () { return false; }
		document.body.onpaste = function () { return false; }
		//$(document).ready(function () {
		//    SetInActive();
		//    $(document).on('click', '*', function () {
		//        clearTimeout(v);
		//        SetInActive();
		//    });
		//    $(document).on('mouseover', '*', function () {
		//        clearTimeout(v);
		//        SetInActive();
		//    });
		//});
		//function SetInActive()
		//{
		//  v =  setTimeout(function () {
		//        $(dv).toggle(500)
		//    }, 10000);
		//}

	</script>
	<%-- <div id="dv" style="display:none;position:fixed;width:100%;height:100%;background-color:yellowgreen;top:0;left:0">

    </div>--%>
</body>
</html>
