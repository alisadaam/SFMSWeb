<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtCMISContracts.aspx.cs" Inherits="BMSWeb.Pages.BgtCMISContracts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<div class="row" id="main_form" runat="server">
		<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">

			<div class="col-lg-8 col-md-6">
				<h3 runat="server" style="color: #1D74D6; margin: 0px">Budget CMIS Contracts - <span runat="server" id="yearlabel"></span></h3>
			</div>

			<div class="col-lg-5 col-md-5" style="padding-left: 7px;">

				<div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

					<div class="box-body" style="padding-bottom: 2px;">
						
						<%--<div class="row">
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px">
								<asp:TextBox Visible="false" ID="SrNoUpdate" runat="server"></asp:TextBox>
								<asp:DropDownList CssClass="form-control" DataValueField="BGT_TYPE_CODE" DataTextField="BGT_TYPE" ID="BGT_TYPE" runat="server" OnSelectedIndexChanged="BGT_TYPE_SelectedIndexChanged" AutoPostBack="True">
								</asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
								<asp:DropDownList CssClass="form-control" ID="APPENDIX" DataValueField="APPENDIX_CODE" AutoPostBack="true" DataTextField="APPENDIX_DECODE" runat="server" OnSelectedIndexChanged="APPENDIX_SelectedIndexChanged"></asp:DropDownList>
							</div>

							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px" style="display: none;">

								<asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="ESTIMATION_TYPE" DataValueField="BGT_EST_CODE" DataTextField="BGT_EST_DECODE" runat="server" OnSelectedIndexChanged="ESTIMATION_TYPE_SelectedIndexChanged"></asp:DropDownList>
							</div>
						</div>--%>
						<div class="row">


							<div class="col-lg-4 col-md-4 buttom-margin  padingRight1px" >

								<asp:DropDownList CssClass="form-control" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

							</div>

							<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px ">
								<asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="currancy" runat="server" OnSelectedIndexChanged="currancy_SelectedIndexChanged">
										<asp:ListItem Value=""> Select Currency</asp:ListItem>
									<asp:ListItem Value="F"> FE</asp:ListItem>
									<asp:ListItem Value="P"> Rs</asp:ListItem>
								</asp:DropDownList>
							</div>
								</div>
							<div class="row">
							<div class="col-lg-4 col-md-4 buttom-margin padingRight1px">
								<asp:DropDownList CssClass="form-control" ID="PSOddl" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" runat="server" OnSelectedIndexChanged="PSOddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px padingRight1px">
								<asp:DropDownList CssClass="form-control" ID="ACASddl" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ACASddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
							<div class="col-lg-4 col-md-4 buttom-margin padingLeft1px">
								<asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="Directorateddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Directorateddl_SelectedIndexChanged"></asp:DropDownList>
							</div>
							
							<%--<div class="col-lg-4 col-md-4 buttom-margin padingRight1px padingLeft1px">
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
							</div>--%>
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

				<%--<div class="col-lg-8 col-md-6">
					<h3 id="H4" runat="server" style="color: #1D74D6; margin: 0px">Summary</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H5" runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
				</div>

				<div runat="server" id="Div4" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px; top: 0px; left: 0px;">

					<div class="box-body" style="padding-top: 2px">
					
					</div>
				</div>--%>
			</div>
		</div>
		<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">
			<div class="col-md-12 col-lg-12 padingRight5px" style="padding-left: 11px;">
				<div id="GridDiv" visible="false" runat="server" class="col-md-12 col-lg-12 padingLeft5px">
					<div class="col-lg-8 col-md-6">
						<h3 id="TReq" runat="server" style="color: #1D74D6; margin: 0px">Contracts Detail</h3>
					</div>
					<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
						<h4 id="H1" runat="server" style="color: #1D74D6; margin: 0px">(Amount in Million)</h4>
					</div>

					<div runat="server" id="MainDetails" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px">

						<div class="box-body">

							<div id="gridContainer">

							<asp:GridView ID="GridCMISContract" DataKeyNames="FY,SNO,SPL_DTE,CURRENCY,CONTRACT_NO" AllowPaging="True" OnRowCommand="GridCMISContract_RowCommand" OnRowDataBound="GridCMISContract_RowDataBound" OnPageIndexChanged="GridCMISContract_PageIndexChanged"  ShowFooter="True" CssClass="Grid table-hover border-color" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowSorting="True" OnRowCreated="GridCMISContract_RowCreated"  OnPageIndexChanging="GridCMISContract_PageIndexChanging">
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
													<asp:Label runat="server" Text='<%#Eval("SNO") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField >
											<HeaderTemplate>FY</HeaderTemplate>
											<ItemTemplate>
												<asp:LinkButton ID="LinkButtonFY" runat="server" CommandName="ShowGraphFY"  CommandArgument='<%#Eval("FY") %>'  Text='<%#Eval("FY") %>'></asp:LinkButton>
											</ItemTemplate>
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>Contract No</HeaderTemplate>
											<ItemTemplate>
												<asp:LinkButton ID="LinkButtonContract" runat="server" CommandName="ShowGraphContract"  CommandArgument='<%#Eval("CONTRACT_NO") %>'  Text='<%#Eval("CONTRACT_NO") %>'></asp:LinkButton>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField>
											<HeaderTemplate>DTE Symbol</HeaderTemplate>
											<ItemTemplate>
												<asp:LinkButton ID="LinkButtonDte" runat="server" CommandName="ShowGraphDte"  CommandArgument='<%#Eval("SPL_DTE") %>'  Text='<%#Eval("SPL_DTE") %>'></asp:LinkButton>
											</ItemTemplate>
										</asp:TemplateField>

										<asp:TemplateField>
											<HeaderTemplate>Currency</HeaderTemplate>
											<ItemTemplate>
													<asp:Label runat="server" Text='<%#Eval("CURRENCY") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										
									</Columns>
									<EmptyDataTemplate>
										<p align="center"><strong>No Record Found</strong></p>
									</EmptyDataTemplate>

								</asp:GridView>

							</div>
							<div class="col-lg-12 col-md-12" style="padding-top:10px;padding-right:0px;padding-left:0px">
							<div runat="server">
							<iframe  src="GraphPage.aspx" id="CmisIframe" runat="server" style=" height: 420px;    border: none;"></iframe>		
						</div>

<%--								<asp:button runat="server" cssclass="btn btn-primary btn-sm" style="margin-top: 5px; padding-right: 5px" text="save" id="btnsave" onclick="btnsave_click1" />
								<asp:button runat="server" cssclass="btn btn-primary btn-sm" style="margin-top: 5px" text="reset" id="btnreset" onclick="btnreset_click1" />--%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</asp:Content>
