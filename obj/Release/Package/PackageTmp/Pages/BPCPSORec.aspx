<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BPCPSORec.aspx.cs" Inherits="BMSWeb.Pages.BPCPSORec" %>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
	<style>
		.sweet-alert {
			width: 768px;
			min-width: 768px;
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
			text-align:center !important;
}
			.float-Right
			{
				float:right;
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
				text: "<pre>DESCRIPTION     : " + a + "" + "<br /><br />JUSTIFICATION   : " + b + "" + "<br /><br />REQUIRED AMOUNT : " + c + "     Million <br /><br /> </pre>" + $("#DivDetails").html(),
				//text: "<h4 style='color:black'>Description</h4><br /><p style='color:black'>" + a + "</p>" + "<br /><h4 style='color:black'>Justification</h4><br /><p style='color:black'>" + b + "</p>" + "<br /><h4 style='color:black'>Required Amount (Amount in Million)</h4><br /><p style='color:black'>" + c + "</p>" + $("#DivDetails").html(),
				html: true,
				showCancelButton: false,
				confirmButtonColor: "#DD6B55",

				closeOnConfirm: true,
				customClass: "swal-wide",

			});


		}
	</script>

	<script type="text/javascript">
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
	</script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


	<div class="row" id="main_form" runat="server">
		<div class="form-group" style="width: 1024px; margin-left: 17px; margin-top: 17px;">
			<section id="secMessage" runat="server"></section>
		</div>
		<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">

			<div class="col-lg-8 col-md-6">
				<h3 runat="server" style="color: #1D74D6; margin: 0px">Rec By Branch PSO - <span runat="server" id="yearlabel"></span></h3>
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
								<asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="currancy" runat="server" OnSelectedIndexChanged="currancy_SelectedIndexChanged">
									<%--	<asp:ListItem Value=""> Select Currency</asp:ListItem>--%>
									<asp:ListItem Value="F"> FE</asp:ListItem>
									<asp:ListItem Value="P"> Rs</asp:ListItem>
								</asp:DropDownList>
							</div>

							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
								<asp:DropDownList CssClass="form-control" ID="PURCHASE_TYPE" DataValueField="PURCHASE_CODE" DataTextField="PURCHASE_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="PURCHASE_TYPE_SelectedIndexChanged"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
								<asp:DropDownList CssClass="form-control" ID="UTILIZATION_MODE" DataValueField="UTILIZATION_CODE" DataTextField="UTILIZATION_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="UTILIZATION_MODE_SelectedIndexChanged"></asp:DropDownList>
							</div>



							<div id="TofDiv" runat="server" class="col-lg-4 col-md-4 buttom-margin padingRight1px">
								<asp:DropDownList CssClass="form-control" ID="TOF_Headsddl" DataValueField="HEAD_CODE" DataTextField="HEAD_DESC_LONG" runat="server" AutoPostBack="True"></asp:DropDownList>
							</div>

							<div id="TofAgnDiv" runat="server" class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
								<asp:DropDownList CssClass="form-control" ID="Tof_agencies" DataValueField="AGENCY_CODE" DataTextField="AGENCY_DECODE" runat="server" AutoPostBack="True"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px ">
								<asp:DropDownList CssClass="form-control" ID="LP_Headsddl" DataValueField="LP_HEAD_CODE" DataTextField="LP_HEAD_DECODE" runat="server" AutoPostBack="True" OnSelectedIndexChanged="LP_Headsddl_SelectedIndexChanged"></asp:DropDownList>
							</div>

							<div hidden class="col-lg-2 col-md-2 buttom-margin padingRight1px padingLeft1px">
								<asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="REQUIREMENT_TYPE" DataValueField="REQUIREMENT_CODE" DataTextField="REQUIREMENT_DECODE" runat="server" OnSelectedIndexChanged="REQUIREMENT_TYPE_SelectedIndexChanged"></asp:DropDownList>

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
			<div id="Div3" hidden runat="server" class="col-md-7 col-lg-7 padingLeft5px" style="margin-top: -27px;">

				<div class="col-lg-8 col-md-6">
					<h3 id="H4" runat="server" style="color: #1D74D6; margin: 0px">Summary</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H5" runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
				</div>

				<div runat="server" id="Div4" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px; top: 0px; left: 0px;">

					<div class="box-body" style="padding-top: 2px">
						
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

							<div id="gridContainer">

								<asp:GridView ID="GridEstimates" DataKeyNames="FY,DTE_SYMBOL1,SER_NO" AllowPaging="True" OnRowDataBound="GridEstimates_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridEstimates_RowCreated" OnRowCommand="GridEstimates_RowCommand" OnPageIndexChanging="GridEstimates_PageIndexChanging">
									<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
									<EditRowStyle BackColor="#2461BF" />
									<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
									<%--<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />--%>
									<AlternatingRowStyle BackColor="White" />
									<PagerStyle CssClass="pagination-ys" />

									<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
									<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
									<EmptyDataRowStyle BackColor="#EFF3FB" />

								

									<Columns>

										<%--<asp:BoundField DataField="SNO" HeaderText="SNO" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>--%>
										<asp:TemplateField>
											<HeaderTemplate>SNO</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" ID="srno" Text='<%#GetSerail((Container.DataItemIndex+1)+"<br>",Eval("UTILIZATION_MODE1"))%>' />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Description</HeaderTemplate>
											<ItemTemplate>
												<asp:Label ID="lblDescWithToolTip" runat="server" Text='<%#Eval("DESCRIPTION") %>' Visible="false"></asp:Label>
												<p style="white-space: nowrap; width: 350px; text-overflow: ellipsis; overflow: hidden;">
													<asp:LinkButton ID="btnDes"  Height="18px" CssClass="vertical-align-mid" Text='<%#Eval("DTE_SYMBOL2")+"==>"+Eval("DESCRIPTION") %>' runat="server"
														CommandName="viewDes" ToolTip='<%#Eval("DESCRIPTION") %>' CommandArgument='<%#GetCommandArgument(Eval("SER_NO"),Eval("DESCRIPTION"),Eval("JUSTIFICATION"),Eval("AMOUNT_DEMANDED_MIL"),Eval("DTE_SYMBOL2")) %>' />
												</p>
											</ItemTemplate>
										</asp:TemplateField>
										<%--<asp:BoundField DataField="DTE_SYMBOL2" HeaderText="Dte" ItemStyle-BackColor="#EFEFEF">
											<ItemStyle BackColor="#EFEFEF"></ItemStyle>
										</asp:BoundField>--%>
									
										<asp:TemplateField>
											<HeaderTemplate>WPN SYS</HeaderTemplate>
											<ItemTemplate>
												<asp:Label ID="lblWpnSys" runat="server" Text='<%#Eval("WEAPON_SYS") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>PDIB Status</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Text='<%#Eval("PDIB_STATUS_DECODE") %>'></asp:Label>
											</ItemTemplate>
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
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true"  ID="lblDEMANDED_LAST" runat="server" Text='<%#Eval("AMOUNT_DEMANDED_LAST_YEAR_MIL") %>'></asp:Label>
											</ItemTemplate>

										</asp:TemplateField>--%>
										<asp:TemplateField>
											<HeaderTemplate>Alloc</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true"  ID="lblAlloc_LAST" runat="server" Text='<%#Eval("AMOUNT_ALLOCATED_LAST_YEAR_MIL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lblAlloc_LASTTotal" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Curr Req</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true"  ID="lblALLOC" runat="server" Text='<%# Eval("AMOUNT_DEMANDED_MIL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>
										<%--<asp:CheckBoxField DataField="IS_FINALIZED" SortExpression="IS_FINALIZED" />--%>
										<asp:TemplateField HeaderText="Rec By PSO">
											<ItemTemplate>
												<asp:TextBox ID="txtNewAMt"  AutoCompleteType="None" Font-Bold="true" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" AutoPostBack="true" runat="server"  Width="60px" Height="25px" Text='<%# DataBinder.Eval(Container.DataItem, "AMOUNT_REC_PSO") %>' OnTextChanged="txtNewAMt_TextChanged"></asp:TextBox>
											</ItemTemplate>
										</asp:TemplateField>
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
									

										<asp:TemplateField>
											<HeaderTemplate>Justification</HeaderTemplate>

											<ItemTemplate>
												<asp:Label ID="lblJustWithToolTip" runat="server" Text='<%#Eval("JUSTIFICATION") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>View Detail</HeaderTemplate>

											<ItemTemplate>
												<asp:ImageButton ID="ImgBtndetail" CssClass="vertical-align-mid" ImageUrl="../assets/images/1489743555_disk.png" Height="20" runat="server"
													CommandName="ViewDetail1" ToolTip="View Detail" CommandArgument='<%#GetCommandArgument(Eval("SER_NO"),Eval("DESCRIPTION"),Eval("JUSTIFICATION"),Eval("AMOUNT_DEMANDED_MIL"),Eval("DTE_SYMBOL2")) %>' />


											</ItemTemplate>
												<ItemStyle HorizontalAlign="Center" />
										</asp:TemplateField>
									
									</Columns>

									<EmptyDataTemplate>
										<p align="center"><strong>No Record Found</strong></p>
									</EmptyDataTemplate>

								</asp:GridView>




							</div>
							<div class="col-lg-12 col-md-12" style="text-align: right; padding-right: 5px">
								<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Visible="false" Style="margin-top: 5px; padding-right: 5px" Text="Save" ID="BtnSave" OnClick="BtnSave_Click1" />
								<%--<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Style="margin-top: 5px" Text="Reset" ID="BtnReset" OnClick="BtnReset_Click1" />--%>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%--other grid--%>

			<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;" id="DivDetails" hidden>
				<div id="Div1" visible="false" runat="server" class="col-md-12 col-lg-12 padingLeft5px" > 
					<div class="col-lg-12 col-md-12" style="text-align:center">
						<h3 id="H2" runat="server" style="color: #1D74D6; margin: 0px;">Description Detail</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h4 id="H3" runat="server" style="color: #1D74D6; margin: 0px"></h4>
					</div>

					<div runat="server" id="Div2" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px" >

						<div class="box-body">

							<div id="gridContainer2" style="overflow: auto; max-height: 370px;">


								<asp:GridView ID="GridViewEstDetail" Font-Size="12px" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowCreated="GridViewEstDetail_RowCreated">
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
													<asp:Label Text="" runat="server" />
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
											<HeaderTemplate>U I</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Text='<%#Eval("UNIT_OF_ISSUE") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Price</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span" ID="lbl_PO_NO" runat="server" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
												</div>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Qty</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("QTY") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label CssClass="text-Align-span" ID="PRICE_PER_UNIT" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Net Dem</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("NET_DEMANDED") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label CssClass="text-Align-span" ID="V_NET_DEMANDEDa" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>Auth</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("QTY_AUTH") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label CssClass="text-Align-span" ID="ds" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Hold</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("HOLD_QTY") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label CssClass="text-Align-span" ID="dasd" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>


									</Columns>
									<EmptyDataTemplate>
										<p align="center"><strong>No Record Found</strong></p>
									</EmptyDataTemplate>

								</asp:GridView>




							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</asp:Content>
