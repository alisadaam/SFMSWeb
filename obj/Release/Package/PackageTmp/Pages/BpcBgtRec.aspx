<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BpcBgtRec.aspx.cs" Inherits="BMSWeb.Pages.BpcBgtRec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">

	<style>
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
		.sweet-alert h2 {
			color: #1D74D6;
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
    width: 951px;
    padding: 17px;
    border-radius: 5px;
    text-align: center;
    position: fixed;
    left: 38%;
    top: 50%;
    margin-left: -256px;
    margin-top: -200px;
    overflow: hidden;
    display: none;
    z-index: 99999;
}
		/*.sweet-alert {
			background-color: white;
			font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
			width: 870px;
			padding: 17px;
			border-radius: 5px;
			text-align: center;
			position: fixed;
			left: 43%;
			top: 50%;
			margin-left: -256px;
			margin-top: -200px;
			overflow: hidden;
			display: none;
			z-index: 99999;
		}*/
		/*.sweet-alert {
			
			min-width: 768px;
		}*/
		.form-control {
			height: 30px !important;
			font-size: 13px !important;
			font-weight: 700;
			/*color: black;*/
		}

		body {
			font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
			font-size: 13px;
			line-height: 1.42857143;
			color: black;
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
		}

		th {
			text-align: center !important;
		}

		.float-Right {
			float: right;
			font-size: 15px !important;
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
	</style>
	<script type="text/javascript" lang="javascript">
		function ShowInfo1(a, b, c) {
			//$("#desc").html(a);
			//$("#just").html(b);

			swal({
				title: "Details",

				text: "<h4 style='color:black'>Description</h4><br /><p style='color:black'>" + a + "</p>" + "<br /><h4 style='color:black'>Justification</h4><br /><p style='color:black'>" + b + "</p>" + "<br /><h4 style='color:black'>Required Amount (Amount in Million)</h4><br /><p style='color:black'>" + c + "</p>",
				html: true,
				showCancelButton: false,
				confirmButtonColor: "#DD6B55",

				closeOnConfirm: true,
				customClass: "swal-wide",

			});


		}
	</script>
	<script type="text/javascript" lang="javascript">
		//function ShowInfo1(a, b, c) {
		//	//$("#desc").html(a);
		//	//$("#just").html(b);

		//	swal({
		//		title: "Details",
		//		text: "<pre><span style='color: #1D74D6'>DESCRIPTION</span>     : " + a + "" + "<br /><br /><span style='color: #1D74D6'>JUSTIFICATION</span>   : " + b + "" + "<br /><br /><span style='color: #1D74D6'>REQUIRED AMOUNT</span> : " + c + "     Million <br /><br /> </pre>" + $("#DivDetails").html(),
		//		//text: "<h4 style='color:black'>Description</h4><br /><p style='color:black'>" + a + "</p>" + "<br /><h4 style='color:black'>Justification</h4><br /><p style='color:black'>" + b + "</p>" + "<br /><h4 style='color:black'>Required Amount (Amount in Million)</h4><br /><p style='color:black'>" + c + "</p>" + $("#DivDetails").html(),
		//		html: true,
		//		showCancelButton: false,
		//		confirmButtonColor: "#DD6B55",

		//		closeOnConfirm: true,
		//		customClass: "swal-wide",

		//	});


		//}
	</script>
	<script type="text/javascript">
		$(document).ready(function () {
			$(".sidebar-toggle").click();
			$('[data-toggle="popover"]').popover();

		});
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
		function PartsNoDetails() {
			swal({
				title: "<h4 style='color:black'>Details Against Part No</h4>",
				type: "warning",
				text: $("#gridContainerDetail").html(),
				html: true,
				//showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "OK!",
				//cancelButtonText: "No, cancel plz!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false
			});
		}
		function LPRDetails() {
			swal({
				title: "<h4 style='color:black'>LPR Detail</h4>",
				type: "warning",
				text: $("#gridContainerDetailLPR").html(),
				html: true,
				//showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "OK!",
				//cancelButtonText: "No, cancel plz!",
				closeOnConfirm: false,
				customClass: "swal-wide",
				closeOnCancel: false
			})
		}
		
		function AddLPAmt(a,b,c) {
			var q = $("#MainContent_IndexRow").val();
			
			var amt = "MainContent_GridViewEstDetail_txtLPRBGT_" + q;
			var date = "MainContent_GridViewEstDetail_txtLPRYear_" + q;
			var mode = "MainContent_GridViewEstDetail_txtLPRMode_" + q;
			//alert(dd);
			document.getElementById(date).value = a;
			document.getElementById(mode).value = b;
			document.getElementById(amt).value = c;
			//}
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

	<div class="row" id="main_form" runat="server" style="font-size: 13px">
		<div class="form-group" style="width: 1024px; margin-left: 17px; margin-top: 17px;">
			<section id="secMessage" runat="server"></section>
		</div>
		<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">
			<div id="gridContainerDetail" hidden style="overflow: auto; height: 479px;">
						<input hidden runat="server" id="IndexRow"  />
						<asp:GridView ID="GridPartsDetail" RowStyle-Wrap="false" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True">
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
									<HeaderTemplate>Part No</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="PARTS_NO_NSN" runat="server" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>
									</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>

								<asp:TemplateField>
									<HeaderTemplate>LPR</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="LPR" runat="server" Text='<%#Eval("LPR") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Right" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Mode</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("UT_MODE") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>DOP
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("DateOfPurchase") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
									<asp:TemplateField>
									<HeaderTemplate>Currency
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("CS") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>GST
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("GST") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
									<asp:TemplateField HeaderText="Detail">
									<ItemTemplate>
										<asp:Label CssClass="btn btn-primary"  onclick='<%# string.Format("AddLPAmt(\"{0}\",\"{1}\",\"{2}\")",Eval("DateYear"),Eval("UT_MODE"),Eval("LPR")) %>' runat="server" Text='Add'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								
							</Columns>
							<EmptyDataTemplate>
								<p align="center"><strong>No Record Found</strong></p>
							</EmptyDataTemplate>

						</asp:GridView>

					</div>
			<div id="gridContainerDetailLPR" hidden style="overflow: auto; height: 479px;">
			<asp:GridView ID="GridViewLPRDetail" RowStyle-Wrap="false" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True">
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
									<HeaderTemplate>Part No</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="PARTS_NO_NSN" runat="server" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>

								<asp:TemplateField>
									<HeaderTemplate>Nomenclature</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" ID="LPR" runat="server" Text='<%#Eval("NOMENCLATURE") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>SA</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("SA") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>US
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("US") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Asst Hold
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("ASSTT_HOLD") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Asst Auth
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("ASSTT_AUTH") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
									<asp:TemplateField>
									<HeaderTemplate>Currency
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("CS") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Price
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("PRICE") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Right" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Dues In
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("DUES_IN") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Curr Year Cons
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("CURR_YR_CONS") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								
								<asp:TemplateField>
									<HeaderTemplate>1st Year
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("yr1") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>2nd Year
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("yr2") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>3rd Year
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("yr3") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>4th Year
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("yr4") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>5th Year
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("yr5") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Trends
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("Trend") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>
									
								
							</Columns>
							<EmptyDataTemplate>
								<p align="center"><strong>No Record Found</strong></p>
							</EmptyDataTemplate>

						</asp:GridView>

				</div>
			<div class="col-lg-8 col-md-6">
				<h3 runat="server" style="color: #1D74D6; margin: 0px">BGT Recommendations- <span runat="server" id="yearlabel"></span></h3>
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
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px" style="display: none;">

								<asp:DropDownList CssClass="form-control" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

							</div>

							 <div class="col-lg-4 col-md-4 buttom-margin padingRight1px ">
                             <asp:Label  Style="color: #00369E; font-weight: 700;" runat="server">Currency</asp:Label>
                                <asp:RadioButtonList ID="rbListCurr" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbListCurr_SelectedIndexChanged"  Style="width: 99%" >
									<asp:ListItem Value="P" Selected="True">&nbsp;Local</asp:ListItem>
									<asp:ListItem Value="F">&nbsp;Foreign</asp:ListItem>
                                </asp:RadioButtonList>

                               <%-- <asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="currancy" runat="server" OnSelectedIndexChanged="currancy_SelectedIndexChanged">
                                    <asp:ListItem Value="F"> FE</asp:ListItem>
                                    <asp:ListItem Value="P"> Rs</asp:ListItem>
                                </asp:DropDownList>--%>
                            </div>

                            <div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
                                  <asp:Label  Style="color: #00369E; font-weight: 700;" runat="server">Requirement Type</asp:Label>
                                <asp:RadioButtonList ID="rbListReqType" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbListReqType_SelectedIndexChanged">
                                    <asp:ListItem Value="" Selected="True"> &nbsp;&nbsp;ALL&nbsp;&nbsp;</asp:ListItem>
                                    <asp:ListItem Value="N"> &nbsp;&nbsp;NM&nbsp;&nbsp;</asp:ListItem>
                                    <asp:ListItem Value="M"> &nbsp;&nbsp;O & M</asp:ListItem>
                                </asp:RadioButtonList>
                                <%--<asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="REQUIREMENT_TYPE" DataValueField="REQUIREMENT_CODE" DataTextField="REQUIREMENT_DECODE" runat="server" OnSelectedIndexChanged="REQUIREMENT_TYPE_SelectedIndexChanged"></asp:DropDownList>--%>

                            </div>

                            <div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
                                  <asp:Label  Style="color: #00369E; font-weight: 700;"  runat="server">Purchase Type</asp:Label>
                                 <asp:RadioButtonList ID="rbListPurType" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbListPurType_SelectedIndexChanged">
                                    <asp:ListItem Value="" Selected="True"> &nbsp;&nbsp;ALL&nbsp;&nbsp;</asp:ListItem>
                                    <asp:ListItem Value="C"> &nbsp;&nbsp;CP&nbsp;&nbsp;</asp:ListItem>
                                    <asp:ListItem  Enabled="false" Value="L"> &nbsp;&nbsp;LP</asp:ListItem>
                                </asp:RadioButtonList>
                                <%--<asp:DropDownList CssClass="form-control" ID="PURCHASE_TYPE" DataValueField="PURCHASE_CODE" DataTextField="PURCHASE_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="PURCHASE_TYPE_SelectedIndexChanged"></asp:DropDownList>--%>
                            </div>
                            <div class="col-lg-4 col-md-4 buttom-margin padingRight1px " style="height:64px">
                                  <asp:Label  Style="color: #00369E; font-weight: 700;"  runat="server">Utilization Mode</asp:Label>
                                 <asp:RadioButtonList ID="rbListUtiMode" AutoPostBack="true"     runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbListUtiMode_SelectedIndexChanged">
                                    <asp:ListItem Value="" Selected="True">ALL&nbsp;</asp:ListItem>
                                    <asp:ListItem Value="C">OTC&nbsp;</asp:ListItem>
                                    <asp:ListItem Value="T">TOF&nbsp;</asp:ListItem>
                                     <asp:ListItem Value="R">RRC&nbsp;</asp:ListItem>
                                    <%-- <asp:ListItem Value="L"> LP</asp:ListItem>--%>
                                </asp:RadioButtonList>
                                <%--<asp:DropDownList CssClass="form-control" ID="UTILIZATION_MODE" DataValueField="UTILIZATION_CODE" DataTextField="UTILIZATION_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="UTILIZATION_MODE_SelectedIndexChanged"></asp:DropDownList>--%>
                            </div>
                             <div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px" style="height:64px">
                                  <asp:Label  Style="color: #00369E; font-weight: 700;"  runat="server">Priority </asp:Label>
                                 <asp:RadioButtonList ID="rbListPeriorty" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbListPeriorty_SelectedIndexChanged">
                                    <asp:ListItem Value="" Selected="True">  &nbsp;ALL &nbsp;</asp:ListItem>
                                    <asp:ListItem Value="1"> &nbsp; I &nbsp;</asp:ListItem>
                                    <asp:ListItem Value="2">  &nbsp;II&nbsp;</asp:ListItem>
                                     <asp:ListItem Value="3">  &nbsp;III</asp:ListItem>
                                    <%-- <asp:ListItem Value="L"> LP</asp:ListItem>--%>
                                </asp:RadioButtonList>
                                <%--<asp:DropDownList CssClass="form-control" ID="UTILIZATION_MODE" DataValueField="UTILIZATION_CODE" DataTextField="UTILIZATION_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="UTILIZATION_MODE_SelectedIndexChanged"></asp:DropDownList>--%>
                            </div>
                              <div id="RRCNoddl" visible="false" runat="server" class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px" style="height:64px">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">RRC</asp:Label>
										<asp:DropDownList CssClass="form-control" ID="RRC_NoDDL" DataValueField="RRC_NO" DataextField="RRC_NO" AutoPostBack="true" runat="server" OnSelectedIndexChanged="RRC_NoDDL_SelectedIndexChanged" OnDataBound="RRC_NoDDL_DataBound" ></asp:DropDownList>
									
									</div>
                             <div id="TofAgnDiv" runat="server" class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px" style="height:64px">
                                  <asp:Label  Style="color: #00369E; font-weight: 700;"  runat="server">Agency</asp:Label>
                                <asp:DropDownList CssClass="form-control" ID="Tof_agencies" DataValueField="AGENCY_CODE" DataTextField="AGENCY_DECODE" runat="server" OnSelectedIndexChanged="Tof_agencies_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                            </div>

                            <div id="TofDiv" runat="server" class="col-lg-4 col-md-4 buttom-margin padingRight1px">
                                 <asp:Label  Style="color: #00369E; font-weight: 700;"  runat="server">TOF Head</asp:Label>
                                <asp:DropDownList CssClass="form-control" ID="TOF_Headsddl" DataValueField="HEAD_CODE" DataTextField="HEAD_DESC_LONG" runat="server" OnSelectedIndexChanged="TOF_Headsddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                            </div>

                           
                            <div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
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
								<asp:Button runat="server" CssClass="btn btn-primary btn-sm img-responsive" ValidationGroup="grp_est" Style="float: right; margin-top: 5px" Text="View All" ID="ViewAll" OnClick="ViewAll_Click" />
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
					<h3 id="H4" runat="server" style="color: #1D74D6; margin: 0px">Summary</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H5" runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
				</div>

				<div runat="server" id="Div4" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px; top: 0px; left: 0px;">

					<div class="box-body" style="padding-top: 2px">
						<div id="DivSumery1" runat="server" visible="false" style="padding-left: 5px; padding-right: 5px">
                            <asp:GridView ID="gvSummaryInfo" Font-Size="15px" Width="100%" ShowFooter="true" CssClass="Grid table-hover border-color" OnRowCreated="gvSummaryInfo_RowCreated" AllowPaging="false" runat="server" OnRowDataBound="gvSummaryInfo_RowDataBound" AutoGenerateColumns="false" CellPadding="4">
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
						<asp:GridView ID="GridViewMainSummery" Width="100%" ShowFooter="true" CssClass="Grid table-hover border-color" AllowPaging="false" runat="server" OnRowDataBound="GridViewMainSummery_RowDataBound" AutoGenerateColumns="false" CellPadding="4">
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
										<asp:Label runat="server" ID="col1" Font-Bold="true" Text='<%#Eval("REQ_AMT") %>' ForeColor="Red" CssClass="text-Align-span"></asp:Label>
									</ItemTemplate>

								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>PSO Amt</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" ID="col2" Font-Bold="true" Text='<%#Eval("PSO_AMT") %>' ForeColor="Green" CssClass="text-Align-span"></asp:Label>
									</ItemTemplate>

								</asp:TemplateField>

								<asp:TemplateField>
									<HeaderTemplate>Plans Amt</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" ID="col3" Font-Bold="true" Text='<%#Eval("PLANS_AMT") %>' ForeColor="OrangeRed" CssClass="text-Align-span"></asp:Label>
									</ItemTemplate>

								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Supp Amt</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" ID="col4" Font-Bold="true" Text='<%#Eval("SUPP_AMT") %>' ForeColor="#FF00D2" CssClass="text-Align-span"></asp:Label>
									</ItemTemplate>

								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>BGT Rec Amt</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" ID="col5" Font-Bold="true" Text='<%#Eval("BGT_REC_AMT") %>' ForeColor="BlueViolet" CssClass="text-Align-span"></asp:Label>
									</ItemTemplate>

								</asp:TemplateField>

							</Columns>
							<EmptyDataTemplate>
								<p align="center"><strong>No Record Found</strong></p>
							</EmptyDataTemplate>

						</asp:GridView>
						</div>
						<%--<asp:Button  runat="server" ID="PrintSummary" OnClick="PrintSummary_Click" CssClass="btn btn-primary"/>--%>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">






			<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">
				<div id="GridDiv" visible="false" runat="server" class="col-md-12 col-lg-12 padingLeft5px">
					<div class="col-lg-8 col-md-6">
						<h3 id="TReq" runat="server" style="color: #1D74D6; margin: 0px">Total Requirements</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h4 id="H1" runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
					</div>

					<div runat="server" id="MainDetails" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px">

						<div class="box-body">

							<div id="gridContainer" style="font-family: Arial">

								<asp:GridView ID="GridEstimates" AllowPaging="true" DataKeyNames="FY,DTE_SYMBOL1,SER_NO" OnRowDataBound="GridEstimates_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridEstimates_RowCreated" OnRowCommand="GridEstimates_RowCommand" OnPageIndexChanging="GridEstimates_PageIndexChanging">
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

										<%--<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>--%>
										<asp:TemplateField>
											<HeaderTemplate>SNO</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" ID="srno" Text='<%#GetSerail((Container.DataItemIndex+1)+"<br>",Eval("UTILIZATION_MODE1"))%>' />
											</ItemTemplate>
											<ItemStyle Width="40px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Description</HeaderTemplate>
												<ItemTemplate>
                                                <asp:Label ID="lblDescWithToolTip" runat="server" Text='<%#Eval("DESCRIPTION") %>' Visible="false"></asp:Label>
                                                <p style="padding-top: 0px; white-space: nowrap; text-overflow: ellipsis;  overflow: hidden;">
                                                    <code style="color: purple; font-size: 18px"><%#Eval("DTE_SYMBOL1")%></code>
                                                    <code style="color: blue; font-size: 18px"><%#Eval("TOF_AGENCY")%></code>
                                                    <asp:LinkButton ID="btnDes" ForeColor="Black"  display="initial" CssClass="vertical-align-mid" Text='<%#Eval("DESCRIPTION") %>' runat="server"
                                                        data-toggle="popover" data-trigger="hover" />
                                                </p>
                                                <p style="padding-top: 0px; white-space: nowrap; text-overflow: ellipsis;  overflow: hidden;">
                                                  
                                                    <asp:LinkButton ID="SupplierRRC" ForeColor="Black" display="initial" CssClass="vertical-align-mid" Text='<%#Eval("RRC_SUPPLIER") %>' runat="server"
                                                        data-toggle="popover" data-trigger="hover" />
                                                </p>
                                            </ItemTemplate>
											<ItemStyle Width="170px" />
										</asp:TemplateField>
									
									<asp:TemplateField Visible="false">
											<HeaderTemplate>Justification</HeaderTemplate>

											<ItemTemplate>
												<p style="padding-top: 9px; white-space: nowrap; width: 170px; text-overflow: ellipsis; overflow: hidden;">
													<asp:Label ID="lblJustWithToolTip" white-space="nowrap" Font-Bold="true" runat="server" Text='<%#Eval("JUSTIFICATION") %>'></asp:Label>
												</p>
											</ItemTemplate>
											<ItemStyle Width="170px" />
										</asp:TemplateField>
										<%--<asp:BoundField DataField="DTE_SYMBOL2" HeaderText="Dte" ItemStyle-BackColor="#EFEFEF">
											<ItemStyle BackColor="#EFEFEF"></ItemStyle>
										</asp:BoundField>--%>

										<asp:TemplateField>
											<HeaderTemplate>WPN SYS</HeaderTemplate>
											<ItemTemplate>
												<asp:Label ID="lblWpnSys" Font-Bold="true" runat="server" Text='<%#Eval("WEAPON_SYS") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="70" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>PDIB Status</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PDIB_STATUS_DECODE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="50" />
										</asp:TemplateField>
										<asp:TemplateField HeaderText="PDIB Remarks" Visible="false">
											<ItemTemplate>
												<asp:TextBox ID="txtPDIBRemarks" AutoCompleteType="None" CssClass="form-control" TextMode="MultiLine" AutoPostBack="true" runat="server" Width="100%" Height="18px" Text='<%# DataBinder.Eval(Container.DataItem, "PDIB_REMARKS") %>'></asp:TextBox>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="150" />
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
												<asp:Label CssClass="text-Align-span float-Right" ID="lblAlloc_LAST" Font-Bold="true" runat="server" Text='<%#Eval("AMOUNT_ALLOCATED_LAST_YEAR_MIL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lblAlloc_LASTTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Current Req</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="lblALLOC" runat="server" Text='<%# Eval("AMOUNT_DEMANDED_MIL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Rec PSO</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="RecPSO" runat="server" Text='<%# Eval("AMOUNT_REC_PSO") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lqblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<%--8--%>
										<asp:TemplateField>
											<HeaderTemplate>Rec Plan</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="RecPlan" runat="server" Text='<%# Eval("AMOUNT_REC_PLANS") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lqblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<%--9--%>
										<asp:TemplateField>
											<HeaderTemplate>Rec DCAS(S)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="RecDCAS" runat="server" Text='<%# Eval("AMOUNT_REC_DCAS_EL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lqblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Rec By BGT</HeaderTemplate>
											<ItemTemplate>
												<%--<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="RecBgt" runat="server" Text='<%# Eval("AMOUNT_REC_BGT") %>'></asp:Label>--%>
												<asp:TextBox ID="RecBgt" runat="server"  Text='<%# Eval("AMOUNT_REC_BGT") %>' Width="70"  CssClass="text-Align-span float-Right" Font-Bold="true" style="text-align: right;" ></asp:TextBox>
											</ItemTemplate>

											<ItemStyle Width="45px" />
										</asp:TemplateField>

										<%--<asp:CheckBoxField DataField="IS_FINALIZED" SortExpression="IS_FINALIZED" />--%>
										<%--<asp:TemplateField HeaderText="Rec By BGT">
											<ItemTemplate>
												<asp:TextBox ID="txtNewAMt" AutoCompleteType="None" Font-Bold="true" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" AutoPostBack="true" runat="server" Width="60px" Height="25px" Text='<%# DataBinder.Eval(Container.DataItem, "AMOUNT_REC_BGT") %>' OnTextChanged="txtNewAMt_TextChanged"></asp:TextBox>
											</ItemTemplate>
											<ItemStyle Width="45px"  />
										</asp:TemplateField>--%>
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



										<asp:TemplateField HeaderText="Remarks By BGT">
											<ItemTemplate>
												<asp:TextBox ID="txtDecision" data-placement="left"   data-toggle="popover" data-trigger="hover" AutoCompleteType="None"  ToolTip='<%#Eval("REMARKS_BY_BGT")%>'  CssClass="form-control" TextMode="MultiLine" AutoPostBack="true" runat="server" Width="100%" Height="18px" Text='<%# DataBinder.Eval(Container.DataItem, "REMARKS_BY_BGT") %>'></asp:TextBox>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>View Detail</HeaderTemplate>
											<ItemTemplate>
												<asp:ImageButton ID="ImgBtndetail" CssClass="vertical-align-mid" ImageUrl="../Content/img/1479732623_application_view_detail.png" Height="20" runat="server"
													CommandName="ViewDetail1" ToolTip="View Detail" CommandArgument='<%#GetCommandArgument(Eval("SER_NO"),Eval("DESCRIPTION"),Eval("JUSTIFICATION"),Eval("AMOUNT_DEMANDED_MIL"),Eval("DTE_SYMBOL2")) %>' />
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="50px" />
										</asp:TemplateField>

									</Columns>

								<%--	<EmptyDataTemplate>
										<p align="center"><strong>No Record Found</strong></p>
									</EmptyDataTemplate>--%>

								</asp:GridView>

								<asp:GridView ID="GridViewPrint" Visible="false" DataKeyNames="FY,DTE_SYMBOL1,SER_NO" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True">
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

										<%--<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>--%>
										<asp:TemplateField>
											<HeaderTemplate>SNO</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" ID="srno" Text='<%#GetSerail((Container.DataItemIndex+1)+"<br>",Eval("UTILIZATION_MODE1"))%>' />
											</ItemTemplate>
											<ItemStyle Width="40px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Description</HeaderTemplate>
											<ItemTemplate>
												<asp:Label ID="lblDescWithToolTip" runat="server" Text='<%#Eval("DESCRIPTION") %>' Visible="false"></asp:Label>
												<p style="padding-top: 8px; white-space: nowrap; width: 170px; text-overflow: ellipsis; overflow: hidden;">
													<asp:LinkButton ID="btnDes" ForeColor="Black" Height="18px" display="initial" CssClass="vertical-align-mid" Text='<%#Eval("DTE_SYMBOL1") +"==>"+Eval("DESCRIPTION") %>' runat="server"
														CommandName="viewDes" ToolTip='<%#Eval("DESCRIPTION") %>' CommandArgument='<%#GetCommandArgument(Eval("SER_NO"),Eval("DESCRIPTION"),Eval("JUSTIFICATION"),Eval("AMOUNT_DEMANDED_MIL"),Eval("DTE_SYMBOL2")) %>' />
												</p>
											</ItemTemplate>
											<ItemStyle Width="170px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Justification</HeaderTemplate>

											<ItemTemplate>
												<p style="padding-top: 9px; white-space: nowrap; width: 170px; text-overflow: ellipsis; overflow: hidden;">
													<asp:Label ID="lblJustWithToolTip" white-space="nowrap" Font-Bold="true" runat="server" Text='<%#Eval("JUSTIFICATION") %>'></asp:Label>
												</p>
											</ItemTemplate>
											<ItemStyle Width="170px" />
										</asp:TemplateField>
										<%--<asp:BoundField DataField="DTE_SYMBOL2" HeaderText="Dte" ItemStyle-BackColor="#EFEFEF">
											<ItemStyle BackColor="#EFEFEF"></ItemStyle>
										</asp:BoundField>--%>

										<asp:TemplateField>
											<HeaderTemplate>WPN SYS</HeaderTemplate>
											<ItemTemplate>
												<asp:Label ID="lblWpnSys" Font-Bold="true" runat="server" Text='<%#Eval("WEAPON_SYS") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="70" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>PDIB Status</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PDIB_STATUS_DECODE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" Width="50" />
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>Alloc</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" ID="lblAlloc_LAST" Font-Bold="true" runat="server" Text='<%#Eval("AMOUNT_ALLOCATED_LAST_YEAR_MIL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lblAlloc_LASTTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Current Req</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="lblALLOC" runat="server" Text='<%# Eval("AMOUNT_DEMANDED_MIL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Rec PSO</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="RecPSO" runat="server" Text='<%# Eval("AMOUNT_REC_PSO") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lqblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<%--8--%>
										<asp:TemplateField>
											<HeaderTemplate>Rec Plan</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="RecPlan" runat="server" Text='<%# Eval("AMOUNT_REC_PLANS") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lqblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<%--9--%>
										<asp:TemplateField>
											<HeaderTemplate>Rec DCAS(S)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="RecDCAS" runat="server" Text='<%# Eval("AMOUNT_REC_DCAS_EL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lqblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>



										<asp:TemplateField>
											<HeaderTemplate>SerNo</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Text='<%#Eval("SER_NO") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>FY</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Text='<%#Eval("FY") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>DTE_Symbol</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Text='<%#Eval("DTE_SYMBOL2") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>

									</Columns>

									<EmptyDataTemplate>
										<p align="center"><strong>No Record Found</strong></p>
									</EmptyDataTemplate>

								</asp:GridView>
							</div>
							<div class="col-lg-12 col-md-12" style="padding-right: 5px;margin-top: 5px;">
								<div hidden class="col-lg-6 col-md-6" style="padding-left: 0px; padding-right: 0px">
									<asp:Label Style="color: #3C8DBC; font-weight: 700;width:50%" ID="Serverlbl" runat="server">Server : </asp:Label>
									<asp:DropDownList CssClass="form-control" style="display:inline;width:50%" ID="Serverddl" runat="server">
										<%--<asp:ListItem Value=""> Select Server</asp:ListItem>--%>
										<asp:ListItem Value="A"> ALMS</asp:ListItem>
										<asp:ListItem Value="C"> CLMS</asp:ListItem>
										<asp:ListItem Value="L"> LPMS</asp:ListItem>
									</asp:DropDownList>
								</div>
								<div class="col-lg-6 col-md-6" style="text-align: right;">
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm"  Text="Save" ID="BtnSave" OnClick="BtnSave_Click1" />
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Reset" ID="BtnReset" OnClick="BtnReset_Click1" />
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>

			<%--other grid--%>

			<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;" id="DivDetails">
				<div id="Div1" visible="false" runat="server" class="col-md-12 col-lg-12 padingLeft5px">
					<div class="col-lg-8 col-md-6">
						<h3 id="H2" runat="server" style="color: #1D74D6; margin: 0px; float: left;">Description Detail</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h4 id="H3" runat="server" style="color: #1D74D6; margin: 0px"></h4>
					</div>

					<div runat="server" id="Div2" class="box box-info " style="padding-left: 0px; padding-right: 0px">

						<div class="box-body">

							<div id="gridContainer2" style="overflow: scroll; font-family: Arial; width: 100%">


								<asp:GridView ID="GridViewEstDetail" ShowFooter="true" DataKeyNames="PRICE_PER_UNIT" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowCreated="GridViewEstDetail_RowCreated" OnRowCommand="GridViewEstDetail_RowCommand">
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

										<asp:BoundField DataField="SER_NO" HeaderText="SER_NO" ItemStyle-BackColor="#EFEFEF" Visible="false"></asp:BoundField>
											<asp:TemplateField>
											<HeaderTemplate>Part No</HeaderTemplate>
											<ItemTemplate>
												
												<p style="padding-top: 8px">
													<asp:LinkButton ID="btnViewDes"  Height="18px" display="initial" CssClass="vertical-align-mid" Text='<%#Eval("PARTS_NO_NSN")%>' runat="server"
														CommandName="viewDes" ToolTip='View Detail' CommandArgument='<%#Eval("PARTS_NO_NSN") %>' />
												</p>
											</ItemTemplate>
											<%--<ItemStyle Width="170px" />--%>
										</asp:TemplateField>
										<%--<asp:TemplateField>
											<HeaderTemplate>Part No</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" CommandName="viewDes" ToolTip='View Detail' CommandArgument='<%#Eval("PARTS_NO_NSN")%>' Font-Bold="true" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0;">
													<asp:Label Text="" runat="server" />
												</div>
											</FooterTemplate>

										</asp:TemplateField>--%>

										<%--<asp:TemplateField>
											<HeaderTemplate>Nomenclature</HeaderTemplate>
											<ItemTemplate>
												
												<p style="padding-top: 8px">
													<asp:LinkButton ID="btnViewDes1"  Height="18px"  display="initial" CssClass="vertical-align-mid" Text='<%#Eval("NOMENCLATURE")%>' runat="server"
														CommandName="viewDesLPR" ToolTip='View LPR Detail' CommandArgument='<%#Eval("PARTS_NO_NSN") %>' />
												</p>
											</ItemTemplate>
											<ItemStyle Width="170px" />
										</asp:TemplateField>--%>

										<asp:TemplateField>
											<HeaderTemplate>NOMENCLATURE</HeaderTemplate>
											<ItemTemplate>
												<%--<asp:Label ID="lblDescWithToolTip" runat="server" Text='<%#Eval("NOMENCLATURE") %>' Visible="false"></asp:Label>--%>
												<p style="white-space: nowrap; width: 140px; text-overflow: ellipsis; overflow: hidden; ">
													<asp:LinkButton ID="btnDesww"  Height="18px" CssClass="vertical-align-mid" Text='<%#Eval("NOMENCLATURE") %>' runat="server"
														CommandName="viewDesLPR" ToolTip='<%#Eval("NOMENCLATURE") %>' CommandArgument='<%#Eval("PARTS_NO_NSN") %>' />
												</p>
											</ItemTemplate>
											<ItemStyle Width="140px" />
										</asp:TemplateField>
									<%--	<asp:TemplateField>
											<HeaderTemplate>Nomenclature</HeaderTemplate>
											<ItemTemplate>
												<asp:Label ID="lbl_NOMENCLATURE" Font-Bold="true" runat="server" Text='<%#Eval("NOMENCLATURE") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
												</div>
											</FooterTemplate>

										</asp:TemplateField>--%>


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
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="lbl_PO_NO" runat="server" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:Label>
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
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" runat="server" Text='<%#Eval("NET_DEMANDED") %>'></asp:Label>
											</ItemTemplate>

										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>User Auth</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("QTY_AUTH_USER") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />

										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>User Hold</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("HOLD_QTY_USER") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label CssClass="text-Align-span" ID="dasd" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>Log Auth</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("QTY_AUTH_LOG") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />

										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Log Hold</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("HOLD_QTY_LOG") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />

										</asp:TemplateField>
										
										
										<asp:TemplateField HeaderText="LPR BGT">
											<ItemTemplate>
												<asp:TextBox ID="txtLPRBGT" AutoCompleteType="None" Font-Bold="true" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" AutoPostBack="true" runat="server" Width="60px" Height="25px" Text='<%# DataBinder.Eval(Container.DataItem, "LPR_BGT") %>'></asp:TextBox>
											</ItemTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<asp:TemplateField HeaderText="LPR Year BGT">
											<ItemTemplate>
												<asp:TextBox ID="txtLPRYear" AutoCompleteType="None" Font-Bold="true" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" AutoPostBack="true" runat="server" Width="60px" Height="25px" Text='<%# DataBinder.Eval(Container.DataItem, "LPR_YEAR_BGT") %>'></asp:TextBox>
											</ItemTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<asp:TemplateField HeaderText="LPR Mode BGT">
											<ItemTemplate>
												<asp:TextBox ID="txtLPRMode" AutoCompleteType="None" Font-Bold="true" CssClass="float-Right" AutoPostBack="true" runat="server" Width="60px" Height="25px" Text='<%# DataBinder.Eval(Container.DataItem, "LPR_MODE_BGT") %>'></asp:TextBox>
											</ItemTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<asp:TemplateField HeaderText="BGT Qty">
											<ItemTemplate>
												<asp:TextBox ID="txtLPRQty" AutoCompleteType="None" Font-Bold="true" onkeypress="return onlyNumbers();" AutoPostBack="true" runat="server" Width="60px" Height="25px" Text='<%# DataBinder.Eval(Container.DataItem, "QTY_REC_BPC") %>'></asp:TextBox>
											</ItemTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<asp:TemplateField Visible="false">
											<HeaderTemplate>RecNo</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("REC_NO") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />

										</asp:TemplateField>
										<asp:TemplateField Visible="false">
											<HeaderTemplate>FY</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("FY") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />

										</asp:TemplateField>
										<asp:TemplateField Visible="false">
											<HeaderTemplate>Dte</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("DTE_CODE") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />

										</asp:TemplateField>
										<asp:TemplateField HeaderText="Bgt Unit Price">
											<ItemTemplate>
												<asp:TextBox ID="txtBgtRec" AutoCompleteType="None" Font-Bold="true" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" AutoPostBack="true" runat="server" Width="90px" Height="25px" Text='<%# DataBinder.Eval(Container.DataItem, "AMOUNT_REC_BPC") %>'></asp:TextBox>
											</ItemTemplate>
											<ItemStyle Width="45px" />
										</asp:TemplateField>
										<asp:TemplateField Visible="false">
											<HeaderTemplate>Dte</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="font15" runat="server" Font-Bold="true" Text='<%#Eval("SER_NO") %>'></asp:Label>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />

										</asp:TemplateField>

										<asp:TemplateField Visible="true">
											<HeaderTemplate>Net Demanded BGT</HeaderTemplate>
											<ItemTemplate>
												<asp:Label  runat="server" Font-Bold="true"  CssClass="text-Align-span float-Right"  style="text-align: right;" Text='<%# GetTotalDemanded( DataBinder.Eval(Container.DataItem, "QTY_REC_BPC") ,DataBinder.Eval(Container.DataItem, "AMOUNT_REC_BPC")) %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0;">
													<asp:Label Text='<%# GetSumTotalDemanded() %>' runat="server"  CssClass="text-Align-span float-Right" Font-Bold="true" style="text-align: right;" />
												</div>
											</FooterTemplate>
											<ItemStyle HorizontalAlign="Center" />

										</asp:TemplateField>
										
										<asp:TemplateField HeaderText="Remarks By BGT">
											<ItemTemplate>
												<asp:TextBox ID="txtDecision" AutoCompleteType="None" CssClass="form-control" TextMode="MultiLine" AutoPostBack="true" runat="server" Width="100%" Height="18px" Text='<%# DataBinder.Eval(Container.DataItem, "BGT_REMARKS") %>'></asp:TextBox>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
                                            <HeaderTemplate></HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="SameAmtCheckBox" AutoPostBack="true" OnCheckedChanged="SameAmtCheckBox_CheckedChanged" runat="server" />
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
								<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Style="margin-top: 5px" Text="Save" ID="SaveSubBtn" OnClick="SaveSubBtn_Click" />
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>

	</div>
</asp:Content>
