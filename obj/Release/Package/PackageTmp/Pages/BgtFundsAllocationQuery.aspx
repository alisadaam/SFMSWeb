<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtFundsAllocationQuery.aspx.cs" Inherits="BMSWeb.Pages.BgtFundsAllocationQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
	<style>
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

	    FY,
	    th {
	        text-align: center !important;
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
	<script type="text/javascript" lang="javascript">
	    $(document).ready(function () {
	        $(".sidebar-toggle").click();
	        $('[data-toggle="popover"]').popover();

	    });
	    function Condition1() {
	        swal({
	            title: "Error!",
	            text: "Please Un Finalize Budget Availability Certificate to perform this Operation.",
	            type: "error",
	            confirmButtonColor: "rgb(53, 155, 255)"
	        });
	        //swal("Inserted!", "Record Inserted Sucessfully.", "success", "rgb(53, 155, 255)");
	    }

	    function Condition2() {
	        swal({
	            title: "Error!",
	            text: "You Cannot With Draw this Amount from the Allocated Amount",
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
	        $('[data-toggle="popover"]').popover();
	    });
	</script>
	<div class="row" id="main_form" runat="server">
		<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">

			<div class="col-lg-12 col-md-12">
				<h3 runat="server" style="color: #00369E; margin: 0px">Allocation Details</h3>
			</div>

			<div class="col-lg-12 col-md-12" style="padding-left: 7px;">

				<div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

					<div class="box-body" style="padding-bottom: 2px;">
						<table class="col-lg-12 col-md-12" style="padding: 0px; font-size: 13px">
							<tr>
								<td class="col-lg-5 col-md-5" style="padding: 0px">
									<div class="row">
										<div class="col-lg-4 col-md-4 buttom-margin padingRight1px">
											
											<asp:DropDownList CssClass="form-control" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
										</div>
										<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px">
											
											<asp:TextBox ID="txtFromDate" runat="server" AutoPostBack="true" Width="67%" placeholder="Alloc From" CssClass=" input-sm datepicker inline form-control" OnTextChanged="txtFromDate_TextChanged"></asp:TextBox>
											<span style="background: #00369E; width: 30%" class=" form-control inline">
												<i style="color: #FFF;" class="fa fa-calendar"></i>
											</span>
										</div>
										<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px">
											
											<asp:TextBox ID="txtToDate" runat="server" AutoPostBack="true" placeholder="Alloc To" Width="67%" CssClass=" input-sm datepicker inline form-control" OnTextChanged="txtToDate_TextChanged"></asp:TextBox>
											<span style="background: #00369E; width: 30%" class=" form-control inline">
												<i style="color: #FFF;" class="fa fa-calendar"></i>
											</span>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4 col-md-4 buttom-margin  padingRight1px">

											<asp:DropDownList CssClass="form-control" ID="PSOddl" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" OnSelectedIndexChanged="PSOddl_SelectedIndexChanged" runat="server" AutoPostBack="True"></asp:DropDownList>
										</div>
										<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px">

											<asp:DropDownList CssClass="form-control" ID="ACASddl" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" OnSelectedIndexChanged="ACASddl_SelectedIndexChanged" runat="server"></asp:DropDownList>
										</div>
										<div class="col-lg-4 col-md-4 buttom-margin  padingLeft1px ">

											<asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="Directorateddl" runat="server" OnSelectedIndexChanged="Directorateddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
										</div>
									</div>
									<div class="row">
									<div class="col-lg-4 col-md-4 buttom-margin  padingRight1px">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Currency</asp:Label>
										<asp:RadioButtonList ID="RBcurrancy" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RBcurrancy_SelectedIndexChanged" Style="width: 99%" runat="server">
											<asp:ListItem Value="P" Selected="True">&nbsp;Local</asp:ListItem>
											<asp:ListItem Value="F">&nbsp;Foreign</asp:ListItem>
										</asp:RadioButtonList>


									</div>
									<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Requirement Type</asp:Label>
										<asp:RadioButtonList ID="RBTReqType" AutoPostBack="true" OnSelectedIndexChanged="RBTReqType_SelectedIndexChanged" RepeatDirection="Horizontal" Style="width: 99%;" runat="server">
											<asp:ListItem Value="" Selected="True">&nbsp; All&nbsp;</asp:ListItem>
											<asp:ListItem Value="N">&nbsp;NM</asp:ListItem>
											<asp:ListItem Value="M">&nbsp;O & M</asp:ListItem>
										</asp:RadioButtonList>

									</div>
									<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Utilization Mode</asp:Label>
										<asp:RadioButtonList ID="RBUtilizationMode" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="RBUtilizationMode_SelectedIndexChanged" RepeatDirection="Horizontal" Style="width: 99%" runat="server">
											<asp:ListItem Value="" Selected="True">&nbsp;All&nbsp;</asp:ListItem>
											<asp:ListItem Value="C">&nbsp;OTC</asp:ListItem>
											<asp:ListItem Value="T">&nbsp;TOF</asp:ListItem>
											<asp:ListItem Value="R">&nbsp;RRC</asp:ListItem>
										</asp:RadioButtonList>
									</div>
										</div>
									<div class="row">
										<div class="col-lg-12 col-md-12 buttom-margin  ">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Purchase Type</asp:Label>
												<asp:RadioButtonList ID="RBPurType"  Width="100%" RepeatDirection="Horizontal"  AutoPostBack="true" OnSelectedIndexChanged="RBPurType_SelectedIndexChanged" Style="width: 99%"  runat="server">
													<asp:ListItem Value="" Selected="True">&nbsp;All</asp:ListItem>
													<asp:ListItem Value="C">&nbsp;CP</asp:ListItem>
													<asp:ListItem Value="L">&nbsp;LP</asp:ListItem>
													<asp:ListItem Value="Z">&nbsp;TL</asp:ListItem>
													<asp:ListItem Value="V">&nbsp;CL</asp:ListItem>
													<asp:ListItem Value="G">&nbsp;LG</asp:ListItem>
													<asp:ListItem Value="U">&nbsp;CU</asp:ListItem>
													<asp:ListItem Value="X">&nbsp;TC</asp:ListItem>
													<asp:ListItem Value="W">&nbsp;CC</asp:ListItem>
												</asp:RadioButtonList>
											</div>
									</div>
										<div class="row">
									<div id="LPHeadsDiv" visible="false" runat="server" class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">LP Heads</asp:Label>
										<asp:DropDownList CssClass="form-control" ID="LP_Headsddl" DataValueField="LP_HEAD_CODE" DataTextField="LP_HEAD_DECODE" runat="server" AutoPostBack="True" OnSelectedIndexChanged="LP_Headsddl_SelectedIndexChanged"></asp:DropDownList>
									</div>
									<div id="LGHeadsDiv" visible="false" runat="server" class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">LG Heads</asp:Label>
										<asp:DropDownList CssClass="form-control" ID="LG_Headsddl" DataValueField="LG_HEAD_CODE" DataTextField="LG_HEAD_DECODE" runat="server" AutoPostBack="True" OnSelectedIndexChanged="LG_Headsddl_SelectedIndexChanged" OnDataBound="LG_Headsddl_DataBound"></asp:DropDownList>
									</div>
									<div id="CUHeadsDiv" visible="false" runat="server" class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">CU Heads</asp:Label>
										<asp:DropDownList CssClass="form-control" ID="CU_Headsddl" DataValueField="CU_HEAD_CODE" DataTextField="CU_HEAD_DECODE" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CU_Headsddl_SelectedIndexChanged" OnDataBound="CU_Headsddl_DataBound"></asp:DropDownList>
									</div>
											</div>
								</td>
								<td class="col-lg-7 col-md-7">
									<table style="width: 100%;">
										<tr>
											<td class="col-lg-8 col-md-8" style="padding: 0px;">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Bgt Type</asp:Label>
												<asp:CheckBoxList ID="CBbgtType" BorderWidth="1px" Width="100%" RepeatDirection="Horizontal" BorderColor="#499BEA" AutoPostBack="true" OnSelectedIndexChanged="CBbgtType_SelectedIndexChanged" Style="background-color: #499BEA; color: white; width: 99%" BorderStyle="Solid" runat="server">
													<asp:ListItem Value="" Selected="True">All</asp:ListItem>
													<asp:ListItem Value="N">Normal</asp:ListItem>
													<asp:ListItem Value="S">Special</asp:ListItem>
													<asp:ListItem Value="C">Security</asp:ListItem>
													<asp:ListItem Value="P">AFDP</asp:ListItem>
													<asp:ListItem Value="B">Bholari</asp:ListItem>
													<asp:ListItem Value="D">FGDP</asp:ListItem>
												</asp:CheckBoxList>
											</td>
											<%--<td class=" col-lg-5 col-md-5" style="padding: 0px;">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Mode</asp:Label>
										<asp:RadioButtonList ID="RBUtilizationMode" BorderWidth="1px" BorderColor="#499BEA" AutoPostBack="true" OnSelectedIndexChanged="RBUtilizationMode_SelectedIndexChanged" RepeatDirection="Horizontal" Style="background-color: #499BEA;color:white; width: 99%" BorderStyle="Solid" runat="server">
											<asp:ListItem Value="" Selected="True">All</asp:ListItem>
											<asp:ListItem Value="C">OTC</asp:ListItem>
											<asp:ListItem Value="T">TOF</asp:ListItem>
											<asp:ListItem Value="R">RRC</asp:ListItem>
										</asp:RadioButtonList>
									</td>--%>
											<td class=" col-lg-4 col-md-4" style="padding: 0px;">
												
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Projects</asp:Label>
															<asp:DropDownList CssClass="form-control" ID="PROJECT_IDddl" DataValueField="PROJECT_CODE" DataTextField="PROJECT_DECODE" runat="server" OnSelectedIndexChanged="PROJECT_IDddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>

											</td>

										</tr>
										<tr>
											<td class=" col-lg-8 col-md-8" style="padding: 0px;">
												<table class=" col-lg-12 col-md-12" style="padding: 0px;">
													<tr>
												<td class=" col-lg-7 col-md-7" style="padding: 0px;">
															<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indig</asp:Label>
															<asp:RadioButtonList ID="RBIndigType" BorderWidth="1px" BorderColor="#499BEA" AutoPostBack="true" OnSelectedIndexChanged="RBIndigType_SelectedIndexChanged" RepeatDirection="Horizontal" Style="background-color: #499BEA; color: white; width: 99%;" BorderStyle="Solid" runat="server">
																<asp:ListItem Value="" Selected="True">All</asp:ListItem>
																<asp:ListItem Value="Ind">Indig</asp:ListItem>
																<asp:ListItem Value="NonInd">Non Indig</asp:ListItem>
															</asp:RadioButtonList>
														</td>
														<td class=" col-lg-5 col-md-5" style="padding: 0px;">
															<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indenter</asp:Label>
															<asp:RadioButtonList ID="RBIndenter" BorderWidth="1px" BorderColor="#499BEA" AutoPostBack="true" Enabled="false" OnSelectedIndexChanged="RBIndenter_SelectedIndexChanged" RepeatDirection="Horizontal" Style="background-color: #499BEA; color: white; width: 99%;" BorderStyle="Solid" runat="server">
																<asp:ListItem Value="" Selected="True">All</asp:ListItem>
																<asp:ListItem Value="DCM"> DCM</asp:ListItem>
																<asp:ListItem Value="RRC"> RRC</asp:ListItem>
															</asp:RadioButtonList>

														</td>
														</tr>
													</table>
											</td>
											<td class=" col-lg-4 col-md-4" style="padding: 0px;">
												<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Allocated To</asp:Label>
															<asp:DropDownList CssClass="form-control" DataValueField="LP_USER_CODE" DataTextField="LP_USER_DECODE" ID="AllocatedTo" runat="server" OnDataBound="AllocatedTo_DataBound" OnSelectedIndexChanged="AllocatedTo_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>


											</td>


										</tr>
										<tr>
											<td>
												<table class=" col-lg-12 col-md-12" style="padding: 0px;">
													<tr>
															<td class=" col-lg-7 col-md-7" style="padding: 0px;">
															<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Allocation Type</asp:Label>
												<asp:RadioButtonList ID="RBAllocationType" BorderWidth="1px" BorderColor="#499BEA" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RBAllocationType_SelectedIndexChanged" Style="background-color: #499BEA; color: white; width: 99%;" BorderStyle="Solid" runat="server">
													<asp:ListItem Value="" Selected="True">All</asp:ListItem>
													<asp:ListItem Value="B">BPC Alloc</asp:ListItem>
													<asp:ListItem Value="A">After BPC</asp:ListItem>
												</asp:RadioButtonList>
														</td>
															<td class=" col-lg-5 col-md-5" style="padding: 0px;">
															<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Allocation Amt</asp:Label>
															<asp:RadioButtonList ID="RBAllocAmt" BorderWidth="1px" BorderColor="#499BEA" AutoPostBack="true" OnSelectedIndexChanged="RBAllocAmt_SelectedIndexChanged" RepeatDirection="Horizontal" Style="background-color: #499BEA; color: white; width: 99%;" BorderStyle="Solid" runat="server">
																<asp:ListItem Value="NZ" Selected="True">Non Zero</asp:ListItem>
																<asp:ListItem Value="ALL"> All</asp:ListItem>
															</asp:RadioButtonList>
														</td>
													</tr>
												</table>

											</td>
											<td>

												
															<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Special Directorate</asp:Label>
															<asp:DropDownList CssClass="form-control" ID="SpltDte1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SpltDte1_SelectedIndexChanged">
																<asp:ListItem Value=""> Select Splt Dte</asp:ListItem>
																<asp:ListItem Value="WKS"> Dte of Works</asp:ListItem>
																<asp:ListItem Value="DIT"> Dte of IS(Bases)</asp:ListItem>
																<asp:ListItem Value="MGT"> Dte of LAS</asp:ListItem>
																<asp:ListItem Value="DAV"> Dte of Avionics</asp:ListItem>
																<asp:ListItem Value="SUP"> Dte of C&GE</asp:ListItem>
																<asp:ListItem Value="NA"> Not Applicable</asp:ListItem>
															</asp:DropDownList>
														


											</td>

										</tr>
											<tr>
											<td class="col-lg-7 col-md-7" style="padding: 0px;">
													<asp:Label Style="color: #00369E;; font-weight: 700;" runat="server">Description Search</asp:Label><br />
									<asp:TextBox runat="server" CssClass="form-control Upper-case" ID="txtDescription" AutoCompleteType="Search" placeholder="Search" AutoPostBack="true" OnTextChanged="txtDescription_TextChanged"></asp:TextBox>

											</td>
											<td class="col-lg-7 col-md-7" style="padding: 0px;">
													<asp:Label Style="color: #00369E;; font-weight: 700;" runat="server">BAC Search</asp:Label><br />
									<asp:TextBox runat="server" CssClass="form-control Upper-case" ID="txtBAC" AutoCompleteType="Search" placeholder="Search" AutoPostBack="true" OnTextChanged="txtBAC_TextChanged" ></asp:TextBox>

											</td>
										</tr>
									</table>





								</td>
							</tr>
						</table>



					</div>

				</div>
			</div>
		</div>
		<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">
			<div id="GridDiv" runat="server" class="col-md-12 col-lg-12 padingLeft5px">
				<div class="col-lg-8 col-md-6">
					<h3 id="TReq" runat="server" style="color: #1D74D6; margin: 0px">Total Requirements</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H1" runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
				</div>

				<div runat="server" id="MainDetails" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px">

					<div class="box-body">

						<div id="gridContainer" style="font-family: Arial; font-size: 16px; color: black; overflow-y: hidden">

							<asp:GridView ID="GridAllocation" AllowPaging="true" DataKeyNames="" OnRowDataBound="GridAllocation_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridAllocation_RowCreated" OnRowCommand="GridAllocation_RowCommand" OnPageIndexChanging="GridAllocation_PageIndexChanging">
								<FooterStyle BackColor="#499BEA" Font-Bold="True" ForeColor="White" />

								<EditRowStyle BackColor="#2461BF" />
								<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
								<AlternatingRowStyle BackColor="White" />
								<PagerStyle CssClass="pagination-ys" />
								<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
								<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked test" BackColor="#00369E" Font-Bold="True" ForeColor="White" />
								<EmptyDataRowStyle BackColor="#EFF3FB" />

								<Columns>
									<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#499BEA"></asp:BoundField>
									<asp:TemplateField>
										<HeaderTemplate>BAC No</HeaderTemplate>
										<ItemTemplate>
											<p style="text-overflow: ellipsis; overflow: hidden;">
												<%--<asp:LinkButton ID="btnBAC" CssClass="vertical-align-mid" Text='<%#Eval("BAC_NO") %>' runat="server"
													CommandName="viewBACDes" ToolTip='<%#Eval("BAC_NO") %>' CommandArgument='<%#Eval("BAC_NO") %>' />--%>
                                                <asp:LinkButton ID="btnBAC" CssClass="vertical-align-mid" Text='<%#Eval("BAC_NO") %>' runat="server"
													CommandName="viewBACDes" ToolTip='<%#Eval("BAC_NO") %>'  CommandArgument='<%#GetCommandArgument(Eval("BAC_NO"),Eval("AMOUNT_ALLOCATED"))%>' />

                                               

											</p>
										</ItemTemplate>
										<FooterTemplate>
											<asp:Label Font-Bold="true" Text="Total" runat="server"></asp:Label>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Date of Alloc</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("FormatedAllocDate") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
										<ItemStyle Wrap="false" />
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Description</HeaderTemplate>
										<ItemTemplate>
											<p style="padding-top: 0px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
												<asp:Label ID="lblRemarks" Width="440px" Height="17px" display="initial" CssClass="vertical-align-mid" Text='<%#Eval("REMARKS") %>' runat="server"
													data-toggle="popover" data-trigger="hover" />
											</p>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Justification</HeaderTemplate>
										<ItemTemplate>
											<p style="padding-top: 0px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
												<asp:Label ID="lblPurpose" Width="130px" Height="17px" display="initial" CssClass="vertical-align-mid" Text='<%#Eval("PURPOSE") %>' runat="server"
													data-toggle="popover" data-trigger="hover" />
											</p>
										</ItemTemplate>
										<ItemStyle Wrap="false" />
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Alloc</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("ALLOCATED_TO") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Indenter</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("NEW_INDENTER") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
									</asp:TemplateField>
											<asp:TemplateField>
										<HeaderTemplate>RRC No</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("RRC_NO") %>'></asp:Label>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Initial Alloc</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" CssClass="text-Align-span" Text='<%#Eval("AMOUNT_ALLOCATED") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle Width="90px" />
										<FooterTemplate>
											<asp:Label Font-Bold="true" ID="TotalAllocated" runat="server" CssClass="text-Align-span"></asp:Label>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Indents</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("NO_OF_INDENTS") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
										<FooterTemplate>
											<asp:Label Font-Bold="true" ID="TotalNO_OF_IND" runat="server"></asp:Label>
										</FooterTemplate>
										<FooterStyle HorizontalAlign="Center" />
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Indents Amt</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" CssClass="text-Align-span" runat="server" Text='<%#Eval("INDENT_AMT") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle Width="75px" />
										<FooterTemplate>
											<asp:Label Font-Bold="true" ID="TotalINDENT_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Bgt Cert</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" CssClass="text-Align-span" Text='<%#Eval("BGT_CERT") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle Width="75px" />
										<FooterTemplate>
											<asp:Label Font-Bold="true" ID="TotalbgtCert" runat="server" CssClass="text-Align-span"></asp:Label>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Rev Alloc</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" CssClass="text-Align-span" Text='<%#Eval("REVISED_INDENT_AMT") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle Width="75px" />
										<FooterTemplate>
											<asp:Label Font-Bold="true" ID="TotalREV_IND_AMT" runat="server" CssClass="text-Align-span"></asp:Label>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Rev Avail Cert</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" CssClass="text-Align-span" Text='<%#Eval("REVISED_BGT_CERT") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle Width="75px" />
										<FooterTemplate>
											<asp:Label Font-Bold="true" ID="TotalREV_BGT_CERT" runat="server" CssClass="text-Align-span"></asp:Label>
										</FooterTemplate>
									</asp:TemplateField>
										<asp:TemplateField>
										<HeaderTemplate>Balance</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" CssClass="text-Align-span" runat="server" Text='<%#Eval("BAC_BAL") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle Width="90px" />
										<FooterTemplate>
											<asp:Label Font-Bold="true" ID="TotalBAC_BAL" runat="server" CssClass="text-Align-span"></asp:Label>
										</FooterTemplate>
									</asp:TemplateField>
									<%--<asp:TemplateField>
										<HeaderTemplate>Purpose</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("PURPOSE") %>'></asp:Label>
										</ItemTemplate>
									</asp:TemplateField>--%>
									<%--<asp:TemplateField>
										<HeaderTemplate>User Name</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("EX_RATE") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
									</asp:TemplateField>--%>
                                  <%--  <asp:TemplateField>
										<HeaderTemplate>Modification Date</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("MODIFICATION_DATE") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" />
									</asp:TemplateField>--%>

									<%--<asp:TemplateField>
										<HeaderTemplate>Log App</HeaderTemplate>
										<ItemTemplate>
											<asp:Label Font-Bold="true" CssClass="text-Align-span" runat="server" Text='<%#Eval("LOG_APPROVAL") %>'></asp:Label>
										</ItemTemplate>
										<ItemStyle Width="75px" />
										<FooterTemplate>
											<asp:Label Font-Bold="true" ID="TotalLOG_APPROVAL" runat="server" CssClass="text-Align-span"></asp:Label>
										</FooterTemplate>
									</asp:TemplateField>--%>
								</Columns>



							</asp:GridView>


						</div>

					</div>
				</div>
			</div>
		</div>

        

	</div>

    <div id="BACDetailDiv" runat="server" class="col-lg-12 col-md-12 col-sm-12" visible="false">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <h3 id="H3" runat="server" style="color: #00369E; margin: 0px">Fixed Price Contracts History</h3>
   
                </div>

                <%--<div class="col-lg-3 col-md-6">
                   
                </div>--%>

                <div class="col-lg-9 col-md-9" style="text-align: right; padding-top: 5px;">
                    
                    <h4 id="H4" runat="server" style="color: #00369E; margin: 0px">(Amount in Million)</h4>
                </div>
            </div>
            <div class="row">


                <div class="col-lg-12 col-md-8 col-sm-12">


                    <div runat="server" id="Div4" class="box box-info" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px;">

                        <div class="box-body" style="padding-top: 2px">

                            <div style="font-family: Arial; font-size: 16px; color: black; overflow-y: hidden">
                                <asp:GridView ID="GridBACDetail" AllowPaging="True"  ShowFooter="True"
                                    CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    AllowSorting="True" OnRowDataBound="GridBACDetail_RowDataBound" OnPageIndexChanging="GridBACDetail_PageIndexChanging">
                                    <FooterStyle BackColor="#499BEA" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                   
                                    <AlternatingRowStyle BackColor="White" />
                                    <PagerStyle CssClass="pagination-ys" />

                                    <RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
                                    <HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked test" BackColor="#00369E" Font-Bold="True" ForeColor="White" />
                                    <EmptyDataRowStyle BackColor="#EFF3FB" />



                                    <Columns>
                                        <asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#499BEA">
                                            <ItemStyle BackColor="#499BEA" Width="25px"></ItemStyle>
                                        </asp:BoundField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>Date</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label Font-Bold="true" runat="server" Text='<%#Eval("FormatedAllocDate") %>'></asp:Label>

                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="150px" />
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>Opening Bal</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label Font-Bold="true" runat="server" Text='<%#Eval("OPENNING_BAL") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>Addition</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label Font-Bold="true" runat="server" Text='<%#Eval("ALLOCATED_AMT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>With Drawal</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label Font-Bold="true" runat="server" Text='<%#Eval("WITHDRAWL_AMT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>

                                         <asp:TemplateField>
                                            <HeaderTemplate>Allocated To</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label Font-Bold="true" runat="server" Text='<%#Eval("ALLOCATED_TO") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>

                                         <asp:TemplateField>
                                            <HeaderTemplate>Spl Dte</HeaderTemplate>
                                            <ItemTemplate>
                                                  <asp:Label runat="server" Font-Bold="true" Text='<%#Eval("INDENTER") %>'></asp:Label>
                                             <%--   <asp:Label runat="server" Font-Bold="true" Text='<%#Eval("WITHDRAWL_AMT") %>'></asp:Label>--%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <HeaderTemplate>Indenter</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Font-Bold="true" Text='<%#Eval("NEW_INDENTER") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>

                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>Net Alloc</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Font-Bold="true" Text='<%#Eval("NET_ALLOCATED_AMT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                        </asp:TemplateField>

                                    <%--  <asp:TemplateField>
										<HeaderTemplate>Description</HeaderTemplate>
										<ItemTemplate>
											<p style="padding-top: 0px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
												<asp:Label ID="lblRemarks" Width="440px" Height="17px" display="initial" CssClass="vertical-align-mid" Text='<%#Eval("REMARKS") %>' runat="server"
													data-toggle="popover" data-trigger="hover" />
											</p>
										</ItemTemplate>
									</asp:TemplateField>--%>


                                        <asp:TemplateField>
                                            <HeaderTemplate>Action Description</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Font-Bold="true" Text='<%#Eval("REMARKS") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="left" Width="300px" />
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField>
                                            <HeaderTemplate>Purpose</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PURPOSE") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="left" Width="300px" />
                                        </asp:TemplateField>--%>
                                       <%--  <asp:TemplateField>
                                            <HeaderTemplate>Modification Date</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Font-Bold="true" Text='<%#Eval("MODIFICATION_DATE") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="left" Width="300px" />
                                        </asp:TemplateField>--%>


                                    </Columns>

                                </asp:GridView>
                                <asp:Button runat="server" class="btn btn-primary btn-sm" Style="float: right; margin-top: 5px" Text="Add New" ID="BtnAdd" OnClick="BtnAdd_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    <div class="row" id="DivAddBACDetail" runat="server" visible="false">
            <div class="col-md-12 col-lg-12 col-sm-12">


                <div id="SubFoamDiv" runat="server" class="col-md-8 col-lg-8 padingRight5px">
                    <h3 runat="server" style="color: #00369E; margin: 0px">Data Entry</h3>
                    <h3 runat="server" style="color: #00369E; margin: 0px">&nbsp;</h3>
                    <asp:Panel runat="server" ID="Sub_foamPanal">
                        <div runat="server" id="Sub_foam" class="box box-primary">
                            <div class="box-body">

                                <div class="col-lg-12 buttom-margin" style="padding-left: 0px; padding-right: 0px">
                                    <div class="row">
                                       <%-- <div class="col-lg-4 col-md-4">
                                            <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Date</asp:Label><br />
                                            <asp:TextBox AutoCompleteType="None" ID="txtAllocDate" runat="server" Width="75%" placeholder="Date" CssClass=" input-sm datepicker inline form-control"></asp:TextBox>
                                            <span style="background: #00369E;" class=" form-control inline">
                                                <i style="color: #FFF;" class="fa fa-calendar"></i>
                                            </span>
                                          
                                        </div>--%>
                                        <div class="col-lg-4 col-md-4">
                                            <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Opening Balance</asp:Label><br />
                                            <asp:TextBox Width="100%" ID="txtOpenBal" style="text-align:right;" CssClass="form-control Upper-case" Enabled="false" onkeypress="return onlyNumbers();" placeholder="Initial Ceiling" AutoComplete="Off" runat="server"></asp:TextBox>
                                         
                                        </div>
                                        <div class="col-lg-4 col-md-4">
                                            <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Action</asp:Label>

                                            <asp:DropDownList CssClass="form-control" ID="Actionddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Actionddl_SelectedIndexChanged">

                                                <asp:ListItem Value=""> Select Action</asp:ListItem>
                                                <asp:ListItem Value="A"> Addition</asp:ListItem>
                                                <asp:ListItem Value="B"> Withdrawl</asp:ListItem>
                                                 <asp:ListItem Value="C">Change Allocation To</asp:ListItem>
                                                <asp:ListItem Value="I"> Change Spl Dte</asp:ListItem>
                                                 <asp:ListItem Value="P">Change Purpose</asp:ListItem>
                                                <asp:ListItem Value="Z">Change Indenter</asp:ListItem>

                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Actionddl" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Action Missing"></asp:RequiredFieldValidator>
                                        </div>

                                         <div class="col-lg-4 col-md-4">

                                            <asp:Label Style="color: #00369E; font-weight: 700;" runat="server" Visible="false" >Net Allocation</asp:Label>
                                            <asp:TextBox Width="100%" ID="txtNetAllocatedAmount" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" Visible="false" placeholder="Net Ceiling" AutoComplete="Off" runat="server"></asp:TextBox>

                                        </div>


                                        <div id="DivAllocation" runat="server" class="col-lg-4 col-md-4" visible="false">

                                            <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Allocated Amount</asp:Label>
                                            <asp:TextBox runat="server" CssClass="form-control Upper-case" ID="txtAllocatedAmount" onkeypress="return onlyNumbers();" placeholder="Allocated Amount" AutoPostBack="true"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="rqAlloc" ControlToValidate="txtAllocatedAmount" ValidationGroup="AllocCeiling"  runat="server" Display="None" ErrorMessage="Allocated Amount Missing"></asp:RequiredFieldValidator>
                                        </div>

                                         <div id="DivWithDrawal" runat="server" class="col-lg-4 col-md-4" visible="false">

                                             <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">With Drawal Amount</asp:Label>
                                             <asp:TextBox Width="100%" ID="txtWithdrawalAmount" CssClass="form-control Upper-case" onkeypress="return onlyNumbers();" placeholder="WithDrawal Amount" AutoComplete="Off" runat="server"></asp:TextBox>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtWithdrawalAmount" ValidationGroup="AllocCeiling"  runat="server" Display="None" ErrorMessage="Withdrawal Amount Missing"></asp:RequiredFieldValidator>
                                        </div>

                                         <div id="DivAllocationTo" runat="server" class="col-lg-4 col-md-4" visible="false">

                                             <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Change Alloc To</asp:Label>

                                             <asp:DropDownList CssClass="form-control" DataValueField="LP_USER_CODE" DataTextField="LP_USER_DECODE" ID="drpAllocatedTo" runat="server" AutoPostBack="True">
                                                  
                                             </asp:DropDownList>
                                              
                                           <%-- <asp:DropDownList CssClass="form-control" ID="drpAllocatedTo21" runat="server" AutoPostBack="True">
                                                    <asp:ListItem Value=""> Select </asp:ListItem>
													<asp:ListItem Value="A"> POF</asp:ListItem>
													<asp:ListItem Value="B"> ARMY </asp:ListItem>
                                                  	<asp:ListItem Value="C"> APF </asp:ListItem>
													<asp:ListItem Value="D"> ACAS (Log) </asp:ListItem>
                                                	<asp:ListItem Value="E"> NLC</asp:ListItem>
													<asp:ListItem Value="F"> DCAAF </asp:ListItem>
                                                    	<asp:ListItem Value="G"> NAVY</asp:ListItem>
													<asp:ListItem Value="H"> CAO </asp:ListItem>
                                            </asp:DropDownList>--%>

                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="drpAllocatedTo" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Allocated To Missing"></asp:RequiredFieldValidator>
                                        </div>

                                        <div id="DivSplDte" runat="server" class="col-lg-4 col-md-4" visible="false">

                                             <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Spl Dte</asp:Label>
                                            <asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="drpSplDte" runat="server" AutoPostBack="True"></asp:DropDownList>
                                            
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="drpSplDte" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Directorate Missing"></asp:RequiredFieldValidator>

                                        </div>

                                       <div id="DivPurpose" runat="server" class="col-lg-4 col-md-84" visible="false">

                                             <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Select Purpose</asp:Label>
                                             <asp:TextBox Width="100%" ID="txtPurpose" CssClass="form-control Upper-case"  placeholder="Purpose" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtPurpose" ValidationGroup="AllocCeiling"  runat="server" Display="None" ErrorMessage="Purpose Missing"></asp:RequiredFieldValidator>
                                        </div>


                                         <div id="DivIndenter" runat="server" class="col-lg-4 col-md-4" visible="false">

                                             <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indenter</asp:Label>
                                            <asp:DropDownList CssClass="form-control" ID="drpIndenter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIndenter_SelectedIndexChanged">
                                           
                                                <asp:ListItem Value=""> Select Indenter</asp:ListItem>
													<asp:ListItem Value="RRC"> RRC </asp:ListItem>
													<asp:ListItem Value="DCM"> DCM </asp:ListItem>

                                                 </asp:DropDownList>

                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="drpIndenter" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Indenter Missing"></asp:RequiredFieldValidator>

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
                                          
                                        </div>
                                    <%--    <div class="col-lg-12 col-md-12">
                                            <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Remarks/Action Description</asp:Label><br />
                                            <asp:TextBox CssClass="Upper-case" Width="100%" ID="txtRemarks" placeholder="Remarks" runat="server" Height="50px" TextMode="MultiLine"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtRemarks" ValidationGroup="AllocCeiling" runat="server" Display="None" ErrorMessage="Remarks Missing"></asp:RequiredFieldValidator>

                                     
                                        </div>--%>
                                    </div>

                                    <%--<div class="row" style="padding: 10px">
                                       
                                            <asp:Label ID="lblCompare" Style="color: red; font-weight: 700;" runat="server" Visible="false"></asp:Label>
                                       
                                    </div>--%>

                                    <div class="row" style="padding: 15px">
                                        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" ValidationGroup="AllocCeiling" runat="server" />
                                        <asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="AllocCeiling" Style="float: right; margin-top: 5px" Text="Save" ID="BtnSubSave" OnClick="BtnSubSave_Click" />
                                    </div>
                                </div>



                            </div>
                           
                        </div>
                    </asp:Panel>
                </div>
                
            </div>
        </div>

</asp:Content>


