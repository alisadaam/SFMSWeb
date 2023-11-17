<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtIndentDataEntryAdmin.aspx.cs" Inherits="BMSWeb.Pages.BgtIndentDataEntryAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row" id="main_form" runat="server">

		<div class="col-md-12 col-lg-12 col-sm-12 padingRight5px" style="padding-left: 11px;">

			<div class="col-lg-12 col-md-12 col-sm-12">
				<h3 runat="server" style="color: #1D74D6; margin: 0px">Indent Admin</h3>
			</div>

			<div class="col-lg-5 col-md-5 col-sm-6" style="padding-left: 7px;">

				<div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

					<div class="box-body" style="padding-bottom: 2px;">

						<div class="row">

							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">PSO</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="PSOddl" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" runat="server" OnSelectedIndexChanged="PSOddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingLeft1px padingRight1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">ACAS</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="ACASddl" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ACASddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin  padingLeft1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Directorate</asp:Label><br />
								<asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="Directorateddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Directorateddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">FY</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

							</div>

							<div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px padingLeft1px">
								<asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">BAC No</asp:Label><br />
								<asp:DropDownList CssClass="form-control" ID="BACNoddl" DataTextField="BAC_NO" DataValueField="BAC_NO" runat="server" OnDataBound="BACNoddl_DataBound" OnSelectedIndexChanged="BACNoddl_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
							</div>
							
						</div>
					</div>

				</div>
				
				
			</div>
			<div id="Div3" runat="server" class="col-md-7 col-lg-7 col-sm-7 padingLeft5px" >

				
			</div>
		</div>
		<div class="col-md-12 col-lg-12 padingRight5px" style="">
			<div id="GridDiv" runat="server" class="col-md-12 col-lg-12 padingLeft5px">
				<div class="col-lg-8 col-md-6">
					<h3 id="TReq" runat="server" style="color: #1D74D6; margin: 0px">Requirements Entered</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H2" runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
				</div>

				<div runat="server" id="MainDetails" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px">

					<div class="box-body">
						
							<div id="gridContainer" style="font-family: Arial; font-size: 16px; color: black; overflow-y: hidden" colspan="2">

								<asp:GridView ID="GridIndented" AllowPaging="true" DataKeyNames="" OnRowDataBound="GridIndented_RowDataBound" ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridIndented_RowCreated" OnRowCommand="GridIndented_RowCommand" OnPageIndexChanging="GridIndented_PageIndexChanging">
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
											<HeaderTemplate>Directorate</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("DTE_SYMBOL2") %>'></asp:Label>
												<%--<asp:TextBox ID="txtQTY" runat="server"  Text='<%# Eval("QTY") %>' Width="70"  CssClass="text-Align-span float-Right" Font-Bold="true" style="" ></asp:TextBox>--%>
											</ItemTemplate>
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
									 <asp:TemplateField>
											<HeaderTemplate>Price Per Unit(Not Mill)</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" CssClass="text-Align-span" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:Label>
												<%--<asp:TextBox ID="txtQTY" runat="server"  Text='<%# Eval("QTY") %>' Width="70"  CssClass="text-Align-span float-Right" Font-Bold="true" style="" ></asp:TextBox>--%>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Unit of Issue</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("UNIT_OF_ISSUE") %>'></asp:Label>
												<%--<asp:TextBox ID="txtQTY" runat="server"  Text='<%# Eval("QTY") %>' Width="70"  CssClass="text-Align-span float-Right" Font-Bold="true" style="" ></asp:TextBox>--%>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Currency</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" Text='<%#Eval("CURRENCY") %>'></asp:Label>
												<%--<asp:TextBox ID="txtQTY" runat="server"  Text='<%# Eval("QTY") %>' Width="70"  CssClass="text-Align-span float-Right" Font-Bold="true" style="" ></asp:TextBox>--%>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>Amount Demanded</HeaderTemplate>
											<ItemTemplate>
												<asp:Label Font-Bold="true" runat="server" CssClass="text-Align-span" Text='<%#Eval("AMOUNT_DEMANDED_MIL") %>'></asp:Label>
												<%--<asp:TextBox ID="txtQTY" runat="server"  Text='<%# Eval("QTY") %>' Width="70"  CssClass="text-Align-span float-Right" Font-Bold="true" style="" ></asp:TextBox>--%>
											</ItemTemplate>
										</asp:TemplateField>
										
										<asp:TemplateField ItemStyle-HorizontalAlign="Center"> 
											<HeaderTemplate>UnLock Edit</HeaderTemplate>
											<ItemTemplate>
												<asp:TextBox runat="server"  CssClass="hidden" ID="HiddenQuery" Text='<%#Eval("SER_NO")+"~"+Eval("FY")+"~"+Eval("DTE_CODE")+"~"+Eval("PARTS_NO_NSN") %>'></asp:TextBox>
												<asp:CheckBox Checked='<%#GetLockChecked(Eval("LOCK_CHECK")) %>' ID="CBLockEdit" AutoPostBack="true" runat="server" />
											</ItemTemplate>
											</asp:TemplateField>
									</Columns>



								</asp:GridView>


							</div>
							
						<div class="col-lg-12 col-md-12" style="text-align: right; padding-right: 5px">
								<asp:Button runat="server" CssClass="btn btn-primary btn-sm" Style="margin-top: 5px; padding-right: 5px" Text="Update" ID="BtnUpdateLock" OnClick="BtnUpdateLock_Click" />
							</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</asp:Content>
