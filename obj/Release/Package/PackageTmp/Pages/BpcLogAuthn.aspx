<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BpcLogAuthn.aspx.cs" Inherits="BMSWeb.Pages.BpcLogAuthn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
	<style>
		.sweet-alert {
			width: 768px;
			min-width: 768px;
		}

		.text-Align1 {
			text-align: center;
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
	<%--<script type="text/javascript" lang="javascript">
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
	</script>--%>

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

			<div class="col-lg-12 col-md-12">
				<h3 runat="server" style="color: #1D74D6; margin: 0px">Authentication By Log Branch - <span runat="server" id="yearlabel"></span></h3>
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
													<asp:LinkButton ID="btnDes" ForeColor="#333" Height="18px" CssClass="vertical-align-mid" Text='<%#Eval("DTE_SYMBOL1")+"==>"+Eval("DESCRIPTION") %>' runat="server"
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
												<asp:Label ID="lblWpnSys" Font-Bold="true" runat="server" Text='<%#Eval("WEAPON_SYS") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<%--<asp:TemplateField>
											<HeaderTemplate>PDIB Status</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Font-Bold="true" Text='<%#Eval("PDIB_STATUS_DECODE") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>--%>
										<%--<asp:TemplateField>
											<HeaderTemplate>Priority</HeaderTemplate>
											<ItemTemplate>
												<asp:Label runat="server" Text='<%#Eval("PRIORITY") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>--%>
										<%--<asp:TemplateField>
											<HeaderTemplate>Dem</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="lblDEMANDED_LAST" runat="server" Text='<%#Eval("AMOUNT_DEMANDED_LAST_YEAR_MIL") %>'></asp:Label>
											</ItemTemplate>

										</asp:TemplateField>--%>
										<%--<asp:TemplateField>
											<HeaderTemplate>Alloc</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="lblAlloc_LAST" runat="server" Text='<%#Eval("AMOUNT_ALLOCATED_LAST_YEAR_MIL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lblAlloc_LASTTotal" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>--%>
										<asp:TemplateField>
											<HeaderTemplate>Req</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="lblALLOC" runat="server" Text='<%# Eval("AMOUNT_DEMANDED_MIL") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="lblAllocTotal" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>
										<%--<asp:TemplateField>
											<HeaderTemplate>Rec By PSO</HeaderTemplate>
											<ItemTemplate>
												<asp:Label CssClass="text-Align-span float-Right" Font-Bold="true" ID="lblALLOoC" runat="server" Text='<%# Eval("PROV_AMOUNT_REC_PSO") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label ID="df" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>--%>
										<%--<asp:CheckBoxField DataField="IS_FINALIZED" SortExpression="IS_FINALIZED" />--%>
										<%--<asp:TemplateField HeaderText="Rec By DCAS(Supp)">
											<ItemTemplate>
												<asp:TextBox ID="txtNewAMt" Font-Bold="true" AutoCompleteType="None" CssClass="text-Align float-Right" onkeypress="return onlyNumbers();" AutoPostBack="true" runat="server" Width="60px" Height="25px" Text='<%# DataBinder.Eval(Container.DataItem, "AMOUNT_REC_DCAS_EL") %>' OnTextChanged="txtNewAMt_TextChanged"></asp:TextBox>
											</ItemTemplate>
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


										<asp:TemplateField>
											<HeaderTemplate>Justification</HeaderTemplate>

											<ItemTemplate>
												<asp:Label ID="lblJustWithToolTip" Font-Bold="true" runat="server" Text='<%#Eval("JUSTIFICATION") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>View Detail</HeaderTemplate>

											<ItemTemplate>

												<asp:ImageButton ID="ImgBtndetail" CssClass="vertical-align-mid" ImageUrl="../assets/images/1489743555_disk.png" Height="20px" runat="server"
													CommandName="ViewDetail1" CommandArgument='<%#GetCommandArgument(Eval("SER_NO"),Eval("DESCRIPTION"),Eval("JUSTIFICATION"),Eval("AMOUNT_DEMANDED_MIL"),Eval("DTE_SYMBOL2")) %>' />


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
								<%--<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Style="margin-top: 5px; padding-right: 5px" Text="Save" ID="BtnSave" Visible="false" OnClick="BtnSave_Click1" />--%>
								<%--<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Style="margin-top: 5px" Text="Reset" ID="BtnReset" OnClick="BtnReset_Click1" />--%>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%--other grid--%>

			<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;" id="DivDetails">
				<div id="Div1" visible="false" runat="server" class="col-md-12 col-lg-12 padingLeft5px">
					<div class="col-lg-12 col-md-12" style="text-align: left">
						<h3 id="H2" runat="server" style="color: #1D74D6; margin: 0px;">Description Detail</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h4 id="H3" runat="server" style="color: #1D74D6; margin: 0px"></h4>
					</div>

					<div runat="server" id="Div2" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px">

						<div class="box-body">

							<div id="gridContainer2" style="overflow: auto; max-height: 370px;">


								<asp:GridView ID="GridViewEstDetail" DataKeyNames="FY,PARTS_NO_NSN,NOMENCLATURE,DTE_CODE,PRICE_PER_UNIT,QTY_AUTH,HOLD_QTY" Font-Size="12px" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowCreated="GridViewEstDetail_RowCreated" OnRowCommand="GridViewEstDetail_RowCommand" OnRowDataBound="GridViewEstDetail_RowDataBound">
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
												<asp:Label CssClass="text-Align-span" ID="NetDmdHover" runat="server" Text='<%#Eval("NET_DEMANDED") %>'></asp:Label>
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
												<asp:Label runat="server" Text='<%#Eval("QTY_AUTH") %>'></asp:Label>
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
												<asp:Label runat="server" Text='<%#Eval("HOLD_QTY") %>'></asp:Label>
											</ItemTemplate>
											<FooterTemplate>
												<div style="padding: 0 0 5px 0">
													<asp:Label CssClass="text-Align-span" ID="dasd" runat="server" />
												</div>
											</FooterTemplate>
										</asp:TemplateField>

										<asp:TemplateField HeaderText="Log Authenticate">
											<ItemTemplate>

												<asp:ImageButton ID="ImgBtnLogAuth" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732623_application_view_detail.png" runat="server"
													CommandName="LogAuth" ToolTip="Log Authenticate" CommandArgument='<%#Eval("SER_NO") %>' />

											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />
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


			<div id="SubFoamDiv" runat="server" class="col-md-5 col-lg-5 padingRight5px">
				<h3 id="desHEading" runat="server" style="color: #1D74D6; margin: 0px">Part No Detail</h3>
				<asp:Panel runat="server" ID="Sub_foamPanal">
					<div runat="server" id="Sub_foam" class="box box-primary">
						<div class="box-body">
							<div class="row">
								<div class="col-lg-12 buttom-margin" style="padding-left: 0px; padding-right: 0px">

									<div class="col-lg-4 col-md-4">
										<div>
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Part No</asp:Label>
										</div>
										<div>
											<asp:TextBox Visible="false" ID="FYLOg" runat="server"></asp:TextBox>
											<asp:TextBox Visible="false" ID="DteLOg" runat="server"></asp:TextBox>
											<asp:TextBox Visible="false" ID="SerNoLog" runat="server"></asp:TextBox>
											<asp:TextBox Width="100%" ID="PartNoLog" CssClass="Upper-case" Enabled="false" ToolTip="" placeholder="Part No" AutoComplete="Off" runat="server"></asp:TextBox>
										</div>
									</div>

									<div class="col-lg-4 col-md-4">
										<div>
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Nomenclature</asp:Label>
										</div>
										<div>
											<asp:TextBox Width="100%" ID="NomenclatureLog" CssClass="Upper-case" Enabled="false" ToolTip="" placeholder="Nomenclature" AutoComplete="Off" runat="server"></asp:TextBox>
										</div>
									</div>
									<div class="col-lg-4 col-md-4">
										<div>
											<%--<asp:Button runat="server" ID="SearchPartNo" OnClick="SearchPartNo_Click" Style="margin-top: 15px; display: none" Text="Search" CssClass="btn btn-sm btn-primary" />--%>
										</div>
									</div>

								</div>

								<div class="col-lg-12 buttom-margin" style="padding-left: 0px; padding-right: 0px">

									<div class="row" style="margin-left: 0px; margin-right: 0px">
										<div class="col-lg-4 col-md-4">
											<div>
												<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Auth By</asp:Label>
											</div>
											<div>
												<asp:DropDownList CssClass="form-control" ID="AuthByLog" runat="server" AutoPostBack="True">
													<asp:ListItem Value=""> Select Auth By</asp:ListItem>
													<asp:ListItem Value="Scaling"> Scaling</asp:ListItem>
													<asp:ListItem Value="TOE"> TO & E</asp:ListItem>
													<asp:ListItem Value="UAL"> UAL</asp:ListItem>
													<asp:ListItem Value="Definization"> Definization/Others</asp:ListItem>
												</asp:DropDownList>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="AuthByLog" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Auth By Log Missing"></asp:RequiredFieldValidator>--%>
											</div>
										</div>
										<div class="col-lg-4 col-md-4">
											<div>
												<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Auth Reference</asp:Label>
											</div>
											<div>
												<asp:DropDownList CssClass="form-control" OnSelectedIndexChanged="AuthRefLog_SelectedIndexChanged" ID="AuthRefLog" runat="server" AutoPostBack="True">
													<asp:ListItem Value=""> Select Auth Ref</asp:ListItem>
													<asp:ListItem Value="AFI"> AFI/Govt Letter</asp:ListItem>
													<asp:ListItem Value="UP"> Under Process</asp:ListItem>
													<asp:ListItem Value="Initiated"> To Be Initiated </asp:ListItem>

												</asp:DropDownList>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="AuthRefLog" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Auth Ref Missing"></asp:RequiredFieldValidator>--%>
											</div>
										</div>
										<div class="col-lg-4 col-md-4">
											<div>
												<asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="LPRReflbl" runat="server">LPR Ref</asp:Label>
											</div>

											<div>
												<asp:TextBox ID="LPRRefLog" placeholder="LPR Ref" AutoComplete="Off" runat="server"></asp:TextBox>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="LPRRefLog" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="LPR Ref Missing"></asp:RequiredFieldValidator>--%>
											</div>
										</div>


									</div>
									<div class="row" style="margin-left: 0px; margin-right: 0px">
										<div class="col-lg-4 col-md-4">
											<div>
												<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">LPR</asp:Label>
											</div>

											<div>
												<asp:TextBox ID="LPRLog" onkeypress="return onlyNumbers();" placeholder="LPR" AutoComplete="Off" runat="server"></asp:TextBox>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="LPRLog" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="LPR Missing"></asp:RequiredFieldValidator>--%>
											</div>
										</div>
										<div class="col-lg-4 col-md-4">
											<div>
												<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">LPR Year</asp:Label>
											</div>

											<div>
												<asp:TextBox ID="LPRYearLog" onkeypress="return onlyNumbers();" placeholder="LPR Year" AutoComplete="Off" runat="server"></asp:TextBox>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="LPRYearLog" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="LPRYearLog Missing"></asp:RequiredFieldValidator>--%>
											</div>
										</div>
										<div class="col-lg-4 col-md-4">
											<div>
												<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">LPR Mode</asp:Label>
											</div>

											<div>
												<asp:DropDownList CssClass="form-control" ID="LPRModeddl" OnSelectedIndexChanged="LPRModeddl_SelectedIndexChanged" runat="server" AutoPostBack="True">
													<asp:ListItem Value=""> Select LPR Mode</asp:ListItem>
													<asp:ListItem Value="C"> OTC</asp:ListItem>
													<asp:ListItem Value="R"> RRC</asp:ListItem>
													<asp:ListItem Value="L"> LP </asp:ListItem>

												</asp:DropDownList>
												<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="LPRModeddl" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="LPR Mode Missing"></asp:RequiredFieldValidator>--%>
											</div>
										</div>


									</div>
									<div class="col-lg-12 col-md-12">
										<div>
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="LPRRefDetaillbl" runat="server">Ref Detail</asp:Label>
										</div>

										<div>
											<asp:TextBox Width="100%" ID="LPRRefDetail" placeholder="LPR Ref Detail" AutoComplete="Off" Height="50px" TextMode="MultiLine" runat="server"></asp:TextBox>
											<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="LPRRefDetail" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="LPR Ref Detail Missing"></asp:RequiredFieldValidator>--%>
										</div>
									</div>
								</div>
							</div>

							<div class="row buttom-margin">
								<fieldset class="fieldset1 buttom-margin" style="margin-left: 15px; margin-right: 15px;">
									<legend id="ReqLegend1" style="margin-bottom: 0px !important; color: #3C8DBC; font-weight: 700; font-size: 14px">Definitize Asset Details</legend>
									<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
										<div class="col-lg-4 col-md-12 col-sm-12" style="padding: 0px">
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Auth Asset</asp:Label>
										</div>
										<div class="col-lg-8 col-md-12 col-sm-12" style="padding: 0px">
											<asp:TextBox Width="100px" ID="AuthAsset" placeholder="Auth Asset" CssClass="text-Align" onkeypress="return onlyNumbers();" AutoComplete="Off" runat="server"></asp:TextBox>
											<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator256" ControlToValidate="AuthAsset" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Auth Asset Missing"></asp:RequiredFieldValidator>--%>
										</div>
									</div>

									<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
										<div class="col-lg-4 col-md-12 col-sm-12" style="padding: 0px">
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Holding</asp:Label>
										</div>
										<div class="col-lg-8 col-md-12 col-sm-12" style="padding: 0px">
											<asp:TextBox Width="100px" ID="Holding" placeholder="Holding" CssClass="text-Align" onkeypress="return onlyNumbers();" AutoComplete="Off" runat="server"></asp:TextBox>
											<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator27" ControlToValidate="Holding" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Holding Missing"></asp:RequiredFieldValidator>--%>
										</div>
									</div>
									<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
										<div class="col-lg-4 col-md-12 col-sm-12" style="padding: 0px">
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Due In</asp:Label>
										</div>
										<div class="col-lg-8 col-md-12 col-sm-12" style="padding: 0px">
											<asp:TextBox Width="100px" ID="DueInLog" placeholder="Due In" CssClass="text-Align" onkeypress="return onlyNumbers();" AutoComplete="Off" runat="server"></asp:TextBox>
											<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DueInLog" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Due In Missing"></asp:RequiredFieldValidator>--%>
										</div>
									</div>

									<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
										<div class="col-lg-4 col-md-12 col-sm-12" style="padding: 0px">
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Service Able</asp:Label>
										</div>
										<div class="col-lg-8 col-md-12 col-sm-12" style="padding: 0px">
											<asp:TextBox Width="100px" ID="ServiceAble" placeholder="Service Able" CssClass="text-Align" onkeypress="return onlyNumbers();" AutoComplete="Off" runat="server"></asp:TextBox>
											<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="ServiceAble" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="Service Able Missing"></asp:RequiredFieldValidator>--%>
										</div>
									</div>
									<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
										<div class="col-lg-4 col-md-12 col-sm-12" style="padding: 0px">
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">DIFM</asp:Label>
										</div>
										<div class="col-lg-4 col-md-12 col-sm-12" style="padding: 0px">
											<asp:TextBox Width="100px" ID="DIFM" placeholder="DIFM" CssClass="text-Align" onkeypress="return onlyNumbers();" AutoComplete="Off" runat="server"></asp:TextBox>
											<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="DIFM" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="DIFM In Missing"></asp:RequiredFieldValidator>--%>
										</div>
									</div>
									<div class="col-lg-6 col-md-12 col-sm-12" style="padding-top: 2px">
										<div class="col-lg-4 col-md-12 col-sm-12" style="padding: 0px">
											<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">DIFR</asp:Label>
										</div>
										<div class="col-lg-4 col-md-12 col-sm-12" style="padding: 0px">
											<asp:TextBox Width="100px" ID="DIFR" placeholder="DIFR" CssClass="text-Align" onkeypress="return onlyNumbers();" AutoComplete="Off" runat="server"></asp:TextBox>
											<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="DIFR" ValidationGroup="DetailAddEst" runat="server" Display="None" ErrorMessage="DIFR Missing"></asp:RequiredFieldValidator>--%>
										</div>
									</div>

								</fieldset>

							</div>

						</div>
						<asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" ValidationGroup="DetailAddEst" runat="server" />
						<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="DetailAddEst" Style="float: right; margin-top: 5px" Text="Authenticated" ID="BtnSubSave" OnClick="BtnSubSave_Click" />
						<%--<asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="DetailAddEst" Style="float: right; margin-top: 5px" Text="Update Item/Part No" ID="BtnUpdate1" OnClick="BtnUpdate1_Click" />--%>
					</div>
				</asp:Panel>
			</div>

			<div id="SubFormGrid" runat="server" class="col-md-7 col-lg-7 padingLeft5px">

				<div class="col-lg-8 col-md-6">
					<h3 id="H6" runat="server" style="color: #1D74D6; margin: 0px">Description Detail</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H7" runat="server" style="color: #1D74D6; margin: 0px">(Amount in $/Rs)</h4>
				</div>
				<div class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px" runat="server" id="Div5">

					<div class="box-body" style="height: 245px; overflow: auto">
						<asp:GridView ID="GridBPC_detail" DataKeyNames="PARTS_NO_NSN,DTE_CODE,FY" OnRowCommand="GridBPC_detail_RowCommand" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDeleting="GridBPC_detail_RowDeleting" OnRowDataBound="GridBPC_detail_RowDataBound">
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
									<HeaderTemplate>Auth By</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("AUTH_BY_CODE") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0;">
											<asp:Label Text="" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>


								<asp:TemplateField>
									<HeaderTemplate>Auth Ref No</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="lbl_NOMENCLATURE1" runat="server" Text='<%#Eval("AUTH_REF_NO") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
										</div>
									</FooterTemplate>
								</asp:TemplateField>

								<asp:TemplateField>
									<HeaderTemplate>LPR Ref</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("LPR_REF") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0;">
											<asp:Label Text="" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>LPR</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("LPR") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>LPR Year</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="lbl_PO_NO" runat="server" Text='<%#Eval("LPR_YEAR") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<%--<asp:TemplateField>
								<HeaderTemplate>LPR Mode</HeaderTemplate>
								<ItemTemplate>
									<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("LPR_MODE") %>'></asp:Label>
								</ItemTemplate>
								<FooterTemplate>
									<div style="padding: 0 0 5px 0">
										<asp:Label CssClass="text-Align-span" ID="PRICE_PER_UNIT" runat="server" />
									</div>
								</FooterTemplate>
							</asp:TemplateField>--%>
								<asp:TemplateField>
									<HeaderTemplate>LPR Mode</HeaderTemplate>
									<ItemTemplate>
										<asp:Label CssClass="text-Align1" runat="server" Text='<%#Eval("UTILIZATION_MODE") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label ID="V_NET_DEMANDEDa" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>


								<asp:TemplateField>
									<HeaderTemplate>Auth Qty</HeaderTemplate>
									<ItemTemplate>
										<asp:Label ID="lbl_NOMENCLATUR1E" runat="server" Text='<%#Eval("QTY_AUTH") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
										</div>
									</FooterTemplate>
								</asp:TemplateField>


								<asp:TemplateField>
									<HeaderTemplate>Holding Qty</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("HOLD_QTY") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
									</FooterTemplate>
								</asp:TemplateField>

								<asp:TemplateField>
									<HeaderTemplate>Dues In</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("DUES_IN") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label ID="PRICE_PER_UNIT" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>

								<asp:TemplateField>
									<HeaderTemplate>S/A</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("SA") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label ID="PRICE_PER_UNIT" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>DIFM</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("DIFM") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label ID="PRICE_PER_UNIT" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>DIFR</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" Text='<%#Eval("DIFR") %>'></asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<div style="padding: 0 0 5px 0">
											<asp:Label ID="PRICE_PER_UNIT" runat="server" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Delete">
									<ItemTemplate>
										<asp:ImageButton ID="ImgBtndel2" CssClass="vertical-align-mid" ImageUrl="~/Content/img/1479732554_trash.png" runat="server"
											CommandName="delete" ToolTip="Delete" CommandArgument='<%#Eval("SER_NO") %>' />
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Center" />
								</asp:TemplateField>

							</Columns>


						</asp:GridView>
					</div>
				</div>

			</div>
		</div>

	</div>

</asp:Content>
