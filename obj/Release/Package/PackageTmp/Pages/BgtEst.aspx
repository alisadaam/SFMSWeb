<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="BgtEst.aspx.cs"
	Inherits="BMSWeb.Pages.BgtEst" %>

<%--<%@ Assembly Src="~/bin/AjaxControlToolkit.dll" prefix="ajaxtoolkit" n Name="ajaxtoolkit" db="ajaxtoolkit" %>--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="scripts" runat="server">
	<style>
		.IframeDteGraph {
			width: 100%;
			height: 420px;
			border: none;
		}
	</style>
	<script type="text/javascript">

		$(document).ready(function () {
			var winwidth = $(window).width();
			if (winwidth < 1199) {
				$('#HEadingDiv').html('');
				$('#HEadingDiv').html('<div class="col-lg-6 col-md-6" style="padding-right: 0px;padding-left: 9px;"><h3  runat="server" style="color: #1D74D6; margin: 0px">Bgt Est Stores</h3></div><div class="col-lg-6 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amt in Million)</h4></div>');
			}
			else {
				$('#HEadingDiv').html('');
				$('#HEadingDiv').html(' <div class="col-lg-8 col-md-6"><h3  runat="server" style="color: #1D74D6; margin: 0px">Budget Estimates Stores</h3></div><div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4></div>');
			}
			$(window).on('resize', function () {

				var winwidth = $(window).width();

				if (winwidth < 1199) {
					$('#HEadingDiv').html('');
					$('#HEadingDiv').html('<div class="col-lg-6 col-md-6" style="padding-right: 0px;padding-left: 9px;"><h3  runat="server" style="color: #1D74D6; margin: 0px">Bgt Est Stores</h3></div><div class="col-lg-6 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amt in Million)</h4></div>');
				}
				else {
					$('#HEadingDiv').html('');
					$('#HEadingDiv').html(' <div class="col-lg-8 col-md-6"><h3  runat="server" style="color: #1D74D6; margin: 0px">Budget Estimates Stores</h3></div><div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4></div>');
				}
			});

		});
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
		function PSOWise() {
			swal({
				title: "Choice PSO",
				type: "warning",
				text: $("#PSODiv").html(),
				html: true,
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Show!",
				cancelButtonText: "Cancel!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false

			}, function (isConfirm) {
				if (isConfirm) {
					$.ajax({
						type: "POST",
						contentType: "application/json; charset=utf-8",
						url: "BgtEst.aspx/PopulatePSOGraph",
						data: "{PSO: '" + sessionStorage.getItem("PSONAme") + "',Curr:'" + sessionStorage.getItem("CurrNAme") + "',Uti:'" + sessionStorage.getItem("UtiNAme") + "'}",
						dataType: "json",
						//called on jquery ajax call success
						success: function (result) {
							swal({
								title: "PSO Wise Graph",
								type: "success",
								text: "<div><iframe src=" + 'GraphPageEst.aspx' + " class=" + "IframeDteGraph" + "></iframe></div>",
								html: true,
								confirmButtonColor: "#DD6B55",
								confirmButtonText: "OK!",
								closeOnConfirm: false,
								customClass: "swal-wide",
								closeOnCancel: false

							});
						},
						//called on jquery ajax call failure
						error: function ajaxError(result) {

						}
					});

				} else {
					swal("Canceled", "Now continue your task!", "success");

					//$("#MainContent_Est_Detail_Part").click();
				}
			});
		}
		function ACASWise() {
			swal({
				title: "Choice ACAS",
				type: "warning",
				text: $("#ACASDiv1").html(),
				html: true,
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Show!",
				cancelButtonText: "Cancel!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false

			}, function (isConfirm) {
				if (isConfirm) {
					$.ajax({
						type: "POST",
						contentType: "application/json; charset=utf-8",
						url: "BgtEst.aspx/PopulateACASGraph",
						data: "{ACAS: '" + sessionStorage.getItem("ACASNAme") + "',Curr:'" + sessionStorage.getItem("CurrNAme1") + "',Uti:'" + sessionStorage.getItem("UtiNAme1") + "'}",
						dataType: "json",
						//called on jquery ajax call success
						success: function (result) {
							swal({
								title: "ACAS Wise Graph",
								type: "success",
								text: "<div><iframe src=" + 'GraphPageEst.aspx' + " class=" + "IframeDteGraph" + "></iframe></div>",
								html: true,
								confirmButtonColor: "#DD6B55",
								confirmButtonText: "OK!",
								closeOnConfirm: false,
								customClass: "swal-wide",
								closeOnCancel: false

							});
						},
						//called on jquery ajax call failure
						error: function ajaxError(result) {

						}
					});

				} else {
					swal("Canceled", "Now continue your task!", "success");

					//$("#MainContent_Est_Detail_Part").click();
				}
			});
		}
		function DecWise() {
			swal({
				title: "Choice Directorate",
				type: "warning",
				text: $("#DteDiv1").html(),
				html: true,
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "Show!",
				cancelButtonText: "Cancel!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false

			}, function (isConfirm) {
				if (isConfirm) {
					$.ajax({
						type: "POST",
						contentType: "application/json; charset=utf-8",
						url: "BgtEst.aspx/PopulateDteGraph",
						data: "{Dte: '" + sessionStorage.getItem("DTENAme") + "',Curr:'" + sessionStorage.getItem("CurrNAme2") + "',Uti:'" + sessionStorage.getItem("UtiNAme2") + "'}",
						dataType: "json",
						//called on jquery ajax call success
						success: function (result) {
							swal({
								title: "Directorate Wise Graph",
								type: "success",
								text: "<div><iframe src=" + 'GraphPageEst.aspx' + " class=" + "IframeDteGraph" + "></iframe></div>",
								html: true,
								confirmButtonColor: "#DD6B55",
								confirmButtonText: "OK!",
								closeOnConfirm: false,
								customClass: "swal-wide",
								closeOnCancel: false

							});
						},
						//called on jquery ajax call failure
						error: function ajaxError(result) {

						}
					});

				} else {
					swal("Canceled", "Now continue your task!", "success");

					//$("#MainContent_Est_Detail_Part").click();
				}
			});
		}
		function DteWise() {
			swal({
				title: "Choice Graph Mode",
				type: "warning",
				text: "<div class='row' style='height:200px'><div onclick='PSOWise()' style='background-color:#0017FF;height:100%;cursor:pointer' class='col-lg-4 col-md-4 col-sm-4'><h2 style='color:white;text-align: center;padding-top: 30%;'>PSO Wise</h2></div><div onclick='ACASWise()' style='background-color:#0080FF;height:100%;cursor:pointer'class='col-lg-4 col-md-4 col-sm-4'><h2 style='color:white;text-align: center;padding-top: 30%;'>ACAS Wise</h2></div><div onclick='DecWise()' style='background-color:#8EA7CA;height:100%;cursor:pointer' class='col-lg-4 col-md-4 col-sm-4'><h2 style='color:white;text-align: center;padding-top: 30%;'>Directorate Wise</h2></div>",
				html: true,
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "No!",
				cancelButtonText: "Yes I want to Enter!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false

			});
		}
		function CommitedWise() {
			swal({
				title: "Choice Currency Type",
				type: "warning",
				text: "<div class='row' style='height:200px'><div onclick='RSWise()' style='background-color:#0017FF;height:100%;cursor:pointer' class='col-lg-6 col-md-6 col-sm-6'><h2 style='color:white;text-align: center;padding-top: 20%;'>Local Currency Wise</h2></div><div onclick='DollarWise()' style='background-color:#0080FF;height:100%;cursor:pointer'class='col-lg-6 col-md-6 col-sm-6'><h2 style='color:white;text-align: center;padding-top: 20%;'>Foreign Exchange Wise</h2></div></div>",
				html: true,
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "No!",
				cancelButtonText: "Yes I want to Enter!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false

			});
		}
	
		function RSWise() {

			$.ajax({
				type: "POST",
				contentType: "application/json; charset=utf-8",
				url: "BgtEst.aspx/PopulateCommitedGraphRS",
				//data: "{Dte: '" + sessionStorage.getItem("DTENAme") + "',Curr:'" + sessionStorage.getItem("CurrNAme2") + "',Uti:'" + sessionStorage.getItem("UtiNAme2") + "'}",
				dataType: "json",
				//called on jquery ajax call success
				success: function (result) {
					swal({
						title: "Commited Wise Graph",
						type: "success",
						text: "<div><iframe src=" + 'GraphPageEst.aspx' + " class=" + "IframeDteGraph" + "></iframe></div>",
						html: true,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "OK!",
						closeOnConfirm: false,
						customClass: "swal-wide",
						closeOnCancel: false

					});
				},
				//called on jquery ajax call failure
				error: function ajaxError(result) {

				}
			});


		}
		function DollarWise() {

			$.ajax({
				type: "POST",
				contentType: "application/json; charset=utf-8",
				url: "BgtEst.aspx/PopulateCommitedGraphFE",
				//data: "{Dte: '" + sessionStorage.getItem("DTENAme") + "',Curr:'" + sessionStorage.getItem("CurrNAme2") + "',Uti:'" + sessionStorage.getItem("UtiNAme2") + "'}",
				dataType: "json",
				//called on jquery ajax call success
				success: function (result) {
					swal({
						title: "Commited Wise Graph",
						type: "success",
						text: "<div><iframe src=" + 'GraphPageEst.aspx' + " class=" + "IframeDteGraph" + "></iframe></div>",
						html: true,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "OK!",
						closeOnConfirm: false,
						customClass: "swal-wide",
						closeOnCancel: false

					});
				},
				//called on jquery ajax call failure
				error: function ajaxError(result) {

				}
			});


		}
		function Graph_mode() {
			swal({
				title: "Choice Graph Mode",
				type: "warning",
				text: "<div class='row' style='height:300px'><div onclick='DteWise()' style='background-color:#0017FF;height:50%;cursor:pointer' class='col-lg-6 col-md-6 col-sm-6'><h2 style='color:white;    text-align: center;padding-top: 10%;'>Directorate Wise</h2></div><div style='background-color:#0080FF;height:50%'class='col-lg-6 col-md-6 col-sm-6'><h2 style='color:white;    text-align: center;padding-top: 10%;'>Appendix Wise</h2></div><div style='background-color:#8EA7CA;height:50%' class='col-lg-6 col-md-6 col-sm-6'><h2 style='color:white;    text-align: center;padding-top: 10%;'>Currency Wise</h2></div><div style='background-color:#6AA4E6;height:50%' class='col-lg-6 col-md-6 col-sm-6'><h2 style='color:white;    text-align: center;padding-top: 10%;'>Utilization Mode Wise</h2></div><div onclick='CommitedWise()' style='background-color:green;height:25%;cursor:pointer' class='col-lg-12 col-md-12 col-sm-12'><h2 style='color:white;    text-align: center;'>Commitment Wise</h2></div></div>",
				html: true,
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "OK!",
				cancelButtonText: "Cancel!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false
			}, function (isConfirm) {
				if (isConfirm) {
					swal("Misc", "Enter Current Requirement as Misc", "success");
					//$("#MainContent_Est_Detail_Misc").click();

				} else {
					swal("Canceled", "Now continue your task!", "success");

					//$("#MainContent_Est_Detail_Part").click();
				}
			});
		}
		function Detail_type1() {
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
					swal("Misc", "Your entered amount is locked as Misc Part No.", "success");
					$("#MainContent_Est_Detail_Misc").click();

				} else {
					swal("Part No", "Now Enter Part No Details", "success");

					$("#MainContent_Est_Detail_Part").click();
				}

			});
		}
		function EVTPValidate() {
			var newVal = Number($("#MainContent_EVTP").val());
			var priviousVal = Number($("#MainContent_EVTP1").val());


			if (newVal > priviousVal) {
				$("#MainContent_EVTP").val($("#MainContent_EVTP1").val());
				swal({
					title: "Error!",
					text: "Exp Disb(CFY) exceeded then Value of Contract.",
					type: "error",
					confirmButtonColor: "rgb(53, 155, 255)"
				});
				$('#MainContent_CURRENT_REQ').val('0.000');
			}
			else {
				$('#MainContent_CURRENT_REQ').val('');
				$('#MainContent_CURRENT_REQ').val((priviousVal - newVal).toFixed(3));
			}
		}
		function CurrReqValidate() {
			if ($("#MainContent_APPENDIX :selected").val() == 'A1' || $("#MainContent_APPENDIX :selected").val() == 'B1' || $("#MainContent_APPENDIX :selected").val() == 'C1' || $("#MainContent_APPENDIX :selected").val() == 'D1' || $("#MainContent_APPENDIX :selected").val() == 'E1') {
				var newVal = Number($("#MainContent_CURRENT_REQ").val()) + Number($("#MainContent_EVTP").val());
				var priviousVal = Number($("#MainContent_EVTP1").val());
				//alert(newVal.toFixed(3));
				//alert(priviousVal.toFixed(3));
				if (newVal.toFixed(3) > priviousVal.toFixed(3)) {
					swal({
						title: "Error!",
						text: "Exp Disb(NFY) exceeded then Value of Contract.",
						type: "error",
						confirmButtonColor: "rgb(53, 155, 255)"
					});
					$("#MainContent_CURRENT_REQ").val('0.000')
					$("#MainContent_EVTP").val($("#MainContent_EVTP12Input").val());
				}

				var first = $("#MainContent_EVTP").val();
				var second = $("#MainContent_CURRENT_REQ").val();

				$("#MainContent_EVTP").val((first - second).toFixed(3));
			}
			else {
				var Evtp1 = Number($("#MainContent_EVTP1").val());
				var Evtp = Number($("#MainContent_EVTP").val());
				var validate = (Evtp1 - Evtp);
				//alert('else');
				if (Number($("#MainContent_CURRENT_REQ").val()) > validate) {
					swal({
						title: "Error!",
						text: "Exp Disb(NFY) exceeded then Value of Contract.",
						type: "error",
						confirmButtonColor: "rgb(53, 155, 255)"
					});
					var newVal = $("#MainContent_EVTP").val();
					var priviousVal = $("#MainContent_EVTP1").val();
					$('#MainContent_CURRENT_REQ').val('');
					$('#MainContent_CURRENT_REQ').val((priviousVal - newVal).toFixed(3));
				}
			}
		}

		function BACvalidate() {
			$("#MainContent_EVTP1").val($("#MainContent_BAC_Alloc").val().trim(''));
		}

		function EVTPValidate1() {
			var newVal = Number($("#MainContent_ExpDisbCFYRRC").val());
			var priviousVal = Number($("#MainContent_AllocAmt1").val());


			if (newVal > priviousVal) {
				$("#MainContent_ExpDisbCFYRRC").val($("#MainContent_AllocAmt1").val());
				swal({
					title: "Error!",
					text: "Exp Disb(CFY) exceeded then Value of Contract.",
					type: "error",
					confirmButtonColor: "rgb(53, 155, 255)"
				});
				$('#MainContent_ExpDisbNFYRRC').val('0.000');
			}
			else {
				$('#MainContent_ExpDisbNFYRRC').val('');
				$('#MainContent_ExpDisbNFYRRC').val((priviousVal - newVal).toFixed(3));
			}
		}
		function SetVAlues() {
			document.getElementById("MainContent_ExpDisbCFYRRC").value = document.getElementById("MainContent_AllocAmountRRC").value;



		}

		function SetValtoZero() {
			if (document.getElementById("MainContent_POM_DDL").value == "Add_Req_Nxt") {
				document.getElementById("MainContent_ExpDisbCFYRRC").value = 0;
			}
		}
		function EVTPValidate1() {
			var newVal = Number($("#MainContent_ExpDisbCFYRRC").val());
			var priviousVal = Number($("#MainContent_AllocAmt1").val());


			if (newVal > priviousVal) {
				$("#MainContent_ExpDisbCFYRRC").val($("#MainContent_AllocAmt1").val());
				swal({
					title: "Error!",
					text: "Exp Disb(CFY) exceeded then Value of Contract.",
					type: "error",
					confirmButtonColor: "rgb(53, 155, 255)"
				});
				$('#MainContent_ExpDisbNFYRRC').val('0.000');
			}
			else {
				$('#MainContent_ExpDisbNFYRRC').val('');
				$('#MainContent_ExpDisbNFYRRC').val((priviousVal - newVal).toFixed(3));
			}
		}
		function BACvalidate1() {
			$("#MainContent_AllocAmt1").val($("#MainContent_AllocAmountRRC").val().trim(''));
			SetVAlues();
		}

		function UpdateLabelCIMS() {
			var fieldlbl = $('#MainContent_ExpCfy12').html();
			var sndfieldlbl = $('#MainContent_ExpNfy12').html();

			fieldlbl += ' (CMIS)';
			sndfieldlbl += ' (CMIS)';
			$('#MainContent_ExpCfy12').html(fieldlbl);
			$('#MainContent_ExpNfy12').html(sndfieldlbl);

			var rem = $('#MainContent_ExpCfy1').html().split('(C')[0];
			var remother = $('#MainContent_ExpNfy1').html().split('(C')[0];
			//alert(rem + " -- " + remother);

			$('#MainContent_ExpCfy1').html(rem);
			$('#MainContent_ExpNfy1').html(remother);
		}
		function SeesionQuery(e) {
			var a = e.value;
			sessionStorage.setItem("PSONAme", a);
		}
		function SeesionQueryCurr(e) {
			var a = e.value;
			sessionStorage.setItem("CurrNAme", a);
		}
		function SeesionQueryUti(e) {
			var a = e.value;
			sessionStorage.setItem("UtiNAme", a);
		}
		function SeesionQuery1(e) {
			var a = e.value;
			sessionStorage.setItem("ACASNAme", a);
		}
		function SeesionQuery2(e) {
			var a = e.value;
			sessionStorage.setItem("DTENAme", a);
		}
		function SeesionQueryCurr1(e) {
			alert(e.value);
			var a = e.value;
			sessionStorage.setItem("CurrNAme1", a);
		}
		function SeesionQueryCurr2(e) {
			alert(e.value);
			var a = e.value;
			sessionStorage.setItem("CurrNAme2", a);
		}
		function SeesionQueryUti1(e) {
			var a = e.value;
			sessionStorage.setItem("UtiNAme1", a);
		}
		function SeesionQueryUti2(e) {
			var a = e.value;
			sessionStorage.setItem("UtiNAme2", a);
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
			width: 660px !important;
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


	<%--      <div class="row">
          <div class="col-lg-11"></div>76            <div class="col-lg-1">
                  <asp:Button runat="server" CssClass="btn btn-primary margin" Text="Reload" ID="ReloadPage" OnClick="ReloadPage_Click" />
              </div>
            </div>--%>
	<%--    <div id="accordion" role="tablist" aria-multiselectable="true" runat="server">
            <div class="panel panel-default">
                <div class="panel-heading gradient" style="color: #FFFFFF;" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <div style="cursor: pointer" data-toggle="collapse" id="ReportAccordian" data-parent="#accordion" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                           Estimates Stores
                        </div>
                    </h4>
                </div>
                dsadsadsadasd
                 </div>
        </div>--%>
	<script>
		var prm = Sys.WebForms.PageRequestManager.getInstance();
		prm.add_endRequest(function () {
			var winwidth = $(window).width();
			if (winwidth < 1199) {
				$('#HEadingDiv').html('');
				$('#HEadingDiv').html('<div class="col-lg-6 col-md-6" style="padding-right: 0px;padding-left: 9px;"><h3  runat="server" style="color: #1D74D6; margin: 0px">Bgt Est Stores</h3></div><div class="col-lg-6 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amt in Million)</h4></div>');
			}
			else {
				$('#HEadingDiv').html('');
				$('#HEadingDiv').html(' <div class="col-lg-8 col-md-6"><h3  runat="server" style="color: #1D74D6; margin: 0px">Budget Estimates Stores</h3></div><div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4></div>');
			}
			$(window).on('resize', function () {

				var winwidth = $(window).width();
				if (winwidth < 1199) {
					$('#HEadingDiv').html('');
					$('#HEadingDiv').html('<div class="col-lg-6 col-md-6" style="padding-right: 0px;padding-left: 9px;"><h3  runat="server" style="color: #1D74D6; margin: 0px">Bgt Est Stores</h3></div><div class="col-lg-6 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amt in Million)</h4></div>');
				}
				else {
					$('#HEadingDiv').html('');
					$('#HEadingDiv').html(' <div class="col-lg-8 col-md-6"><h3  runat="server" style="color: #1D74D6; margin: 0px">Budget Estimates Stores</h3></div><div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;"><h4  runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4></div>');
				}
			});

		});

	</script>

	<div class="row" id="main_form" runat="server">

		<%-- Model display on finalize button data --%>

		<div hidden id="Model_Finalize" style="overflow: auto; height: 117px;">
			<asp:GridView ID="GridFinalizeSummery" Font-Size="Small" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True">
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
		<%-- Model display on finalize button data --%>


		<div class="col-md-5 col-lg-5 padingRight5px">
			<asp:Panel runat="server" ID="EstPanal">
				<%--  <h3 style="color: #1D74D6; margin: 0px">Budget Estimates Stores</h3> Budget Estimates Stores --%>
				<div id="HEadingDiv">
					<div class="col-lg-8 col-md-6">
						<h3 id="BgtEstStor" runat="server" style="color: #1D74D6; margin: 0px">Budget Estimates Stores</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h4 runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
					</div>
				</div>
				<div class="col-lg-12 col-md-12" style="padding-right: 0px; padding-left: 0px">

					<div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">
						<%-- Hideen Session for Graphs --%>
						<div id="DteDiv1" class="row" style="display: none">
							<div class="col-lg-4 col-md-4 buttom-margin">
								<asp:DropDownList CssClass="form-control" ID="DteDll2" onchange="SeesionQuery2(this)" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" AutoPostBack="true" runat="server">
								</asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin">
								<asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="currancy3" onchange="SeesionQueryCurr2(this)" runat="server">
									<asp:ListItem Value=""> Select Currency</asp:ListItem>
									<asp:ListItem Value="F"> FE</asp:ListItem>
									<asp:ListItem Value="P"> Rs</asp:ListItem>
								</asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin">
								<asp:DropDownList CssClass="form-control" ID="UTILIZATION_MODE3" DataValueField="UTILIZATION_CODE" onchange="SeesionQueryUti2(this)" DataTextField="UTILIZATION_DECODE" AutoPostBack="true" runat="server"></asp:DropDownList>
							</div>
						</div>
						<div id="ACASDiv1" class="row" style="display: none">
							<div class="col-lg-4 col-md-4 buttom-margin ">
								<asp:DropDownList CssClass="form-control" ID="ACASDDL1" onchange="SeesionQuery1(this)" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" runat="server">
								</asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin">
								<asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="currancy2" onchange="SeesionQueryCurr1(this)" runat="server">
									<asp:ListItem Value=""> Select Currency</asp:ListItem>
									<asp:ListItem Value="F"> FE</asp:ListItem>
									<asp:ListItem Value="P"> Rs</asp:ListItem>
								</asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin">
								<asp:DropDownList CssClass="form-control" ID="UTILIZATION_MODE2" DataValueField="UTILIZATION_CODE" onchange="SeesionQueryUti1(this)" DataTextField="UTILIZATION_DECODE" AutoPostBack="true" runat="server"></asp:DropDownList>
							</div>
						</div>
						<%--<div id="dteDiv" class="row" style="display: none">
							<asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Directorateddl1_SelectedIndexChanged"></asp:DropDownList>
						</div>
						<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px">
							<asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="Directorateddl1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Directorateddl1_SelectedIndexChanged"></asp:DropDownList>
						</div>--%>
						<div id="PSODiv" class="row" style="display: none">
							<div class="col-lg-4 col-md-4 buttom-margin">
								<asp:DropDownList CssClass="form-control" onchange="SeesionQuery(this)" ID="PSOddl1" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" runat="server" AutoPostBack="True"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin">
								<asp:DropDownList AutoPostBack="true" CssClass="form-control" onchange="SeesionQueryCurr(this)" ID="currancy1" runat="server">
									<asp:ListItem Value=""> Select Currency</asp:ListItem>
									<asp:ListItem Value="F"> FE</asp:ListItem>
									<asp:ListItem Value="P"> Rs</asp:ListItem>
								</asp:DropDownList>
							</div>

							<div class="col-lg-4 col-md-4 buttom-margin">
								<asp:DropDownList CssClass="form-control" ID="UTILIZATION_MODE1" DataValueField="UTILIZATION_CODE" onchange="SeesionQueryUti(this)" DataTextField="UTILIZATION_DECODE" AutoPostBack="true" runat="server"></asp:DropDownList>
							</div>
						</div>

						<%-- Hideen Session for Graphs  End--%>
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
										<div hidden class="col-lg-4 col-md-4 buttom-margin padingLeft1px">
											<%-- <asp:DropDownList Enabled="false" Enabled="false" CssClass="form-control" ID="DropDownList2" runat="server">
                                  <asp:ListItem value=""> BE</asp:ListItem>
                               
                             </asp:DropDownList> --%>
											<asp:DropDownList Enabled="false" CssClass="form-control" AutoPostBack="true" ID="ESTIMATION_TYPE" DataValueField="BGT_EST_CODE" DataTextField="BGT_EST_DECODE" runat="server" OnSelectedIndexChanged="ESTIMATION_TYPE_SelectedIndexChanged"></asp:DropDownList>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ESTIMATION_TYPE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Est Type Missing"></asp:RequiredFieldValidator>
										</div>

										<div class="col-lg-4 col-md-4 buttom-margin padingRight1px">

											<asp:DropDownList CssClass="form-control" Visible="false" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

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
										<asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="UTILIZATION_MODE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Utilization Mode Missing"></asp:RequiredFieldValidator>
									</div>

									<div id="TofDiv" runat="server" class="col-lg-4 col-md-4 buttom-margin  padingRight1px">
										<asp:DropDownList CssClass="form-control" ID="TOF_Headsddl" DataValueField="HEAD_CODE" DataTextField="HEAD_DESC_LONG" runat="server" AutoPostBack="True"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="TOF_Headsddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="TOF Head Missing"></asp:RequiredFieldValidator>
									</div>

									<div id="TofAgnDiv" runat="server" class="col-lg-4 col-md-4 buttom-margin  padingLeft1px padingRight1px">
										<asp:DropDownList CssClass="form-control" ID="Tof_agencies" DataValueField="AGENCY_CODE" DataTextField="AGENCY_DECODE" runat="server" AutoPostBack="True"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator31" ControlToValidate="Tof_agencies" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="AGENCY Missing"></asp:RequiredFieldValidator>
									</div>
									<div class="col-lg-4 col-md-4 buttom-margin  padingRight1px">
										<asp:DropDownList CssClass="form-control" ID="LP_Headsddl" DataValueField="LP_HEAD_CODE" DataTextField="LP_HEAD_DECODE" runat="server" AutoPostBack="True" OnSelectedIndexChanged="LP_Headsddl_SelectedIndexChanged"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="LP_Headsddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="LP Head Missing"></asp:RequiredFieldValidator>
									</div>
								</div>
								<div hidden class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
									<asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="REQUIREMENT_TYPE" DataValueField="REQUIREMENT_CODE" DataTextField="REQUIREMENT_DECODE" runat="server" OnSelectedIndexChanged="REQUIREMENT_TYPE_SelectedIndexChanged"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="REQUIREMENT_TYPE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Requirement Type Missing"></asp:RequiredFieldValidator>
								</div>

								<div hidden class="col-lg-4 col-md-4 buttom-margin padingLeft1px">
									<asp:DropDownList CssClass="form-control" ID="Type" runat="server">
										<asp:ListItem Value=""> Select Type</asp:ListItem>
										<asp:ListItem Value="F"> Fresh</asp:ListItem>
										<asp:ListItem Value="C"> Carry Over</asp:ListItem>
									</asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="Type" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Type Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-12 padingRight1px" runat="server" id="ViewGridDiv">
									<asp:RadioButton Checked="true" Visible="false" AutoPostBack="true" GroupName="ContractType" ID="ContractRb" runat="server" Text="Contracts" OnCheckedChanged="ContractRb_CheckedChanged" />
									<asp:RadioButton AutoPostBack="true" Visible="false" GroupName="ContractType" ID="ExpectedRb" runat="server" Text="Expected Contracts CFY" OnCheckedChanged="ExpectedRb_CheckedChanged" />
									<asp:Button runat="server" class="btn btn-primary btn-sm" Style="float: right;" Text="View Demand" ID="btnViewGrid" OnClick="btnViewGrid_Click" />
									<asp:Button runat="server" CssClass="btn btn-primary" Style="float: right; margin-right: 5px" Text="Clear Selection" ID="Button1" OnClick="ReloadPage_Click" />
							<%--		<% if (Session["USERNAME"].ToString().Equals("LC1C"))
			{ %>
									<asp:Button runat="server" CssClass="btn btn-primary" Style="float: right; margin-right: 5px" Text="Graph Mode" ID="BtnGraphMode" OnClick="BtnGraphMode_Click" />
									<% } %>--%>
								</div>
							</asp:Panel>
						</div>

					</div>

					<div class="box box-primary">
						<div class="box-body">

							<div class="row  buttom-margin">
								<div class="col-lg-12 buttom-margin" runat="server" id="DesDiv">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Description</asp:Label>
									<asp:TextBox CssClass="Upper-case" Width="100%" ID="DESCRIPTION" placeholder="Description" runat="server" Height="50px" TextMode="MultiLine"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="DESCRIPTION" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Description Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-4 col-md-4 padingRight1px">

									<asp:DropDownList Enabled="false" CssClass="form-control" ID="PROJECT_IDddl" DataValueField="PROJECT_CODE" DataTextField="PROJECT_DECODE" runat="server" OnSelectedIndexChanged="PROJECT_IDddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="PROJECT_IDddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Project Missing"></asp:RequiredFieldValidator>

								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px padingRight1px">

									<asp:DropDownList Enabled="false" CssClass="form-control" ID="PDIB_STATUS" DataValueField="PDIB_STATUS_CODE" DataTextField="PDIB_STATUS_DECODE" runat="server" OnSelectedIndexChanged="PDIB_STATUS_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="PDIB_STATUS" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="PDIB Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px">

									<asp:DropDownList Enabled="false" CssClass="form-control" ID="MeetingDdl" runat="server" OnSelectedIndexChanged="MeetingDdl_SelectedIndexChanged" AutoPostBack="True">
										<asp:ListItem Value=""> Select Meeting</asp:ListItem>
										<asp:ListItem Value="1"> 1</asp:ListItem>
										<asp:ListItem Value="2"> 2</asp:ListItem>
										<asp:ListItem Value="3"> 3</asp:ListItem>
										<asp:ListItem Value="4"> 4</asp:ListItem>
										<asp:ListItem Value="5"> 5</asp:ListItem>
										<asp:ListItem Value="6"> 6</asp:ListItem>
										<asp:ListItem Value="7"> 7</asp:ListItem>
										<asp:ListItem Value="8"> 8</asp:ListItem>
										<asp:ListItem Value="9"> 9</asp:ListItem>
										<asp:ListItem Value="10"> 10</asp:ListItem>
										<asp:ListItem Value="11"> 11</asp:ListItem>
										<asp:ListItem Value="12"> 12</asp:ListItem>
										<asp:ListItem Value="13"> 13</asp:ListItem>
										<asp:ListItem Value="14"> 14</asp:ListItem>
										<asp:ListItem Value="15"> 15</asp:ListItem>
										<asp:ListItem Value="16"> 16</asp:ListItem>
										<asp:ListItem Value="17"> 17</asp:ListItem>
										<asp:ListItem Value="18"> 18</asp:ListItem>
										<asp:ListItem Value="19"> 19</asp:ListItem>
										<asp:ListItem Value="20"> 20</asp:ListItem>
										<asp:ListItem Value="21"> 21</asp:ListItem>
										<asp:ListItem Value="22"> 22</asp:ListItem>
										<asp:ListItem Value="23"> 23</asp:ListItem>
										<asp:ListItem Value="24"> 24</asp:ListItem>
										<asp:ListItem Value="25"> 25</asp:ListItem>
										<asp:ListItem Value="26"> 26</asp:ListItem>
										<asp:ListItem Value="27"> 27</asp:ListItem>
										<asp:ListItem Value="28"> 28</asp:ListItem>
										<asp:ListItem Value="29"> 29</asp:ListItem>
										<asp:ListItem Value="30"> 30</asp:ListItem>
										<asp:ListItem Value="Special"> Special</asp:ListItem>
										<asp:ListItem Value="0">N/A</asp:ListItem>
									</asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator33" ControlToValidate="MeetingDdl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Meeting Missing"></asp:RequiredFieldValidator>
								</div>

							</div>
							<div class="row  buttom-margin">
								<div class="col-lg-4 col-md-4 padingRight1px">

									<asp:DropDownList Enabled="false" CssClass="form-control" ID="Priorty" runat="server" OnSelectedIndexChanged="Priorty_SelectedIndexChanged" AutoPostBack="True">
										<asp:ListItem Value=""> Select Priorty</asp:ListItem>
										<asp:ListItem Value="1"> I</asp:ListItem>
										<asp:ListItem Value="2"> II</asp:ListItem>
										<asp:ListItem Value="3"> III</asp:ListItem>
									</asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="Priorty" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Priorty Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px padingRight1px">

									<asp:DropDownList Enabled="false" CssClass="form-control" ID="WEAPON_SYS" DataValueField="WPN_SYS_CODE" DataTextField="WEAPON_SYSTEM" runat="server" OnDataBound="WEAPON_SYS_DataBound" OnSelectedIndexChanged="WEAPON_SYS_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="WEAPON_SYS" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Weapon Sys Missing"></asp:RequiredFieldValidator>

								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px ">

									<asp:DropDownList Enabled="false" CssClass="form-control" ID="EQUIPMENT_CAT" DataValueField="HEAD_CODE" DataTextField="HEAD_DESCRIPTION" runat="server" OnDataBound="EQUIPMENT_CAT_DataBound" OnSelectedIndexChanged="EQUIPMENT_CAT_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="EQUIPMENT_CAT" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Equipment Cat Missing"></asp:RequiredFieldValidator>


									<asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="ContractNoddl" DataValueField="CONTRACT_NO" DataTextField="CONTRACT_NO" runat="server" OnDataBound="ContractNoddl_DataBound" OnSelectedIndexChanged="ContractNoddl_SelectedIndexChanged"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator34" ControlToValidate="ContractNoddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Contract No Missing"></asp:RequiredFieldValidator>

									<%-- <asp:Label style="color: #3C8DBC;font-weight: 700;"  runat="server">BAC</asp:Label>--%>
								</div>
								<div id="LP_Year_Div" visible="false" runat="server" class="col-lg-12 col-md-12  ">
									<asp:DropDownList CssClass="form-control" ID="LP_Year_ddl" DataValueField="Year_Code" DataTextField="Year_Decode" AutoPostBack="true" runat="server" OnDataBound="LP_Year_ddl_DataBound"></asp:DropDownList>
								</div>
								<div id="BACdiv" visible="false" runat="server" class="col-lg-12 col-md-12 padingLeft1px ">
									<asp:DropDownList CssClass="form-control" ID="BACddl" DataValueField="bac_no" DataTextField="bac_no" AutoPostBack="true" runat="server" OnDataBound="BACddl_DataBound" OnSelectedIndexChanged="BACddl_SelectedIndexChanged"></asp:DropDownList>
									<asp:RequiredFieldValidator Visible="false" ID="RequiredFieldValidator28" ControlToValidate="BACddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="BAC Missing"></asp:RequiredFieldValidator>
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Description</asp:Label>
									<asp:TextBox Width="100%" CssClass="Upper-case" Enabled="false" Height="50px" TextMode="MultiLine" placeholder="Description" ID="Bac_Remarks" runat="server" AutoComplete="Off"></asp:TextBox>
								</div>
								<div class="col-lg-4 col-md-4 padingRight1px" runat="server" id="RrcDiv">
									<asp:DropDownList CssClass="form-control" ID="RRC_NoDDL" DataValueField="RRC_NO" DataTextField="RRC_NO" AutoPostBack="true" runat="server" OnDataBound="RRC_NoDDL_DataBound" OnSelectedIndexChanged="RRC_NoDDL_SelectedIndexChanged"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator32" ControlToValidate="RRC_NoDDL" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="RRC Missing"></asp:RequiredFieldValidator>
								</div>
								<div visible="false" class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px" runat="server" id="DivCurrencyRRC">

									<asp:TextBox CssClass="form-control" Enabled="false" placeholder="Currency" ID="CurrencyRRC" runat="server" AutoComplete="Off"></asp:TextBox>
								</div>
								<div visible="false" class="col-lg-4 col-md-4 buttom-margin padingLeft1px" runat="server" id="POMS_Div">
									<asp:DropDownList Enabled="false" CssClass="form-control" ID="POM_DDL" DataValueField="PO_NO" DataTextField="PO_NO" AutoPostBack="true" runat="server" OnDataBound="POM_DDL_DataBound" OnSelectedIndexChanged="POM_DDL_SelectedIndexChanged"></asp:DropDownList>
									<asp:RequiredFieldValidator Visible="false" ID="RequiredFieldValidator38" ControlToValidate="POM_DDL" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="POMS Missing"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div id="ContractDetails" runat="server" class="row buttom-margin padingRight1px">
								<div id="CurrtReqDiv" runat="server" class="col-lg-4 col-md-4 padingRight1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="ContractDatelbl" runat="server">Contract Date</asp:Label>
									<asp:TextBox CssClass="form-control" Enabled="false" placeholder="Contract Date" ID="ContractDate" runat="server" AutoComplete="Off"></asp:TextBox>

								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px padingRight1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="NoSLbl" runat="server">Nature Of Stores</asp:Label>
									<asp:TextBox CssClass="form-control" Enabled="false" placeholder="NOF" ID="NOF" AutoComplete="Off" runat="server"></asp:TextBox>

								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="EDDlbl" runat="server">EDD</asp:Label>
									<asp:TextBox CssClass="form-control" Enabled="false" placeholder="EDD" ID="EDD" AutoComplete="Off" runat="server"></asp:TextBox>

								</div>
							</div>
							<div id="CarryOverExtra" runat="server" class="row buttom-margin">
								<div class="col-lg-4 col-md-4  padingRight1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Val&nbsp;Of&nbsp;Contract</asp:Label>
									<asp:TextBox CssClass="form-control" Enabled="false" placeholder="Total Amount" ID="TotalAmount" AutoComplete="Off" runat="server"></asp:TextBox>


								</div>
								<div class="col-lg-4 col-md-4  padingRight1px padingLeft1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Currency</asp:Label>
									<asp:TextBox CssClass="form-control" Enabled="false" placeholder="Currency" AutoComplete="Off" ID="CurrencyCaryOver" runat="server"></asp:TextBox>
								</div>
								<div class="col-lg-4 col-md-4  padingLeft1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Paid Till 30-06-<span id="CurrntYearLock" runat="server"></span></asp:Label>
									<asp:TextBox CssClass="form-control" Enabled="false" placeholder="PTLFY" AutoComplete="Off" ID="PTLFY" runat="server"></asp:TextBox>
								</div>
								<div hidden class="col-lg-4 col-md-4   padingLeft1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Parity Rate</asp:Label>
									<asp:TextBox CssClass="form-control" Enabled="false" placeholder="Rate" AutoComplete="Off" ID="Rate" runat="server"></asp:TextBox>
								</div>

								<div hidden class="col-lg-4 col-md-4 padingRight1px padingLeft1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">In Dollar($)</asp:Label>
									<asp:TextBox CssClass="form-control" Enabled="false" placeholder="InDollar" AutoComplete="Off" ID="InDollar" runat="server"></asp:TextBox>



								</div>
								<div class="col-lg-4 col-md-4  padingLeft1px">
								</div>

							</div>
							<div id="RRCExtra" runat="server" class="row buttom-margin">
								<div class="col-lg-4 col-md-4  padingRight1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Amount</asp:Label>
									<input hidden id="AllocAmt1" runat="server" />
									<asp:TextBox CssClass="form-control" Enabled="false" onblur="javascript: BACvalidate1()" placeholder="Alloc Amount" AutoComplete="Off" ID="AllocAmountRRC" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator Visible="false" ID="RequiredFieldValidator39" ControlToValidate="AllocAmountRRC" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Alloc Amount Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-4 col-md-4 adingLeft1px padingRight1px padingLeft1px" runat="server" id="divExpDisbCFYRRC">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Exp&nbsp;Disb<span id="ExpCfy" runat="server"></span></asp:Label>
									<asp:TextBox CssClass="form-control text-Align" onblur="javascript: EVTPValidate1()" onkeypress="return onlyNumbers();" placeholder="Exp Disb (CFY)" AutoComplete="Off" ID="ExpDisbCFYRRC" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator Visible="false" ID="RequiredFieldValidator40" ControlToValidate="ExpDisbCFYRRC" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Exp Disb CFY Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px ">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Exp&nbsp;Disb<span id="ExpNfy" runat="server"></span></asp:Label>
									<asp:TextBox CssClass="form-control text-Align" onfocusout="SetValtoZero()" onblur="javascript: CurrReqValidate1()" onkeypress="return onlyNumbers();" placeholder="Exp Disb(NFY)" AutoComplete="Off" ID="ExpDisbNFYRRC" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator Visible="false" ID="RequiredFieldValidator41" ControlToValidate="ExpDisbNFYRRC" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Exp Disb NFY Missing"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div id="CarryOverExtra1" runat="server" class="row buttom-margin">
								<div id="PaidTDCFY" runat="server" class="col-lg-4 col-md-4  padingRight1px">

									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Total&nbsp;Paid&nbsp;During&nbsp;CFY</asp:Label>
									<asp:TextBox CssClass="form-control" Enabled="false" placeholder="Total Paid" AutoComplete="Off" ID="TotalPaid" runat="server"></asp:TextBox>
								</div>
								<div id="BAC_Allocdiv" visible="false" runat="server" class="col-lg-4 col-md-4  padingRight1px">
									<asp:Label ID="BACAmountLbl" Style="color: #3C8DBC; font-weight: 700;" runat="server">Alloc Amount</asp:Label>
									<asp:TextBox CssClass="form-control right-align" onblur="javascript: BACvalidate()" placeholder="Amount" AutoComplete="Off" ID="BAC_Alloc" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator36" ControlToValidate="BAC_Alloc" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Alloc Amount Missing"></asp:RequiredFieldValidator>

								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px padingRight1px " id="ExpCfy12Div" runat="server" visible="false">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Exp&nbsp;Disb&nbsp<span id="ExpCfy12" runat="server"></span></asp:Label>
									<asp:TextBox CssClass="text-Align form-control" ID="EVTP12Input" Enabled="false" onkeypress="return onlyNumbers();" placeholder="Exp Disb (CFY)" AutoComplete="Off" runat="server"></asp:TextBox>

								</div>
								<div class="col-lg-4 col-md-4 padingLeft1px " id="ExpNfy12Div" runat="server" visible="false">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Exp&nbsp;Disb&nbsp<span id="ExpNfy12" runat="server"></span></asp:Label>
									<asp:TextBox CssClass="text-Align form-control" ID="ExpNfy12Input" Enabled="false" onkeypress="return onlyNumbers();" placeholder="Exp Disb (NFY)" AutoComplete="Off" runat="server"></asp:TextBox>

								</div>
								<div id="EstPaidDiv" runat="server" class="col-lg-4 col-md-4 padingLeft1px padingRight1px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Exp&nbsp;Disb&nbsp;<span id="ExpCfy1" runat="server"></span></asp:Label>
									<input id="EVTP1" runat="server" hidden />
									<asp:TextBox CssClass="text-Align form-control" placeholder="Est Val (CFY)" onblur="javascript: EVTPValidate()" onkeypress="return onlyNumbers();" ID="EVTP" AutoComplete="Off" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator35" ControlToValidate="EVTP" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Exp Disb (CFY) Missing"></asp:RequiredFieldValidator>
								</div>

								<div class="col-lg-4 col-md-4 padingLeft1px" id="CURRENT_REQDiv" runat="server">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Exp&nbsp;Disb&nbsp<span id="ExpNfy1" runat="server"></span></asp:Label>
									<asp:TextBox CssClass="text-Align form-control" ID="CURRENT_REQ" onblur="javascript: CurrReqValidate()" onkeypress="return onlyNumbers();" placeholder="Exp Disb (NFY)" AutoComplete="Off" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator37" ControlToValidate="CURRENT_REQ" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Exp Disb (NFY) Missing"></asp:RequiredFieldValidator>

								</div>
							</div>
							<div class="row" style="margin: 15px" hidden>
								<fieldset class="fieldset1">
									<legend style="color: #3C8DBC;" id="ReqLegend" class="legend1">Requirement 2017-2018</legend>
									<div class="form-group">

										<asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="CURRENT_REQ" runat="server" Display="None" ErrorMessage="Numbers allowed" ValidationExpression="\d+" ValidationGroup="VGNew"></asp:RegularExpressionValidator>

										<asp:TextBox Width="75px" ID="PSO_REC" placeholder="PSO App" runat="server"></asp:TextBox>
										<asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="PSO_REC" runat="server" Display="None" ErrorMessage="Numbers allowed" ValidationExpression="\d+" ValidationGroup="VGNew"></asp:RegularExpressionValidator>

										<asp:TextBox Width="75px" ID="PLANS_REC" placeholder="Rec by Plans" runat="server"></asp:TextBox>
										<asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="PLANS_REC" runat="server" Display="None" ErrorMessage="Numbers allowed" ValidationExpression="\d+" ValidationGroup="VGNew"></asp:RegularExpressionValidator>

										<asp:TextBox Width="75px" ID="DCAS_SUP_REC" placeholder="DCAS Supp" runat="server"></asp:TextBox>
										<asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="DCAS_SUP_REC" runat="server" Display="None" ErrorMessage="Numbers allowed" ValidationExpression="\d+" ValidationGroup="VGNew"></asp:RegularExpressionValidator>



									</div>
								</fieldset>
							</div>
							<div class="row">

								<div class="col-lg-12 buttom-margin" runat="server" id="Div2">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Justification</asp:Label>
									<asp:TextBox CssClass="Upper-case" Width="100%" ID="Justification" placeholder="Justification" runat="server" Height="50px" TextMode="MultiLine">
									</asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="Justification" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Justification Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 buttom-margin">
									<fieldset class="fieldset1">
										<legend style="margin-bottom: 0px !important; color: #3C8DBC; font-weight: 700; font-size: 14px">Last Year</legend>
										<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Amount Dem</asp:Label>
											<asp:TextBox CssClass="text-Align" Width="40%" placeholder="Demanded " ID="AMT_DEMANDED_LAST_YEAR" AutoComplete="Off" runat="server"></asp:TextBox>


											<%--  <ajaxToolkit:MaskedEditExtender runat="server"
    TargetControlID="AMT_DEMANDED_LAST_YEAR" 
    Mask="9.9,999,999.99"
    MessageValidatorTip="true" 
    OnFocusCssClass="MaskedEditFocus" 
    OnInvalidCssClass="MaskedEditError"
    MaskType="Number" 
    InputDirection="LeftToRight"
    AcceptNegative="Left" 
    DisplayMoney="None"
    ErrorTooltipEnabled="True" 
    ClearTextOnInvalid="true" PromptCharacter=""/>--%>


											<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                                ControlToValidate="AMT_DEMANDED_LAST_YEAR" runat="server" ForeColor="Red" 
                                                Display="None" ErrorMessage="Numbers Only in Amt Dem" ValidationExpression="^(((\d{1,3})(,\d{3})*)|(\d+))(.\d+)?$"
                                                ValidationGroup="grp_est"></asp:RegularExpressionValidator>--%>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="AMT_DEMANDED_LAST_YEAR" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Demanded Last Year Missing"></asp:RequiredFieldValidator>
										</div>
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

						<%-- <div style="display:none" id="Sub-foam" class="box box-primary">
            <div class="box-body">

                <input type="text" placeholder="Part No" id="PartNo" style="width:15%" />
                <input type="text" placeholder="Nomenclature" id="Nomenclature" style="width:15%" />
                <input type="text" placeholder="ERRC" id="ERRC" style="width:15%" />
                <input type="text" placeholder="Type" id="Type" style="width:15%" />
                <div class="row" style="margin:15px">
                    <fieldset class="fieldset1" style="margin-bottom:10px !important">
                        <legend id="ReqLegend" class="legend1">Definitize Asset Details</legend>
                        <div class="form-group">
                            <input type="number" style="width:15%" id="AuthAsset" placeholder="Auth Asset" />
                            <input type="number" style="width:15%" id="Holding" placeholder="Holding" />
                            <input type="number" style="width:15%" id="Demanded" placeholder="Demanded" />
                        </div>
                    </fieldset>
                </div>
                <input type="number" placeholder="Req Quantity" id="ReqQuantity" style="width:15%" />
                <input type="number" placeholder="Unit Cost" id="UnitCost" style="width:15%" />

                <input type="number" placeholder="Net Demanded Value" id="NetDemandedValue" style="width:15%" />

            </div>
        </div>--%>
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

					<div style="overflow: auto; height: 95px;">
						<asp:GridView ID="GridViewSummery" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDataBound="GridViewSummery_RowDataBound">
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
									<HeaderTemplate>Appendix</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("APPENDIX_DECODE") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0;">
											<asp:Label Text="" runat="server" />
										</div>
									</FooterTemplate>
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

		<div id="GridDiv" runat="server" class="col-md-7 col-lg-7 padingLeft5px">
			<div class="col-lg-8 col-md-7">
				<h3 id="TReq" runat="server" style="color: #1D74D6; margin: 0px">Total Requirements</h3>
			</div>
			<div class="col-lg-4 col-md-5" style="text-align: right; padding-top: 5px;">
				<h4 id="H1" runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
			</div>

			<div runat="server" id="MainDetails" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px">

				<div class="box-body">

					<div id="gridContainer" style="overflow: auto; height: 479px;">


						<%--GridLines="None" Width="99%"--%>
						<asp:GridView ID="GridEstimates" DataKeyNames="FY,DTE_SYMBOL,APPENDIX,SER_NO,DESCRIPTION,PROJECT_ID,PDIB_STATUS,PDIB_MEETING_NO,PRIORITY,EQUIPMENT_CAT,WEAPON_SYS,AMT_DEMANDED_LAST_YEAR,AMT_ALLOCATED_LAST_YEAR,JUSTIFICATION,INDENTED_PO,CONTRACTED_RO" OnRowDataBound="GridEstimates_RowDataBound" ShowFooter="true" OnRowCommand="GridEstimates_RowCommand" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDeleting="GridEstimates_RowDeleting" OnRowCreated="GridEstimates_RowCreated">
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


								<%-- <asp:BoundField DataField="SNO" HeaderText="Sr No" Visible="True">
                                             
                                            </asp:BoundField>--%>


								<asp:TemplateField>
									<HeaderTemplate>Description</HeaderTemplate>
									<ItemTemplate>
										<asp:Label  ID="lblDescWithToolTip" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
									</ItemTemplate>

								</asp:TemplateField>


								<%-- <asp:TemplateField>
                                    <HeaderTemplate>Eqpmt Cat</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label  ID="lblEqpmt_Cat"  runat="server" Text='<%#Eval("EQUIPMENT_CAT_DECODE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <%-- <asp:Label  ID="Label1" Text="Total" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>--%>

								<%-- <asp:BoundField DataField="EQUIPMENT_CAT_DECODE" HeaderText="Eqpmt Cat" Visible="True"></asp:BoundField>
								--%>



								<%--     <asp:BoundField DataField="AMT_ALLOC_LAST_TO_LAST" HeaderText="Alloc" Visible="True"></asp:BoundField>--%>

								<asp:TemplateField>
									<HeaderTemplate>Demanded</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" ID="lblDEMANDED_LAST" runat="server" Text='<%#Eval("AMT_DEMANDED_LAST_YEAR") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="lblDemdTotal" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>

								<%--<asp:BoundField DataField="AMT_DEMANDED_LAST_YEAR" HeaderText="Dem" Visible="True"></asp:BoundField>--%>

								<%--<asp:BoundField DataField="AMT_ALLOCATED_LAST_YEAR" HeaderText="Alloc" Visible="True"></asp:BoundField>--%>
								<asp:TemplateField>
									<HeaderTemplate>Allocated</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" ID="lblAlloc_LAST" runat="server" Text='<%#Eval("AMT_ALLOCATED_LAST_YEAR") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="lblAlloc_LASTTotal" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Required</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" ID="lblALLOC" runat="server" Text='<%#Eval("CURRENT_REQ") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="lblReqTotal" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Justification</HeaderTemplate>

									<ItemTemplate>
										<asp:Label ID="lblJustWithToolTip" runat="server" Text='<%#Eval("JUSTIFICATION") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Detail">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtnEdtit" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732623_application_view_detail.png" runat="server"
											CommandName="addDes" ToolTip="Add Description" CommandArgument='<%#Eval("SER_NO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Edit">
									<ItemTemplate>
										<asp:ImageButton ID="ImgBtnEdtit1" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/assets/img/1477300690_icon-136-document-edit.png" runat="server"
											CommandName="edt" ToolTip="Edit" CommandArgument='<%#Eval("SNO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Delete">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtndel" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732554_trash.png" runat="server"
											CommandName="delete" ToolTip="Delete" CommandArgument='<%#Eval("SNO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<%-- <asp:TemplateField HeaderText="Is Final">
                                            <ItemTemplate>

                                                <asp:ImageButton ID="ImgBtnfinal"  Height="18px"  CssClass="vertical-align-mid" ImageUrl="~/Content/img/custom-reports.png" runat="server"
                                                    CommandName="Isfinal" ToolTip="Isfinal" CommandArgument='<%#Eval("SNO") %>' />

                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>--%>

								<%--    <asp:BoundField DataField="FY" HeaderText="FY" Visible="True" />--%>
								<%-- <asp:BoundField DataField="DTE_SYMBOL" HeaderText="DTE SYMBOL" Visible="True" />
                                        <asp:BoundField DataField="APPENDIX" HeaderText="APPENDIX" Visible="True" />
                                        <asp:BoundField DataField="CURRENCY" HeaderText="CURRENCY" Visible="True" />

                                        <asp:BoundField DataField="REQUIREMENT_TYPE" HeaderText="REQUIREMENT TYPE" Visible="True" />
                                        <asp:BoundField DataField="PURCHASE_TYPE" HeaderText="PURCHASE TYPE" Visible="True" />
                                        <asp:BoundField DataField="UTILIZATION_MODE" HeaderText="UTILIZATION MODE" Visible="True" />--%>
							</Columns>
							<EmptyDataTemplate>
								<p align="center"><strong>No Record Found</strong></p>
							</EmptyDataTemplate>

						</asp:GridView>
						<asp:GridView ID="GridRRC" DataKeyNames="FY,DTE_SYMBOL,APPENDIX,SER_NO,DESCRIPTION,PROJECT_ID,PDIB_STATUS,PDIB_MEETING_NO,PRIORITY,EQUIPMENT_CAT,WEAPON_SYS,AMT_DEMANDED_LAST_YEAR,AMT_ALLOCATED_LAST_YEAR,JUSTIFICATION,RRC_PO_NO,CURRENT_REQ,ESTIMATED_TO_BE_PAID,BAC_ALLOC_AMOUNT" OnRowDataBound="GridRRC_RowDataBound" ShowFooter="true" OnRowCommand="GridRRC_RowCommand" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDeleting="GridRRC_RowDeleting" OnRowCreated="GridRRC_RowCreated">
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
									<HeaderTemplate>RRC</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="lblDescWithToolTip" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>PO No</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="lblPOWithToolTip" runat="server" Text='<%#Eval("RRC_PO_NO") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Alloc Amount</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("PAID_TILL_NOW") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Exp Disb (CFY)</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("ESTIMATED_TO_BE_PAID") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Exp Disb (NFY)</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("CURRENT_REQ") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<%--  <asp:TemplateField>
                                    <HeaderTemplate>Demanded</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label CssClass="text-Align-span" ID="lblDEMANDED_LAST" runat="server" Text='<%#Eval("AMT_DEMANDED_LAST_YEAR") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label CssClass="text-Align-span" ID="lblDemdTotal" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Allocated</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label CssClass="text-Align-span" ID="lblAlloc_LAST" runat="server" Text='<%#Eval("AMT_ALLOCATED_LAST_YEAR") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label CssClass="text-Align-span" ID="lblAlloc_LASTTotal" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Required</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label CssClass="text-Align-span" ID="lblALLOC" runat="server" Text='<%#Eval("CURRENT_REQ") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label CssClass="text-Align-span" ID="lblReqTotal" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>--%>
								<asp:TemplateField>
									<HeaderTemplate>Justification</HeaderTemplate>

									<ItemTemplate>
										<asp:Label ID="lblJustWithToolTip" runat="server" Text='<%#Eval("JUSTIFICATION") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Detail">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtnEdtit" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732623_application_view_detail.png" runat="server"
											CommandName="addDes" ToolTip="Add Description" CommandArgument='<%#Eval("SER_NO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Edit">
									<ItemTemplate>
										<asp:ImageButton ID="ImgBtnEdtit1" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/assets/img/1477300690_icon-136-document-edit.png" runat="server"
											CommandName="edt" ToolTip="Edit" CommandArgument='<%#Eval("SNO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Delete">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtndel" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732554_trash.png" runat="server"
											CommandName="delete" ToolTip="Delete" CommandArgument='<%#Eval("SNO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
							</Columns>
							<EmptyDataTemplate>
								<p align="center"><strong>No Record Found</strong></p>
							</EmptyDataTemplate>

						</asp:GridView>
						<asp:GridView ID="GridViewCaryOver" RowStyle-Wrap="false" ShowFooter="true" DataKeyNames="FY,DTE_SYMBOL,APPENDIX,SER_NO,DESCRIPTION,PROJECT_ID,PDIB_STATUS,PDIB_MEETING_NO,PRIORITY,EQUIPMENT_CAT,WEAPON_SYS,AMT_DEMANDED_LAST_YEAR,AMT_ALLOCATED_LAST_YEAR,JUSTIFICATION,CURRENT_REQ,ESTIMATED_TO_BE_PAID,BAC_NO,PAID_TILL_NOW" OnRowCommand="GridViewCaryOver_RowCommand" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDeleting="GridViewCaryOver_RowDeleting" OnRowDataBound="GridViewCaryOver_RowDataBound">
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


								<%-- <asp:BoundField DataField="SNO" HeaderText="Sr No" Visible="True">
                                             
                                            </asp:BoundField>--%>


								<asp:TemplateField>
									<HeaderTemplate>Contract No</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="lblDescWithToolTip" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0;">
											<asp:Label Text="Total" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>


								<asp:TemplateField>
									<HeaderTemplate>Val Of Contract</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" ID="lblEqpmt_Cat" runat="server" Text='<%#Eval("CONTRACT_VALUE") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="CONTRACT_VALUE" Text="Total" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>

								<%-- <asp:BoundField DataField="EQUIPMENT_CAT_DECODE" HeaderText="Eqpmt Cat" Visible="True"></asp:BoundField>
								--%>



								<%--     <asp:BoundField DataField="AMT_ALLOC_LAST_TO_LAST" HeaderText="Alloc" Visible="True"></asp:BoundField>--%>
								<asp:TemplateField>
									<HeaderTemplate>Paid Till LFY</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("PAID_TILL_LFY") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="PAID_TILL_LFY" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Total Paid During CFY</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("PAID_TILL_NOW") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="PAID_TILL_NOW" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Exp Disb(CFY)</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("ESTIMATED_TO_BE_PAID") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="ESTIMATED_TO_BE_PAID" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>

								<%--<asp:BoundField DataField="AMT_DEMANDED_LAST_YEAR" HeaderText="Dem" Visible="True"></asp:BoundField>--%>

								<%--<asp:BoundField DataField="AMT_ALLOCATED_LAST_YEAR" HeaderText="Alloc" Visible="True"></asp:BoundField>--%>

								<asp:TemplateField>
									<HeaderTemplate>Exp Disb (NFY)</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("CURRENT_REQ") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="CURRENT_REQ" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Detail">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtnEdtit" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732623_application_view_detail.png" runat="server"
											CommandName="addDes" ToolTip="View Description" CommandArgument='<%#Eval("SER_NO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Edit">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtnEdit" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/assets/img/1477300690_icon-136-document-edit.png" runat="server"
											CommandName="edt" ToolTip="Edit" CommandArgument='<%#Eval("SNO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Delete">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtndel1" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732554_trash.png" runat="server"
											CommandName="delete" ToolTip="Delete" CommandArgument='<%#Eval("SNO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
							</Columns>
							<EmptyDataTemplate>
								<p align="center"><strong>No Record Found</strong></p>
							</EmptyDataTemplate>

						</asp:GridView>
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


								<%-- <asp:BoundField DataField="SNO" HeaderText="Sr No" Visible="True">
                                             
                                            </asp:BoundField>--%>


								<asp:TemplateField>
									<HeaderTemplate>BAC No</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="lblDescWithToolTip" runat="server" Text='<%#Eval("BAC_NO") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0;">
											<asp:Label Text="Total" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
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
									<HeaderTemplate>Exp Contract Val</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" ID="lblEqpmt_Cat" runat="server" Text='<%#Eval("BAC_ALLOC_AMOUNT") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="BAC_ALLOC_AMOUNT" Text="Total" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>

								<%-- <asp:BoundField DataField="EQUIPMENT_CAT_DECODE" HeaderText="Eqpmt Cat" Visible="True"></asp:BoundField>
								--%>



								<%--     <asp:BoundField DataField="AMT_ALLOC_LAST_TO_LAST" HeaderText="Alloc" Visible="True"></asp:BoundField>--%>
								<asp:TemplateField>
									<HeaderTemplate>Exp Disb (CFY)</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("ESTIMATED_TO_BE_PAID") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="ESTIMATED_TO_BE_PAID_BAC" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Exp Disb (NFY)</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("CURRENT_REQ") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label CssClass="text-Align-span" ID="CURRENT_REQ_BAC" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>

								<%--<asp:BoundField DataField="AMT_DEMANDED_LAST_YEAR" HeaderText="Dem" Visible="True"></asp:BoundField>--%>

								<%--<asp:BoundField DataField="AMT_ALLOCATED_LAST_YEAR" HeaderText="Alloc" Visible="True"></asp:BoundField>--%>
								<%-- <asp:TemplateField>
                                    <HeaderTemplate>Paid Till Now</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("PAID_TILL_NOW") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Req</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("CURRENT_REQ") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>--%>
								<asp:TemplateField HeaderText="Detail">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtnEdtit" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732623_application_view_detail.png" runat="server"
											CommandName="addDes" ToolTip="View Description" CommandArgument='<%#Eval("SER_NO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Edit">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtnEdit" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/assets/img/1477300690_icon-136-document-edit.png" runat="server"
											CommandName="edt" ToolTip="Edit" CommandArgument='<%#Eval("SNO") %>' />

									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Delete">
									<ItemTemplate>

										<asp:ImageButton ID="ImgBtndel1" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732554_trash.png" runat="server"
											CommandName="delete" ToolTip="Delete" CommandArgument='<%#Eval("SNO") %>' />

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
								<%--    <div class="col-lg-4 col-md-4">
                                    <div>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Depot No</asp:Label>
                                    </div>
                                    <div>
                                        <asp:DropDownList CssClass="form-control" ID="DepotNoddl" DataValueField="DEPOT" DataTextField="DEPOT" runat="server" OnDataBound="DepotNoddl_DataBound" OnSelectedIndexChanged="DepotNoddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    </div>
                                </div>--%>
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
										<asp:TextBox Width="100%" ID="Nomenclature" CssClass="Upper-case" placeholder="Nomenclature" AutoComplete="Off" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator24" ControlToValidate="Nomenclature" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Nomenclature Missing"></asp:RequiredFieldValidator>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Button runat="server" ID="SearchPartNo" OnClick="SearchPartNo_Click" Style="margin-top: 15px;" Text="Search" CssClass="btn btn-sm btn-primary" />
									</div>
								</div>

							</div>
							<div class="col-lg-12 buttom-margin" style="padding-left: 0px; padding-right: 0px">
								<div class="col-lg-4 col-md-4">
									<div>
										<asp:TextBox Visible="false" ID="BACAllocAmtHidn" runat="server"></asp:TextBox>
										<asp:TextBox Visible="false" ID="BACPArtAmtHidn" runat="server"></asp:TextBox>
										<asp:TextBox Visible="false" ID="SrNohidden" runat="server"></asp:TextBox>
										<asp:TextBox Visible="false" ID="SrNoSunHiden" runat="server"></asp:TextBox>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Part No</asp:Label>
									</div>
									<div>
										<asp:DropDownList CssClass="form-control" Enabled="false" ID="PartNoDdl" DataValueField="PARTS_NO_NSN" DataTextField="PARTS_NO_NSN" runat="server" OnDataBound="PartNoDdl_DataBound" OnSelectedIndexChanged="PartNoDdl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator23" ControlToValidate="PartNoDdl" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Part NO Missing"></asp:RequiredFieldValidator>
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
										<asp:TextBox Width="100%" ID="Type1" placeholder="Type" Enabled="false" AutoComplete="Off" runat="server"></asp:TextBox>
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
										<asp:TextBox Width="100%" ID="ReqQuantity" OnTextChanged="ReqQuantity_TextChanged" onkeypress="return onlyNumbers();" AutoComplete="Off" AutoPostBack="true" placeholder="Req Quantity" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator29" ControlToValidate="ReqQuantity" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Req Quantity Missing"></asp:RequiredFieldValidator>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Unit Cost (Not in Million)</asp:Label>
									</div>
									<div>
										<asp:TextBox Width="100%" ID="UnitCost" OnTextChanged="UnitCost_TextChanged" onkeypress="return onlyNumbers();" AutoComplete="Off" placeholder="UnitCost" AutoPostBack="true" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator30" ControlToValidate="UnitCost" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Unit Cost Missing"></asp:RequiredFieldValidator>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div>
										<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Net Demanded</asp:Label>
									</div>

									<div>
										<asp:TextBox ID="NetDemandedValue" placeholder="Net Demanded Value" AutoComplete="Off" Enabled="false" runat="server"></asp:TextBox>
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
									<asp:TextBox Width="100px" ID="AuthAsset" placeholder="Auth Asset" onkeypress="return onlyNumbers();" AutoComplete="Off" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator256" ControlToValidate="AuthAsset" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Auth Asset Missing"></asp:RequiredFieldValidator>
								</div>

								<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Holding&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
									<asp:TextBox Width="100px" ID="Holding" placeholder="Holding" onkeypress="return onlyNumbers();" AutoComplete="Off" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator27" ControlToValidate="Holding" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Holding Missing"></asp:RequiredFieldValidator>

								</div>
							</fieldset>
						</div>

					</div>
					<asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" ValidationGroup="DetailAddEst" runat="server" />
					<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="DetailAddEst" Style="float: right; margin-top: 5px" Text="Save Item/Part No" ID="BtnSubSave" OnClick="BtnSubSave_Click" />
					<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="DetailAddEst" Style="float: right; margin-top: 5px" Text="Update Item/Part No" ID="BtnUpdate1" OnClick="BtnUpdate1_Click" />
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
					<asp:GridView ID="GridRRC_detail" DataKeyNames="" OnRowCommand="GridRRC_detail_RowCommand" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDeleting="GridRRC_detail_RowDeleting" OnRowDataBound="GridRRC_detail_RowDataBound">
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
									<asp:Label runat="server" Text='<%#Eval("PART_NO_NSN") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0;">
										<asp:Label Text="Total" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>


							<asp:TemplateField>
								<HeaderTemplate>Nom</HeaderTemplate>
								<ItemTemplate>
									<asp:Label ID="lbl_NOMENCLATURE" runat="server" Text='<%#Eval("NOUN") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>

							<asp:TemplateField>
								<HeaderTemplate>PO NO</HeaderTemplate>
								<ItemTemplate>
									<asp:Label ID="lbl_PO_NO" runat="server" Text='<%#Eval("PO_NO") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>


							<asp:TemplateField>
								<HeaderTemplate>Order Qty</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("ORDER_QTY") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>RXD Qty</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("RXD_Qty") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
										<asp:Label CssClass="text-Align-span" ID="PRICE_PER_UNIT" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Out Std Qty</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("OUT_STD_QTY") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
										<asp:Label CssClass="text-Align-span" ID="TOTAL_REQ" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>

							<asp:TemplateField>
								<HeaderTemplate>Net Unit Cost</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("NET_UNIT_COST") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Bal Amt</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("BALANCE_AMT") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>


						</Columns>


					</asp:GridView>
					<asp:GridView ID="GridViewEstDetail" DataKeyNames="SER_NO,PARTS_NO_NSN,NOMENCLATURE,ERRC_CODE,DTE_SYMBOL,AMOUNT_REC_BGT,FY,HOLD_QTY,PRICE_PER_UNIT,QTY_AUTH,QTY,TOTAL_REQ,UNIT_OF_ISSUE" OnRowCommand="GridViewEstDetail_RowCommand" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDeleting="GridViewEstDetail_RowDeleting" OnRowDataBound="GridViewEstDetail_RowDataBound">
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
										<asp:Label Text="Total" runat="server" />
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
								<HeaderTemplate>ERRC</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("ERRC_CODE") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>


							<asp:TemplateField>
								<HeaderTemplate>Req Quantity</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("QTY") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Unit Cost</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
										<asp:Label CssClass="text-Align-span" ID="PRICE_PER_UNIT" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Net Demanded</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("TOTAL_REQ") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
										<asp:Label CssClass="text-Align-span" ID="TOTAL_REQ" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>

							<asp:TemplateField>
								<HeaderTemplate>Auth Asset</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("QTY_AUTH") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Holding</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("HOLD_QTY") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Edit">
								<ItemTemplate>

									<asp:ImageButton ID="ImgBtnEdit1" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/assets/img/1477300690_icon-136-document-edit.png" runat="server"
										CommandName="edt" ToolTip="Edit" CommandArgument='<%#Eval("SNO") %>' />

								</ItemTemplate>
								<ItemStyle HorizontalAlign="Center" />
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Delete">
								<ItemTemplate>

									<asp:ImageButton ID="ImgBtndel2" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732554_trash.png" runat="server"
										CommandName="delete" ToolTip="Delete" CommandArgument='<%#Eval("SNO") %>' />

								</ItemTemplate>
								<ItemStyle HorizontalAlign="Center" />
							</asp:TemplateField>
						</Columns>


					</asp:GridView>
					<asp:GridView ID="GridViewContrct" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDataBound="GridViewContrct_RowDataBound">
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
								<HeaderTemplate>Contract No</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("CONTRACT_NO") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0;">
										<asp:Label Text="Total" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>


							<asp:TemplateField>
								<HeaderTemplate>Parts No</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>

							<asp:TemplateField>
								<HeaderTemplate>Nom</HeaderTemplate>
								<ItemTemplate>
									<asp:Label ID="lblJustWithToolTip" runat="server" Text='<%#Eval("NOUN") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>QTY</HeaderTemplate>
								<ItemTemplate>
									<asp:Label runat="server" Text='<%#Eval("QTY") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
									</div>
								</FooterTemplate>
							</asp:TemplateField>
							<asp:TemplateField>
								<HeaderTemplate>Total Cost</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("UNIT_PRICE") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
										<asp:Label visble="false" CssClass="text-Align-span" ID="UNIT_PRICE" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>

							<asp:TemplateField>
								<HeaderTemplate>GST %</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("GST") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
								</FooterTemplate>
							</asp:TemplateField>


						</Columns>


					</asp:GridView>
				</div>
			</div>

		</div>
	</div>
	<asp:Button runat="server" ID="Est_Detail_Misc" OnClick="Est_Detail_Misc_Click" Style="display: none" />
	<asp:Button runat="server" ID="Est_Detail_Part" OnClick="Est_Detail_Part_Click" Style="display: none" />
</asp:Content>

