<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtIndentDataEntryUser.aspx.cs" Inherits="BMSWeb.BgtIndentDataEntryUser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
	
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
						</div>
					</div>

				</div>
				
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
							<div style="width: 100%" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

								<div style="width: 50%; float: left">
									<div id="gridContainer" style="font-family: Arial; font-size: 12px; color: black; overflow-y: hidden">
										<asp:GridView ID="GridIndented" DataKeyNames="" OnRowDataBound="GridIndented_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridIndented_RowCreated" OnRowCommand="GridIndented_RowCommand">
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
														<asp:Label Font-Bold="true" ID="SerNo" BackColor="#499BEA" runat="server" Text='<%#Eval("SNO") %>'></asp:Label>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Indent Item</HeaderTemplate>
													<ItemTemplate>
														<asp:TextBox runat="server" CssClass="hidden" ID="HiddenQuery" Text='<%#Eval("SER_NO")+"~"+Eval("REC_NO") %>'></asp:TextBox>
														<asp:CheckBox ID="MoveToNextGrid" AutoPostBack="true" runat="server" />
													</ItemTemplate>
													<ItemStyle Width="50px" HorizontalAlign="Center"/>
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Edit & Indent</HeaderTemplate>
													<ItemTemplate>
														<asp:TextBox runat="server" CssClass="hidden" ID="HiddenQueryEdit" Text='<%#Eval("SER_NO")+"~"+Eval("REC_NO")+"~"+Eval("DTE_CODE") %>'></asp:TextBox>
														<asp:CheckBox ID="MoveToNextGridEdit" Enabled='<%#GetLockChecked(Eval("LOCK_CHECK")) %>' AutoPostBack="true" runat="server" /><br />
													</ItemTemplate>
													<ItemStyle Width="50px" HorizontalAlign="Center"/>
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Part No</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>
														<%--<p style="text-overflow: ellipsis; overflow: hidden;">
												<asp:LinkButton ID="btnBAC" CssClass="vertical-align-mid" Text='<%#Eval("PARTS_NO_NSN") %>' runat="server"
													CommandName="viewBACDes" ToolTip='<%#Eval("BAC_NO") %>' CommandArgument='<%#Eval("BAC_NO") %>' />
											</p>--%>
													</ItemTemplate>
													<FooterTemplate>
														<asp:Label Font-Bold="true" Text="Total" runat="server"></asp:Label>
													</FooterTemplate>
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Nomenclature</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("NOMENCLATURE") %>'></asp:Label>
													</ItemTemplate>
													<ItemStyle HorizontalAlign="Center" />
													<ItemStyle Wrap="false" />
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Qty</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("QTY") %>'></asp:Label>
														<%--<asp:TextBox ID="txtQTY" runat="server"  Text='<%# Eval("QTY") %>' Width="70"  CssClass="text-Align-span float-Right" Font-Bold="true" style="" ></asp:TextBox>--%>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField Visible="false">
													<HeaderTemplate>Status</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" ID="FLAG_INDENT_STATUS" runat="server" Text='<%#Eval("FLAG_INDENT_STATUS") %>'></asp:Label>
													</ItemTemplate>
												</asp:TemplateField>
											</Columns>



										</asp:GridView>
									</div>

								</div>
								<div style="vertical-align: middle; width: 5%; float: left; text-align: center">
									<div>
										<asp:Button runat="server" Text=">>" ID="btnMoveNext" OnClick="btnMoveNext_Click" />
									</div>
									<br />
									<div>
										<asp:Button runat="server" Text="<<" ID="btnMoveBack" OnClick="btnMoveBack_Click" />
									</div>
								</div>
								<div style="vertical-align: top; width: 45%; float: left" id="EntryDiv" runat="server" visible="false"> 
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
														<asp:Label Font-Bold="true" ID="SerNo" BackColor="#499BEA" runat="server" Text='<%#Eval("SER_NO") %>'></asp:Label>
													</ItemTemplate>
													<ItemStyle Width="50px" HorizontalAlign="Center"/>
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Move Back</HeaderTemplate>
													<ItemTemplate>
														<asp:TextBox runat="server" CssClass="hidden" ID="HiddenQuery" Text='<%#Eval("SER_NO")+"~"+Eval("REC_NO") %>'></asp:TextBox>
														<asp:CheckBox ID="MoveBackGrid" AutoPostBack="true" runat="server" />
													</ItemTemplate>
													<ItemStyle Width="50px" HorizontalAlign="Center"/>
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Part No</HeaderTemplate>
													<ItemTemplate>
														<%--<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>--%>
														<asp:TextBox ID="txtPartNo" Enabled='<%#GetEnableChecked(Eval("dtLockCheck")) %>' runat="server" Height="18px" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:TextBox>
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
														<asp:TextBox ID="txtNomenclature" Enabled='<%#GetEnableChecked(Eval("dtLockCheck")) %>' runat="server" Height="18px" Text='<%#Eval("NOMENCLATURE") %>'></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="150px" Wrap="false" />
												</asp:TemplateField>
												<asp:TemplateField>
													<HeaderTemplate>Qty</HeaderTemplate>
													<ItemTemplate>
														<%--<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("QTY") %>'></asp:Label>--%>
														<asp:TextBox ID="txtQuantity" onkeypress="return onlyNumbers();" OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true" runat="server" Width="60px" Height="18px" Text='<%#Eval("QTY") %>'></asp:TextBox>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<%--5--%><asp:TemplateField>
													<HeaderTemplate>Price Per Unit</HeaderTemplate>
													<ItemTemplate>
														<asp:TextBox ID="txtPricePerUnit" onkeypress="return onlyNumbers();" OnTextChanged="txtPricePerUnit_TextChanged" AutoPostBack="true"  runat="server" Width="60px" Height="18px" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:TextBox>
														<%--<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:Label>--%>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												
												<asp:TemplateField Visible="false">
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
														<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("DTE_CODE") %>'></asp:Label>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<asp:TemplateField HeaderText="">
													<ItemTemplate>
														<asp:ImageButton Visible='<%#GetEnableChecked(Eval("dtLockCheck")) %>' ID="ImgBtnAdd" CssClass="vertical-align-mid" ImageUrl="../Content/img/1_032.png" runat="server"
															CommandName="AddNew" ToolTip="Add New" CommandArgument='<%#Eval("REC_NO") %>' />
													</ItemTemplate>
													<ItemStyle HorizontalAlign="Center" />
												</asp:TemplateField>
												
												<asp:TemplateField Visible="false">
													<HeaderTemplate>Qty</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("QTY") %>'></asp:Label>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
												<%--5--%><asp:TemplateField Visible="false">
													<HeaderTemplate>Price Per Unit</HeaderTemplate>
													<ItemTemplate>
														<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:Label>
													</ItemTemplate>
													<ItemStyle Width="50px" />
												</asp:TemplateField>
											</Columns>



										</asp:GridView>
									</div>
									<div style="text-align: right;">
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

	</div>
</asp:Content>


