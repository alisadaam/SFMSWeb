<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="StudentFee.aspx.cs" Inherits="BMSWeb.Pages.StudentFee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" id="main_form" runat="server">

        <div class="col-md-12 col-lg-12 col-sm-12 padingRight5px" style="padding-left: 11px;">

            <div class="col-lg-12 col-md-12 col-sm-12">
                <h3 runat="server" style="color: #00369E; margin: 0px">Student Fee</h3>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-6" style="padding-left: 7px;">

                <div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

                    <div class="box-body" style="padding-bottom: 2px;">

                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Student </asp:Label><br />
                                
								 <asp:DropDownList CssClass="form-control" ID="ddlStudent"  
									 OnSelectedIndexChanged="ddlStudent_SelectedIndexChanged" runat="server" AutoPostBack="True">
								 </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlStudent" ValidationGroup="grp_fee"
                                    runat="server" Display="None" ErrorMessage="Fee Type Missing"  AutoPostBack="true">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Fee Type</asp:Label><br />
                                <asp:DropDownList CssClass="form-control" ID="ddlFeeType" 
									 OnSelectedIndexChanged="ddlFeeType_SelectedIndexChanged" runat="server">
								 </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlFeeType" ValidationGroup="grp_fee"
                                    runat="server" Display="None" ErrorMessage="Fee Type Missing">
                                </asp:RequiredFieldValidator>
                            </div>
                            
                           
                           
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Amount Due</asp:Label><br />
                                <asp:TextBox runat="server" CssClass="form-control" Enabled="false" placeholder="Fee " ID="txtDueAmt"></asp:TextBox>
								 
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Amount Received</asp:Label><br />
                                <asp:TextBox runat="server" CssClass="form-control" onkeypress="return onlyNumbers();" placeholder="Amount Received " ID="txtRecAmt" AutoPostBack="True" OnTextChanged="txtRecAmt_TextChanged"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtRecAmt" ValidationGroup="grp_fee"
                                    runat="server" Display="None" ErrorMessage="Receive Amount Missing">
                                </asp:RequiredFieldValidator>
                            </div>
							 <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Amount Pending</asp:Label><br />
                                <asp:TextBox runat="server" CssClass="form-control" onkeypress="return onlyNumbers();" placeholder="Amount Pending " ID="txtpendAmt" Enabled="False"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" ValidationGroup="grp_fee" runat="server" />
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 ">

                                <asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="grp_fee" Style="float: right; margin-top: 5px" Text="Save Fee" ID="btnSave" OnClick="btnSave_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        	<div id="Div3" runat="server" class="col-md-12 col-lg-12 ">
			
				<div class="col-lg-8 col-md-6">
					<h3 id="H3" runat="server" style="color: #00369E; margin: 0px">Fee Record</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H4" runat="server" style="color: #1D74D6; margin: 0px">(Amt in Rs)</h4>
				</div>

				<div runat="server" id="Div4" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px;">

					<div class="box-body" style="padding-top: 2px">

						<div style="overflow: hidden; height: 109px;">
							<asp:GridView ID="GridViewFee" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="true"
								runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowCreated="GridViewFee_RowCreated" OnRowDataBound="GridViewFee_RowDataBound">
								<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
								<EditRowStyle BackColor="#2461BF" />
								<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
								<PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
								<AlternatingRowStyle BackColor="White" />
								<RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
								<HeaderStyle CssClass="FreezHeader  resr" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
								<EmptyDataRowStyle BackColor="#EFF3FB" />

								<Columns>
									<asp:TemplateField>
										<HeaderTemplate>Name</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" Text='<%#Eval("First_Name") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0;">
												<asp:Label Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField>
										<HeaderTemplate>Fee Type</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" Text='<%#Eval("Fee_Type") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0;">
												<asp:Label Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>

									<asp:TemplateField ControlStyle-ForeColor="Red">
										<HeaderTemplate>Amount Due</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("Amount_Due") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lblAmount_Due" CssClass="text-Align-span" Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField ControlStyle-ForeColor="Green">
										<HeaderTemplate>Amount Received</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("Amount_Received") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lblAmount_Received" CssClass="text-Align-span" Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField ControlStyle-ForeColor="Green">
										<HeaderTemplate>Amount Pending</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("Amount_Pending") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lblAmount_Pending" CssClass="text-Align-span" Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>


								</Columns>


							</asp:GridView>
						</div>
					</div>
				</div>
		
		</div>
    </div>

</asp:Content>
