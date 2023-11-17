<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtIndentDataEntry.aspx.cs" Inherits="BMSWeb.Pages.Indent.BgtIndentDataEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
	<style>
		th {
			text-align: center;
		}
	</style>
	<script>
		function QtyDemandedExceded() {
			swal({
				title: "Error!",
				text: "Quantity exceeded then Quantity Demanded.",
				type: "error",
				confirmButtonColor: "rgb(53, 155, 255)"
			});
		}
		function AmtDemandedExceded() {
			swal({
				title: "Error!",
				text: "Amount exceeded then Amount Demanded.",
				type: "error",
				confirmButtonColor: "rgb(53, 155, 255)"
			});
		}
		function AmtBacRecExceded() {
			swal({
				title: "Error!",
				text: "Amount exceeded then Amount BPC Allocated.",
				type: "error",
				confirmButtonColor: "rgb(53, 155, 255)"
			});
		}
		function a() {
			$('tbody').scroll(function (e) {
				alert('');//detect a scroll event on the tbody
				$('#MainContent_GridIndentEntry thead').css("left", -$("#MainContent_GridIndentEntry tbody").scrollLeft()); //fix the thead relative to the body scrolling
				$('#MainContent_GridIndentEntry thead th:nth-child(1)').css("left", $("#MainContent_GridIndentEntry tbody").scrollLeft()); //fix the first cell of the header
				$('#MainContent_GridIndentEntry tbody td:nth-child(1)').css("left", $("#MainContent_GridIndentEntry tbody").scrollLeft()); //fix the first column of tdbody
			});
		}
	</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row" id="main_form" runat="server">

		<div class="col-md-12 col-lg-12 col-sm-12 padingRight5px" style="padding-left: 11px;">

			<div class="col-lg-12 col-md-12 col-sm-12">
				<h3 runat="server" style="color: #00369E; margin: 0px">Indent Data Entry</h3>
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
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin  padingLeft1px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indent No</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="IndentNoddl" DataTextField="INDENT_NO" DataValueField="INDENT_NO" runat="server" OnDataBound="IndentNoddl_DataBound" OnSelectedIndexChanged="IndentNoddl_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

							</div>
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">User Indent No</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="IndentNoddlUser" DataTextField="INDENT_NO" DataValueField="INDENT_NO" runat="server" OnDataBound="IndentNoddlUser_DataBound" OnSelectedIndexChanged="IndentNoddlUser_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="IndentNoddlUser" ValidationGroup="grp_indent" runat="server" Display="None" ErrorMessage="User Indent No Missing"></asp:RequiredFieldValidator>
							</div>
							</div>
					</div>

				</div>
				<br />

				<h4 runat="server" style="color: #00369E; margin: 0px; padding-left: 12px;">For New Indent or Updation of Existing Indent No's</h4>
				<asp:Panel runat="server" ID="IndentDataPanal">
					<div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

						<div class="box-body" style="padding-bottom: 2px;">

							<div class="row">

								<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indent No</asp:Label><br />
									<asp:TextBox runat="server" AutoCompleteType="None" CssClass="form-control" ID="txtIndentNo"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtIndentNo" ValidationGroup="grp_indent" runat="server" Display="None" ErrorMessage="Indent No Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingLeft1px padingRight1px">
									<br />
									<asp:Button Visible="false" runat="server" CssClass="btn btn-primary btn-sm" ID="indentSearch" Text="Search" OnClick="indentSearch_Click" />
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin  padingLeft1px">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indent Date</asp:Label><br />
									<asp:TextBox AutoCompleteType="None" ID="txtIndentDate" runat="server" Width="55%" placeholder="Indent Date" CssClass=" input-sm datepicker inline form-control"></asp:TextBox>
									<span style="background: #00369E;" class=" form-control inline">
										<i style="color: #FFF;" class="fa fa-calendar"></i>
									</span>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtIndentDate" ValidationGroup="grp_indent" runat="server" Display="None" ErrorMessage="Indent Date Missing"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indent Amount</asp:Label><br />
									<asp:TextBox AutoCompleteType="None" runat="server" Enabled="false" CssClass="form-control" onkeypress="return onlyNumbers();" ID="txtIndentAmt"></asp:TextBox>
									<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtIndentAmt" ValidationGroup="grp_indent" runat="server" Display="None" ErrorMessage="Indent Amount Missing"></asp:RequiredFieldValidator>--%>
								</div>

								<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px padingLeft1px">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indentor</asp:Label><br />
									<asp:TextBox AutoCompleteType="None" runat="server" CssClass="form-control" ID="txtIndentor"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtIndentor" ValidationGroup="grp_indent" runat="server" Display="None" ErrorMessage="Indentor Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin  padingLeft1px">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indent Type</asp:Label><br />
									<asp:DropDownList CssClass="form-control" ID="IndentTypeddl" runat="server" AutoPostBack="true">
										<asp:ListItem Value=""> Select Indent Type</asp:ListItem>
										<asp:ListItem Value="Priorty"> Priority</asp:ListItem>
										<asp:ListItem Value="Normal"> Normal</asp:ListItem>
										<asp:ListItem Value="Emergent"> Emergent</asp:ListItem>
										<asp:ListItem Value="Proprietary"> Proprietary</asp:ListItem>
									</asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="IndentTypeddl" ValidationGroup="grp_indent" runat="server" Display="None" ErrorMessage="Indent Type Missing"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 buttom-margin">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">MAG Code</asp:Label><br />
									<asp:DropDownList CssClass="form-control" ID="MAGCodeddl" DataTextField="HEAD_DESCRIPTION" DataValueField="HEAD_CODE" runat="server" OnDataBound="MAGCodeddl_DataBound" AutoPostBack="true"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="MAGCodeddl" ValidationGroup="grp_indent" runat="server" Display="None" ErrorMessage="MAG Missing"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">PC No</asp:Label><br />
									<asp:TextBox AutoCompleteType="None" runat="server" CssClass="form-control" ID="txtPCNo"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtPCNo" ValidationGroup="grp_indent" runat="server" Display="None" ErrorMessage="PC No Missing"></asp:RequiredFieldValidator>
								</div>

								<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px padingLeft1px">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">PC Rxd Date</asp:Label><br />
									<asp:TextBox AutoCompleteType="None" ID="txtPCRxdDate" runat="server" Width="55%" placeholder="PC Date" CssClass=" input-sm datepicker inline form-control"></asp:TextBox>
									<span style="background: #00369E;" class=" form-control inline">
										<i style="color: #FFF;" class="fa fa-calendar"></i>
									</span>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtPCRxdDate" ValidationGroup="grp_indent" runat="server" Display="None" ErrorMessage="PC Rxd Date Missing"></asp:RequiredFieldValidator>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin  padingLeft1px">
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-0 buttom-margin padingRight1px">
								</div>

								<div class="col-lg-8 col-md-8 col-sm-12 buttom-margin padingLeft1px" style="text-align: right">
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Indent Item" ValidationGroup="grp_indent" ID="btnIndentItem" OnClick="btnIndentItem_Click" />
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Delete" ID="btnDelete" />
									<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Reset" ID="btnReset" />
								</div>
								<div class="col-lg-12 col-md-12">
									<asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" ValidationGroup="grp_indent" runat="server" />
								</div>
							</div>

						</div>

					</div>
				</asp:Panel>
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
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Net Alloc Amt</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtNetAllocAmt"></asp:TextBox>
								</td>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Rev Ind Amt</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtRevIndAmt"></asp:TextBox>
								</td>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Initial Bal</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtInitBal"></asp:TextBox>
								</td>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Revised Bal</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtRevisedBal"></asp:TextBox>
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
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h4 id="H1" runat="server" style="color: #00369E; margin: 0px">Existing Indent Detail of Selected BAC No</h4>
				</div>
				<div runat="server" id="Div1" class="box box-info col-lg-12 col-md-12 col-sm-12" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px; top: 0px; left: 0px;">
					<div class="box-body" style="padding-top: 2px">
						<table class="col-lg-12 col-md-12 col-sm-12" style="padding: 0px">
							<tr>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indented Date</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtIndentedDate"></asp:TextBox>
								</td>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Initial Amt</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtInitialAmt"></asp:TextBox>
								</td>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Revised Amt</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtRevisedAmt"></asp:TextBox>
								</td>
								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Bgt Approved Amt</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtBgtApprovedAmt"></asp:TextBox>
								</td>
							</tr>
							<tr>

								<td class="col-lg-3 col-md-3 col-sm-3">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Log Approved Amt</asp:Label><br />
									<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txtLogApprovedAmt"></asp:TextBox>

								</td>
								<td colspan="2" style="padding-left: 15px;">
									<asp:Label Style="color: #00369E; font-weight: 700;" runat="server"></asp:Label><br />
									<asp:Button runat="server" Enabled="false" CssClass="btn btn-primary btn-sm" Text="Printing" ID="PrintingIndent" OnClick="PrintingIndent_Click" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-12 col-lg-12 col-sm-12 padingRight5px" style="padding-left: 11px;" visible="false" id="SubDetails" runat="server">
			<div id="GridDiv" runat="server" class="col-md-12 col-lg-12 col-sm-12 padingLeft5px">
				<div class="col-lg-8 col-md-6 col-sm-6">
					<h3 id="TReq" runat="server" style="color: #00369E; margin: 0px">BAC Detail</h3>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H2" runat="server" style="color: #00369E; margin: 0px">(Amount in Million)</h4>
				</div>

				<div runat="server" id="MainDetails" class="box box-info col-lg-12 col-md-12 col-sm-12" style="padding-left: 0px; padding-right: 0px">

					<div class="box-body">
						<div class="row">
							<div style="width: 100%">

								<div class="col-lg-12 col-md-12 col-sm-12">
									<div id="gridContainer1" style="font-family: Arial; font-size: 12px; color: black; overflow-y: hidden">
										<asp:GridView ID="GridIndentEntry" DataKeyNames="" OnRowDataBound="GridIndentEntry_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridIndentEntry_RowCreated" OnRowCommand="GridIndentEntry_RowCommand">
											<FooterStyle BackColor="#499BEA" Font-Bold="True" ForeColor="White" />

											<EditRowStyle BackColor="#2461BF" />
											<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
											<AlternatingRowStyle BackColor="White" />
											<PagerStyle CssClass="pagination-ys" />
											<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
											<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked test" BackColor="#00369E" Font-Bold="True" ForeColor="White" />
											<EmptyDataRowStyle BackColor="#EFF3FB" />

											<Columns>
												<asp:TemplateField Visible="false">
													<HeaderTemplate>SNO</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" ID="SerNo" BackColor="#499BEA" runat="server" Text='<%#Eval("ITEM_NO") %>'></asp:Label>
													</ItemTemplate>
												</asp:TemplateField>
													<asp:TemplateField Visible="false">
													<HeaderTemplate>Move Back</HeaderTemplate>
													<ItemTemplate>
														<%--<asp:TextBox runat="server" CssClass="hidden" ID="HiddenQuery" Text='<%#Eval("SER_NO")+"~"+Eval("REC_NO") %>'></asp:TextBox>--%>
														<%--<asp:CheckBox ID="MoveBackGrid" AutoPostBack="true" runat="server" />--%>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Part No</HeaderTemplate>
													<ItemTemplate>
														<%--<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>--%>
														<asp:TextBox ID="txtPartNo" Enabled="false" runat="server" Height="18px" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="120px" />
													<FooterTemplate>
														<asp:Label Font-Bold="true" Text="Total" runat="server"></asp:Label>
													</FooterTemplate>
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Nomenclature</HeaderTemplate>
													<ItemTemplate>
														<%--<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("NOMENCLATURE") %>'></asp:Label>--%>
														<asp:TextBox ID="txtNomenclature" Enabled="false" runat="server" Height="18px" Text='<%#Eval("DESC_OF_STORE") %>'></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="150px" Wrap="false" />
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Qty</HeaderTemplate>
													<ItemTemplate>
														<%--<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("QTY") %>'></asp:Label>--%>
														<asp:TextBox ID="txtQuantity"   AutoPostBack="true"  runat="server" Width="60px" Height="18px" Text='<%#Eval("QUANTITY_REQUIRED") %>'></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Price Per Unit</HeaderTemplate>
													<ItemTemplate>
														<asp:TextBox ID="txtPricePerUnit"  AutoPostBack="true"  runat="server" Width="60px" Height="18px" Text='<%#Eval("RATE_PER_UNIT") %>'></asp:TextBox>
														<%--<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:Label>--%>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<asp:TemplateField Visible="false">
													<HeaderTemplate>Amt Dem</HeaderTemplate>
													<ItemTemplate>
														
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Specification">
													<ItemTemplate>
														<asp:TextBox ID="txtSpecification" Text='<%#Eval("SPECIFICATION") %>' runat="server" Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="100px" />
												</asp:TemplateField>
												<asp:TemplateField HeaderText="No of Year">
													<ItemTemplate>
														<asp:TextBox ID="txtNoYear" onkeypress="return onlyNumbers();" Text='<%#Eval("NO_OF_YEAR") %>' AutoPostBack="true" runat="server" OnTextChanged="Calculate_ESTIMATE_PURCHASE_RATE" Width="60px" Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<asp:TemplateField HeaderText="Esc Charges %">
													<ItemTemplate>
														<asp:TextBox ID="txtEscCharges" onkeypress="return onlyNumbers();" Text='<%#Eval("ESCALATION_CHARGES_PERCENTAGE") %>' runat="server" OnTextChanged="Calculate_ESTIMATE_PURCHASE_RATE" AutoPostBack="true" Width="60px" Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<%--8--%><asp:TemplateField HeaderText="Est Pur Rate">
													<ItemTemplate>
														<asp:TextBox ID="txtEstPurRate" onkeypress="return onlyNumbers();" Text='<%#Eval("ESTIMATE_PURCHASE_RATE") %>' Width="60px" runat="server" Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>

												<%--9--%><asp:TemplateField HeaderText="Indent Total Cost">
													<ItemTemplate>
														<asp:TextBox ID="txtIndentCost" onkeypress="return onlyNumbers();" Text='<%#Eval("INDENT_TOTAL_COST") %>' Width="60px" runat="server" Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>

												<%--10--%><asp:TemplateField HeaderText="GST">
													<ItemTemplate>
														<asp:TextBox ID="txtGST" onkeypress="return onlyNumbers();" Width="60px" Text='<%#Eval("GST_PERCENTAGE") %>' runat="server" Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Freight %">
													<ItemTemplate>
														<asp:TextBox ID="txtFreight" onkeypress="return onlyNumbers();" Width="60px" Text='<%#Eval("FRIEGHT_INSURANCE_PERCENTAGE") %>' runat="server" Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>

												<%--12--%><asp:TemplateField HeaderText="Insurance %">
													<ItemTemplate>
														<asp:TextBox ID="txtInsurance" onkeypress="return onlyNumbers();" Width="60px" Text='<%#Eval("INSURANCE_PERCENTAGE") %>' runat="server" Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>

												<%--13--%><asp:TemplateField HeaderText="Other Tex %">
													<ItemTemplate>
														<asp:TextBox ID="txtOtherTex" onkeypress="return onlyNumbers();" Text='<%#Eval("OTHER_TEX_PERCENTAGE") %>' Width="60px" runat="server" Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>

												<%--14--%><asp:TemplateField HeaderText="Indent Full Cost">
													<ItemTemplate>
														<asp:TextBox ID="txtFullCost" onkeypress="return onlyNumbers();" Text='<%#Eval("INDENT_TOTAL_COST_FULL") %>' Width="60px" runat="server" Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Consignee Depot">
													<ItemTemplate>
														<asp:TextBox ID="txtConsigneeDepot" Width="60px" runat="server" Text='<%#Eval("CONSIGNEE_DEPOT_ADDRESS") %>' Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>

												<%--16--%><asp:TemplateField HeaderText="Particulars GOV SUP">
													<ItemTemplate>
														<asp:TextBox ID="txtParticularsGovSup" Width="60px" runat="server" Text='<%#Eval("PARTICULARS_GOV_SUP") %>' Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Remarks By INSP Pur Officer">
													<ItemTemplate>
														<asp:TextBox ID="txtRemarksByINSP" Width="100px" runat="server" Text='<%#Eval("REMARKS_BY_INSP_PUR_OFFICER") %>' Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="100px" />
												</asp:TemplateField>

												<%--18--%><asp:TemplateField HeaderText="SD">
													<ItemTemplate>
														<asp:TextBox ID="txtSD" runat="server" Width="60px" Height="18px" Text='<%#Eval("SD") %>'></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>

												<asp:TemplateField HeaderText="DP">
													<ItemTemplate>
														<asp:TextBox ID="txtDP" runat="server" Width="60px" Text='<%#Eval("DP") %>' Height="18px"></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<%--20--%><asp:TemplateField Visible="false">
													<HeaderTemplate>PRICE_PER_UNIT</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("RATE_PER_UNIT") %>'></asp:Label>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<%--21--%><asp:TemplateField Visible="false">
													<HeaderTemplate>UNIT_OF_ISSUE</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("UNIT_OF_ISSUE") %>'></asp:Label>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<asp:TemplateField Visible="false">
													<HeaderTemplate>FY</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("FY") %>'></asp:Label>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<asp:TemplateField Visible="false">
													<HeaderTemplate>Dte Code</HeaderTemplate>
													<ItemTemplate>
													<%--	<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("DTE_CODE") %>'></asp:Label>--%>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<asp:TemplateField HeaderText="" Visible="false">
													<ItemTemplate>
														<%--<asp:ImageButton  ID="ImgBtnAdd" CssClass="vertical-align-mid" ImageUrl="../Content/img/1_032.png" runat="server"
															CommandName="AddNew" ToolTip="Add New" CommandArgument='<%#Eval("REC_NO") %>' />--%>
													</ItemTemplate>
													<ItemStyle HorizontalAlign="Center" />
												</asp:TemplateField>
												<asp:TemplateField Visible="true">
													<HeaderTemplate>Qty</HeaderTemplate>
													<ItemTemplate>
														<asp:TextBox ID="txtQuantityCheck"  runat="server"  Text='<%#Eval("QUANTITY_REQUIRED") %>'></asp:TextBox>
													</ItemTemplate>
												</asp:TemplateField>
											</Columns>



										</asp:GridView>
									</div>
									<div style="text-align: right;">
										<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Finalize" ID="btnFinalizeIndent" OnClick="btnFinalizeIndent_Click" />
										<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Save Indent" ID="btnSaveIndent" OnClick="btnSaveIndent_Click" />
										<input type="text" runat="server" id="PartNo_Hidden" hidden />
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12 col-lg-12 col-sm-12" style="" visible="false" id="IndentsDetailDiv" runat="server">
			<div runat="server" class="row">
				<div class="col-lg-8 col-md-6 col-sm-6">
					<h3 id="H3" runat="server" style="color: #00369E; margin: 0px">Indent Detail</h3>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H6" runat="server" style="color: #00369E; margin: 0px">(Amount in Million)</h4>
				</div>
			</div>
			<div runat="server" id="Div6" class="box box-info col-lg-12 col-md-12 col-sm-12" style="padding-left: 0px; padding-right: 0px">

				<div class="box-body">
					<div class="row padingLeft5px padingRight5px" style="font-family: Arial; font-size: 12px; color: black; overflow-y: hidden; width: 99%">
						<asp:GridView ID="IndentDetailsGrid" DataKeyNames="" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True">
							<FooterStyle BackColor="#499BEA" Font-Bold="True" ForeColor="White" />

							<EditRowStyle BackColor="#2461BF" />
							<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
							<AlternatingRowStyle BackColor="White" />
							<PagerStyle CssClass="pagination-ys" />
							<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
							<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked test" BackColor="#00369E" Font-Bold="True" ForeColor="White" />
							<EmptyDataRowStyle BackColor="#EFF3FB" />

							<Columns>
								<%--<asp:TemplateField Visible="false">
													<HeaderTemplate>SNO</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" ID="SerNo" BackColor="#499BEA" runat="server" Text='<%#Eval("SER_NO") %>'></asp:Label>
													</ItemTemplate>
												</asp:TemplateField>--%>

								<asp:TemplateField>
									<HeaderTemplate>Part No</HeaderTemplate>
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle Width="120px" />
									<FooterTemplate>
										<asp:Label Font-Bold="true" Text="Total" runat="server"></asp:Label>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Nomenclature</HeaderTemplate>
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("DESC_OF_STORE") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle Width="150px" Wrap="false" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Qty</HeaderTemplate>
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("QUANTITY_REQUIRED") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>
								<asp:TemplateField>
									<HeaderTemplate>Price Per Unit</HeaderTemplate>
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("RATE_PER_UNIT") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>
								<%--<asp:TemplateField Visible="false">
													<HeaderTemplate>Amt Dem</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("AMOUNT_DEMANDED_MIL") %>'></asp:Label>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>--%>
								<asp:TemplateField HeaderText="Specification">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("SPECIFICATION") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle Width="100px" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="No of Year">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("NO_OF_YEAR") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Esc Charges %">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("ESCALATION_CHARGES_PERCENTAGE") %>'></asp:Label>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>
								<%--8--%><asp:TemplateField HeaderText="Est Pur Rate">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("ESTIMATE_PURCHASE_RATE") %>'></asp:Label>
										<%--<asp:TextBox ID="txtEstPurRate" Width="60px" runat="server" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>

								<%--9--%><asp:TemplateField HeaderText="Indent TC">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("INDENT_TOTAL_COST") %>'></asp:Label>
										<%--<asp:TextBox ID="txtIndentCost" Width="60px" runat="server" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>

								<%--10--%><asp:TemplateField HeaderText="GST">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("GST_PERCENTAGE") %>'></asp:Label>
										<%--<asp:TextBox ID="txtGST" Width="60px" runat="server" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Freight %">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("FRIEGHT_INSURANCE_PERCENTAGE") %>'></asp:Label>
										<%--<asp:TextBox ID="txtFreight" Width="60px" runat="server" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>

								<%--12--%><asp:TemplateField HeaderText="Insurance %">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("INSURANCE_PERCENTAGE") %>'></asp:Label>
										<%--<asp:TextBox ID="txtInsurance" Width="60px" runat="server" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>

								<%--13--%><asp:TemplateField HeaderText="Other Tex %">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("OTHER_TEX_PERCENTAGE") %>'></asp:Label>
										<%--<asp:TextBox ID="txtOtherTex" Width="60px" runat="server" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>

								<%--14--%><asp:TemplateField HeaderText="Indent Full Cost">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("INDENT_TOTAL_COST_FULL") %>'></asp:Label>
										<%--<asp:TextBox ID="txtFullCost" Width="60px" runat="server" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Consignee Depot">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("CONSIGNEE_DEPOT_ADDRESS") %>'></asp:Label>
										<%--<asp:TextBox ID="txtConsigneeDepot" Width="60px" runat="server" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>

								<%--16--%><asp:TemplateField HeaderText="Particulars GOV SUP">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("PARTICULARS_GOV_SUP") %>'></asp:Label>
										<%--<asp:TextBox ID="txtParticularsGovSup" Width="60px" runat="server" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Remarks By INSP Pur Officer">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("REMARKS_BY_INSP_PUR_OFFICER") %>'></asp:Label>
										<%--<asp:TextBox ID="txtRemarksByINSP" Width="100px" runat="server" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="100px" />
								</asp:TemplateField>

								<%--18--%><asp:TemplateField HeaderText="SD">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("SD") %>'></asp:Label>
										<%--<asp:TextBox ID="txtSD" runat="server" Width="60px" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>

								<asp:TemplateField HeaderText="DP">
									<ItemTemplate>
										<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("DP") %>'></asp:Label>
										<%--<asp:TextBox ID="txtDP" runat="server" Width="60px" Height="18px"></asp:TextBox>--%>
									</ItemTemplate>
									<ItemStyle Width="50px" />
								</asp:TemplateField>
								
							</Columns>



						</asp:GridView>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-12 col-lg-12 col-sm-12" style="" visible="false" id="IndentPrintingDiv" runat="server">
			<div runat="server" class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 id="H7" runat="server" style="color: #00369E; margin: 0px">Indent Printing</h3>
				</div>
			</div>
			<div runat="server" id="Div5" class="box box-info col-lg-12 col-md-12 col-sm-12" style="padding-left: 0px; padding-right: 0px">

				<div class="box-body">
					<table class="col-lg-12 col-md-12 col-sm-12" style="padding: 0px; line-height: 3.428571 !important">
						<tr>
							<td class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">BAC No</asp:Label><br />
								<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="BACNoIP"></asp:TextBox>
							</td>
							<td class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indent No</asp:Label><br />
								<asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="IndentNoIP"></asp:TextBox>
							</td>
							<td class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Print Type</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="PrintTypeddl" runat="server" AutoPostBack="true">
									<asp:ListItem Value=""> Select Type</asp:ListItem>
									<asp:ListItem Value="D"> Draft</asp:ListItem>
									<asp:ListItem Value="F"> Final</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indent Status</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="IndentStatusddl" runat="server" AutoPostBack="true">
									<asp:ListItem Value=""> Select Indent Type</asp:ListItem>
									<asp:ListItem Value="Final"> Final</asp:ListItem>
									<asp:ListItem Value="Advanced"> Advanced</asp:ListItem>
									<asp:ListItem Value="Amended"> Amended</asp:ListItem>
									<asp:ListItem Value="Cancelled"> Cancelled</asp:ListItem>
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Priority of Indent</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="IndentPriorityIPddl" runat="server" AutoPostBack="true">
									<asp:ListItem Value=""> Select Indent Type</asp:ListItem>
									<asp:ListItem Value="Priority"> Priority</asp:ListItem>
									<asp:ListItem Value="Normal"> Normal</asp:ListItem>
									<asp:ListItem Value="Emergent"> Emergent</asp:ListItem>
									<asp:ListItem Value="Proprietary"> Proprietary</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Dairy No</asp:Label><br />
								<asp:TextBox runat="server" CssClass="form-control" ID="DairyNo"></asp:TextBox>
							</td>
							<td class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Dairy Date</asp:Label><br />
								<asp:TextBox AutoCompleteType="None" ID="DairyDate" runat="server" Width="55%" placeholder="Dairy Date" CssClass=" input-sm datepicker inline form-control"></asp:TextBox>
								<span style="background: #00369E;" class=" form-control inline">
									<i style="color: #FFF;" class="fa fa-calendar"></i>
								</span>
							</td>
							<td class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indent Type</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="IndentTypeIP" runat="server" AutoPostBack="true">
									<asp:ListItem Value=""> Select Indent Type</asp:ListItem>
									<asp:ListItem Value="Limited"> Limited</asp:ListItem>
									<asp:ListItem Value="Open Tender"> Open Tender</asp:ListItem>
									<asp:ListItem Value="Repeat Order"> Repeat Order</asp:ListItem>
									<asp:ListItem Value="Proprietary"> Proprietary</asp:ListItem>
								</asp:DropDownList>
							</td>
						</tr>
						<tr style="padding-bottom: 15px">
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Indent Category</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:DropDownList CssClass="form-control" ID="CategoryddlIP" runat="server" AutoPostBack="true">
									<asp:ListItem Value=""> Select Category</asp:ListItem>
									<asp:ListItem Value="Fresh"> Fresh</asp:ListItem>
									<asp:ListItem Value="REV"> REV</asp:ListItem>
									<asp:ListItem Value="R_E"> R&E</asp:ListItem>
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Finantial concurrence of</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="Finantialconcurrence"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Head of account to which cost of store is debitable</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="Headofaccount"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Delivery of stores required by</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="Deliveryrequiredby"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">If required by installment</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="requiredbyinstallment"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Store to be consigned:</asp:Label>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IDesignation of the receving officer</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="DesignationofReceving"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Railway Station / Siding</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="RailwayStation"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Postal Address</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="PostalAddress"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Telegrapic Address</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="TelegrapicAddress"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Which items of the indent are recommanded to be insured</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="itemsRecommandedToInsured"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Information regarding last purchase </asp:Label>
								(if Applicable then Double click for detials)
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="LastPurchase"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Stores to be booked by goods / passenger train under MC notes obtained from inspectorate in case or FOR contract</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="Stores"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Likely source of supply , in case stores / eqpt being indented for the first time</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:TextBox runat="server" CssClass="form-control" ID="sourceOfSupply"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Mode of Shippment</asp:Label>
							</td>
							<td colspan="2" class="col-lg-3 col-md-3 col-sm-3">
								<asp:DropDownList CssClass="form-control" ID="ModeddlIP" runat="server" AutoPostBack="true">
									<asp:ListItem Value=""> Select Mode</asp:ListItem>
									<asp:ListItem Value="By Road"> By Road</asp:ListItem>
									<asp:ListItem Value="By Air"> By Air</asp:ListItem>
									<asp:ListItem Value="By Sea"> By Sea</asp:ListItem>
									<asp:ListItem Value="By SAC"> By SAC</asp:ListItem>
									<asp:ListItem Value="Dilivery at consignee end on supplier exp"> Dilivery at consignee end on supplier exp</asp:ListItem>
								</asp:DropDownList>
							</td>
						</tr>
						<tr style="text-align: right;">
							<td colspan="4" class="col-lg-3 col-md-3 col-sm-3">
								<asp:Button runat="server" CssClass="btn btn-primary btn-sm" ID="SaveIndentPrint" Text="Save" OnClick="SaveIndentPrint_Click" />
								<asp:Button runat="server" CssClass="btn btn-primary btn-sm" ID="Notes_Distribution" Text="Notes/Distribution" OnClick="Notes_Distribution_Click" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-12 col-lg-12 col-sm-12" style="" visible="false" id="SplNotesDiv" runat="server">
			<div runat="server" class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 id="H8" runat="server" style="color: #00369E; margin: 0px">Distribution Parameters</h3>
				</div>
			</div>
			<div runat="server" id="Div7" class="box box-info col-lg-12 col-md-12 col-sm-12" style="padding-left: 0px; padding-right: 0px">

				<div class="box-body">
					<div class="row" style="padding: 0px;">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<table class="col-lg-12 col-md-12 col-sm-12" style="padding: 0px;">
								<tr>
									<td class="col-lg-6 col-md-6 col-sm-6" colspan="3">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Distribution Type</asp:Label><br />
										<asp:DropDownList CssClass="form-control" ID="DisType" DataTextField="indent_code" DataValueField="indent_code" runat="server"></asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="DisType" ValidationGroup="Distribution" runat="server" Display="None" ErrorMessage="Distribution Type Missing"></asp:RequiredFieldValidator>
									</td>
								</tr>
								<tr>
									<td class="col-lg-2 col-md-2 col-sm-2" style="vertical-align: top">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Sr No</asp:Label><br />
										<asp:TextBox runat="server" CssClass="form-control" ID="SrNoDisType"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="SrNoDisType" ValidationGroup="Distribution" runat="server" Display="None" ErrorMessage="Ser No Missing"></asp:RequiredFieldValidator>
									</td>
									<td class="col-lg-8 col-md-8 col-sm-8" style="vertical-align: top">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Description</asp:Label><br />
										<asp:TextBox CssClass="Upper-case" Width="100%" ID="DescriptionDisType" placeholder="Description" runat="server" Height="50px" TextMode="MultiLine"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="DescriptionDisType" ValidationGroup="Distribution" runat="server" Display="None" ErrorMessage="Description Missing"></asp:RequiredFieldValidator>
									</td>
									<td class="col-lg-2 col-md-2 col-sm-2" style="vertical-align: top">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">No of Copies</asp:Label><br />
										<asp:TextBox runat="server" CssClass="form-control" ID="NoOfConiesDisType"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="NoOfConiesDisType" ValidationGroup="Distribution" runat="server" Display="None" ErrorMessage="No of Copies Missing"></asp:RequiredFieldValidator>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" ValidationGroup="Distribution" runat="server" />
									</td>
									<td class="col-lg-2 col-md-2 col-sm-2" style="text-align: right;">
										<asp:Button runat="server" CssClass="btn btn-primary btn-sm" ID="SaveDistType" Text="Save" OnClick="SaveDistType_Click" />
									</td>
								</tr>
							</table>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="box-body">
								<div class="row">
									<div style="width: 100%">

										<div style="width: 30%; float: left">
											<div  style="font-family: Arial; font-size: 12px; color: black; overflow-y: hidden">
												<asp:GridView ID="GridViewDisList" DataKeyNames="" OnRowDataBound="GridViewDisList_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridViewDisList_RowCreated" OnRowCommand="GridViewDisList_RowCommand">
													<FooterStyle BackColor="#499BEA" Font-Bold="True" ForeColor="White" />

													<EditRowStyle BackColor="#2461BF" />
													<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
													<AlternatingRowStyle BackColor="White" />
													<PagerStyle CssClass="pagination-ys" />
													<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
													<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked test" BackColor="#00369E" Font-Bold="True" ForeColor="White" />
													<EmptyDataRowStyle BackColor="#EFF3FB" />

													<Columns>
														<asp:TemplateField>
															<HeaderTemplate>SNO</HeaderTemplate>
															<ItemTemplate>
																<asp:Label Font-Bold="true"  BackColor="#499BEA" runat="server" Text='<%#Eval("SR_NO") %>'></asp:Label>
															</ItemTemplate>
														</asp:TemplateField>
														<asp:TemplateField>
															<HeaderTemplate>Description</HeaderTemplate>
															<ItemTemplate>
																<asp:Label Font-Bold="true"  runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
															</ItemTemplate>
														</asp:TemplateField>
														<asp:TemplateField>
															<HeaderTemplate>No of Copies</HeaderTemplate>
															<ItemTemplate>
																<asp:Label Font-Bold="true"  runat="server" Text='<%#Eval("NO_OF_COPIPES") %>'></asp:Label>
															</ItemTemplate>
														</asp:TemplateField>

													</Columns>
												</asp:GridView>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="padding: 0px;">
						<h4 id="H9" runat="server" style="color: #00369E; margin: 0px; padding-left: 15px">Special Notes Parameters</h4>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<table class="col-lg-12 col-md-12 col-sm-12" style="padding: 0px;">
								<tr>
									<td class="col-lg-2 col-md-2 col-sm-2" style="vertical-align: top">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Sr No</asp:Label><br />
										<asp:TextBox runat="server" CssClass="form-control" ID="SrNotxtSN"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="SrNotxtSN" ValidationGroup="SplNotes" runat="server" Display="None" ErrorMessage="Ser No Missing"></asp:RequiredFieldValidator>
									</td>
									<td class="col-lg-10 col-md-10 col-sm-10" style="vertical-align: top">
										<asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Special Notes</asp:Label><br />
										<asp:TextBox CssClass="Upper-case" Width="100%" ID="SpecialNotesSN" placeholder="Special Notes" runat="server" Height="50px" TextMode="MultiLine"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="SpecialNotesSN" ValidationGroup="SplNotes" runat="server" Display="None" ErrorMessage="Special Notes Missing"></asp:RequiredFieldValidator>
									</td>
								</tr>
								<tr>
									<td>
										<asp:ValidationSummary ID="ValidationSummary3" ForeColor="Red" ValidationGroup="SplNotes" runat="server" />
									</td>
									<td style="text-align: right;">
										<asp:Button runat="server" CssClass="btn btn-primary btn-sm" ID="SaveSplNotes" Text="Save" OnClick="SaveSplNotes_Click" />
									</td>
								</tr>
							</table>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="box-body">
								<div class="row">
									<div style="width: 100%">

										<div style="width: 30%; float: left">
											<div  style="font-family: Arial; font-size: 12px; color: black; overflow-y: hidden">
												<asp:GridView ID="GridViewSpecialNotes" DataKeyNames="" OnRowDataBound="GridViewSpecialNotes_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridViewSpecialNotes_RowCreated" OnRowCommand="GridViewSpecialNotes_RowCommand">
													<FooterStyle BackColor="#499BEA" Font-Bold="True" ForeColor="White" />

													<EditRowStyle BackColor="#2461BF" />
													<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
													<AlternatingRowStyle BackColor="White" />
													<PagerStyle CssClass="pagination-ys" />
													<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
													<HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked test" BackColor="#00369E" Font-Bold="True" ForeColor="White" />
													<EmptyDataRowStyle BackColor="#EFF3FB" />

													<Columns>
														<asp:TemplateField>
															<HeaderTemplate>SNO</HeaderTemplate>
															<ItemTemplate>
																<asp:Label Font-Bold="true"  BackColor="#499BEA" runat="server" Text='<%#Eval("SR_NO") %>'></asp:Label>
															</ItemTemplate>
														</asp:TemplateField>
														<asp:TemplateField>
															<HeaderTemplate>Description</HeaderTemplate>
															<ItemTemplate>
																<asp:Label Font-Bold="true"  runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
															</ItemTemplate>
														</asp:TemplateField>
													</Columns>
												</asp:GridView>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
