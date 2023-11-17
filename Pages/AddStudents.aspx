<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="AddStudents.aspx.cs" Inherits="BMSWeb.Pages.AddStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row" id="main_form" runat="server">

        <div class="col-md-12 col-lg-12 col-sm-12 padingRight5px" style="padding-left: 11px;">

            <div class="col-lg-12 col-md-12 col-sm-12">
                <h3 runat="server" style="color: #00369E; margin: 0px">Enroll Student</h3>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-6" style="padding-left: 7px;">

                <div class="box box-primary" style="padding-left: 0px; padding-right: 0px; margin-bottom: 0px;">

                    <div class="box-body" style="padding-bottom: 2px;">

                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">First Name </asp:Label><br />
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="First Name " ID="txtF_Name"></asp:TextBox>
                                <asp:TextBox runat="server" CssClass="form-control"   ID="txtStdID" visible="false" > </asp:TextBox> 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtF_Name" ValidationGroup="grp_std"
                                    runat="server" Display="None" ErrorMessage="First Name Missing">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Last Name </asp:Label><br />
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="Last Name " ID="txtL_Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtL_Name" ValidationGroup="grp_std"
                                    runat="server" Display="None" ErrorMessage="Last Name Missing">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Gender</asp:Label><br />
                                <asp:DropDownList CssClass="form-control" ID="ddlGender" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ddlGender" ValidationGroup="grp_std"
                                    runat="server" Display="None" ErrorMessage="Gender Missing">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Email</asp:Label><br />
                                <asp:TextBox runat="server" CssClass="form-control " placeholder="Email" ID="txtEmail"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtEmail" ValidationGroup="grp_std"
                                    runat="server" Display="None" ErrorMessage="Email Missing">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Class </asp:Label><br />
                                <asp:DropDownList CssClass="form-control" ID="ddlClass"  runat="server"
                                    OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ddlClass" ValidationGroup="grp_std"
                                    runat="server" Display="None" ErrorMessage="Class Missing">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Tution Fee </asp:Label><br />
                                <asp:TextBox runat="server" CssClass="form-control" Enabled="false" placeholder="Fee " ID="txtFee"></asp:TextBox>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 buttom-margin padingRight1px">
                                <asp:Label Style="color: #00369E; font-weight: 700;" runat="server">Discount<span style="color:forestgreen"> %</span> </asp:Label><br />
                                <asp:TextBox runat="server" CssClass="form-control" onkeypress="return onlyNumbers();" placeholder="Discount " ID="txtDiscount"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" ValidationGroup="grp_std" runat="server" />
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 ">

                                <asp:Button runat="server" class="btn btn-primary btn-sm" ValidationGroup="grp_std" Style="float: right; margin-top: 5px" Text="Save Student" ID="btnSave" OnClick="btnSave_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        	<div id="Div3" runat="server" class="col-md-12 col-lg-12 ">
			
				<div class="col-lg-8 col-md-6">
					<h3 id="H3" runat="server" style="color: #00369E; margin: 0px">Enrolled Students</h3>
				</div>
				<div class="col-lg-4 col-md-6" style="text-align: right; padding-top: 5px;">
					<h4 id="H4" runat="server" style="color: #1D74D6; margin: 0px">(Class Wise)</h4>
				</div>

				<div runat="server" id="Div4" class="box box-info col-lg-12 col-md-12" style="padding-left: 0px; padding-right: 0px; margin-bottom: 8px;">

					<div class="box-body" style="padding-top: 2px">

						<div style="overflow: hidden; height: 109px;">
							<asp:GridView ID="GridViewStundents" ShowFooter="true" CssClass="Grid table-hover border-color" Width="100%" AllowPaging="true"
								runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowCreated="GridViewStundents_RowCreated" OnRowDataBound="GridViewStundents_RowDataBound">
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
										<HeaderTemplate>First Name</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" Text='<%#Eval("First_Name") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0;">
												<asp:Label Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>

									<asp:TemplateField ControlStyle-ForeColor="Red">
										<HeaderTemplate>Last Name</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("Last_Name") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lbllastname" CssClass="text-Align-span" Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField ControlStyle-ForeColor="Green">
										<HeaderTemplate>Class</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("Class_Id") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lblclass" CssClass="text-Align-span" Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField ControlStyle-ForeColor="Green">
										<HeaderTemplate>Email</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lblemail" CssClass="text-Align-span" Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField ControlStyle-ForeColor="Green">
										<HeaderTemplate>Fee</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("TutionFee") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lblFee" CssClass="text-Align-span" Text="" runat="server" />
											</div>
										</FooterTemplate>
									</asp:TemplateField>
									<asp:TemplateField ControlStyle-ForeColor="Green">
										<HeaderTemplate>Discount</HeaderTemplate>
										<ItemTemplate>
											<asp:Label CssClass="text-Align-span" runat="server" Text='<%#Eval("Discount") %>'></asp:Label>
										</ItemTemplate>
										<FooterTemplate>
											<div style="padding: 0 0 5px 0">
												<asp:Label ID="lblDiscount" CssClass="text-Align-span" Text="" runat="server" />
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
