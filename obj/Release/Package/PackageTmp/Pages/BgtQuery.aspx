<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="BgtQuery.aspx.cs" Inherits="BMSWeb.Pages.BgtQuery" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <style>
        .legend1 {
            display: block;
            width: 30% !important;
            padding: 0;
            margin-bottom: 20px;
            font-size: 21px;
            line-height: inherit;
            color: #333;
            border: 0;
            /* border-bottom: 1px solid #e5e5e5; */
        }

        .fieldset1 {
            /*padding: .35em .625em .75em;*/
            margin: 0 2px;
            border: 1px solid silver !important;
        }
    </style>
    <script type="text/javascript" src="../assets/js/jquery.min.js"></script>


    <script type="text/javascript" src="../Scripts/Accordian/maxcdn.bootstrapcdn.js"></script>
    <script type="text/javascript" src="../Scripts/Accordian/jquery3.1.1jquery.min.js"></script>
    <script src="../assets/js/app/app.js"></script>
    <script type="text/javascript">
        function openModal() {
            //console.log($('#chartpanel').html);
            $('#bardetailsmodal').modal('show');
        }
</script>


    <div class="row">
        <div class="col-lg-11"></div>
        <div class="col-lg-1" style="display: none;">
            <asp:Button  runat="server" CssClass="btn btn-primary margin" Text="Reload" ID="ReloadPage" OnClick="ReloadPage_Click" />
        </div>
    </div>
    <%--    <div id="accordion" role="tablist" aria-multiselectable="true" runat="server">
            <div class="panel panel-default">
                <div class="panel-heading gradient" style="color: #FFFFFF;" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <div style="cursor: pointer" data-toggle="collapse" id="ReportAccordian" data-parent="#accordion" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                           Estimates Stores
                        </div>
                    </h4>
                </div>
                dsadsadsadasd
                 </div>
        </div>--%>

    <div class="row" id="main_form" runat="server" enableviewstate="true">

        <div class="col-md-12 col-lg-12" runat="server" id="g">
            <h3 style="color: #1D74D6; margin: 0px">Budget Estimates Stores</h3>
            <asp:Panel runat="server" ID="EstPanal" EnableViewState="true">
                <div class="box box-primary" style="margin-bottom: 0px !important">

                    <div class="box-body">
                        <asp:Panel runat="server" ID="PanelSub" EnableViewState="true">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 buttom-margin">
                                    <asp:TextBox Visible="false" ID="SrNoUpdate" runat="server"></asp:TextBox>
                                    <asp:DropDownList CssClass="form-control" DataValueField="BGT_TYPE_CODE" DataTextField="BGT_TYPE" ID="BGT_TYPE" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="BGT_TYPE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Bgt Type Missing"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-3 col-md-3 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" ID="APPENDIX" DataValueField="APPENDIX_CODE" AutoPostBack="true" DataTextField="APPENDIX_DECODE" runat="server" OnSelectedIndexChanged="APPENDIX_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="APPENDIX" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Appendix Missing"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-2 col-md-2 buttom-margin">
                                    <%-- <asp:DropDownList Enabled="false" CssClass="form-control" ID="DropDownList2" runat="server">
                                  <asp:ListItem value=""> BE</asp:ListItem>
                               
                             </asp:DropDownList> --%>
                                    <asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="ESTIMATION_TYPE" DataValueField="BGT_EST_CODE" DataTextField="BGT_EST_DECODE" runat="server" OnSelectedIndexChanged="ESTIMATION_TYPE_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ESTIMATION_TYPE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Est Type Missing"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-lg-2 col-md-2 buttom-margin">

                                    <asp:DropDownList CssClass="form-control" ID="FY" DataTextField="FY" DataValueField="VALUE" runat="server" OnSelectedIndexChanged="FY_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                                </div>



                                <div class="col-lg-3 col-md-3 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" ID="PSOddl" DataValueField="PSO_SYMBOL" DataTextField="PSO_DESCRIPTION" runat="server" OnSelectedIndexChanged="PSOddl_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="PSOddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="PSO Missing"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-3 col-md-3 col-md-3 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" ID="ACASddl" DataValueField="ACAS_CODE" DataTextField="ACAS_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ACASddl_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ACASddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="ACAS Missing"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-2 col-md-2 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" DataValueField="DTE_SYMBOL" DataTextField="DTE_DECODE" ID="Directorateddl" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="Directorateddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Directorate Missing"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-2 col-md-2 buttom-margin">
                                    <asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="currancy" runat="server" OnSelectedIndexChanged="currancy_SelectedIndexChanged">
                                        <asp:ListItem Value=""> Select Currancy</asp:ListItem>
                                        <asp:ListItem Value="F"> FE</asp:ListItem>
                                        <asp:ListItem Value="P"> Rs</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="currancy" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Currancy Missing"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-lg-3 col-md-3 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" ID="PURCHASE_TYPE" DataValueField="PURCHASE_CODE" DataTextField="PURCHASE_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="PURCHASE_TYPE_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="PURCHASE_TYPE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Purchase Type Missing"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-3 col-md-3 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" ID="UTILIZATION_MODE" DataValueField="UTILIZATION_CODE" DataTextField="UTILIZATION_DECODE" AutoPostBack="true" runat="server" OnSelectedIndexChanged="UTILIZATION_MODE_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="UTILIZATION_MODE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Utilization Mode Missing"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-2 col-md-2 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="REQUIREMENT_TYPE" DataValueField="REQUIREMENT_CODE" DataTextField="REQUIREMENT_DECODE" runat="server" OnSelectedIndexChanged="REQUIREMENT_TYPE_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="REQUIREMENT_TYPE" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Requirement Type Missing"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-lg-2 col-md-2 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" ID="Type" runat="server">
                                        <asp:ListItem Value=""> Select Type</asp:ListItem>
                                        <asp:ListItem Value="F"> Fresh</asp:ListItem>
                                        <asp:ListItem Value="C"> Carry Over</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="Type" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Type Missing"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-lg-3 col-md-3   ">

                                    <asp:DropDownList CssClass="form-control" ID="PROJECT_IDddl" DataValueField="PROJECT_CODE" DataTextField="PROJECT_DECODE" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="PROJECT_IDddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Project Missing"></asp:RequiredFieldValidator>

                                </div>
                                <div class="col-lg-3 col-md-3 ">

                                    <asp:DropDownList CssClass="form-control" ID="PDIB_STATUS" DataValueField="PDIB_STATUS_CODE" DataTextField="PDIB_STATUS_DECODE" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="PDIB_STATUS" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="PDIB Missing"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-2 col-md-2 ">

                                    <asp:DropDownList CssClass="form-control" ID="Priorty" runat="server">
                                        <asp:ListItem Value=""> Select Priorty</asp:ListItem>
                                        <asp:ListItem Value="1"> I</asp:ListItem>
                                        <asp:ListItem Value="2"> II</asp:ListItem>
                                        <asp:ListItem Value="3"> III</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="Priorty" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Priorty Missing"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-lg-2 col-md-2 ">

                                    <asp:DropDownList CssClass="form-control" ID="EQUIPMENT_CAT" DataValueField="HEAD_CODE" DataTextField="HEAD_DESCRIPTION" runat="server" OnDataBound="EQUIPMENT_CAT_DataBound"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="EQUIPMENT_CAT" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Equipment Cat Missing"></asp:RequiredFieldValidator>


                                    <asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="ContractNoddl" DataValueField="CONTRACT_NO" DataTextField="CONTRACT_NO" runat="server" OnDataBound="ContractNoddl_DataBound" OnSelectedIndexChanged="ContractNoddl_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" ControlToValidate="ContractNoddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Contract No Missing"></asp:RequiredFieldValidator>


                                </div>

                                <div class="col-lg-3 col-md-3 ">

                                    <asp:DropDownList CssClass="form-control" ID="WEAPON_SYS" DataValueField="WPN_SYS_CODE" DataTextField="WEAPON_SYSTEM" runat="server" OnDataBound="WEAPON_SYS_DataBound"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="WEAPON_SYS" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Weapon Sys Missing"></asp:RequiredFieldValidator>

                                </div>





                                <div id="TofDiv" runat="server" class="col-lg-4 col-md-4 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" ID="TOF_Headsddl" DataValueField="HEAD_CODE" DataTextField="HEAD_DESC_LONG" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="TOF_Headsddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="Type Missing"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-lg-4 col-md-4 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" ID="Tof_agencies" DataValueField="AGENCY_CODE" DataTextField="AGENCY_DECODE" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" ControlToValidate="Tof_agencies" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="AGENCY Missing"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 col-md-4 buttom-margin">
                                    <asp:DropDownList CssClass="form-control" ID="LP_Headsddl" DataValueField="LP_HEAD_CODE" DataTextField="LP_HEAD_DECODE" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="LP_Headsddl" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="LP Head Missing"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <div class="col-lg-10 " runat="server" id="ViewGridDiv">

                                <asp:Button runat="server" class="btn btn-primary btn-sm" Style="float: right; margin-top: 5px" Text="View Detail" ID="btnViewGrid" OnClick="btnViewGrid_Click" />

                                <asp:Button runat="server" class="btn btn-primary btn-sm" Style="float: right; margin-top: 5px" Text="View Detail" ID="btnViewGraph" OnClick="btnViewGraph_Click" />

                                <%--<button type="button" class="btn btn-success btn-sm" style="float: right; margin-top: 5px; margin-right: 10px;" id="showgraph_view">View Graph</button>--%>
                            </div>
                        </asp:Panel>
                    </div>

                </div>

                <div class="box box-primary">
                    <div class="box-body">



                        <div id="CarryOverExtra" runat="server" class="row buttom-margin">
                            <div class="col-lg-4 col-md-4 ">
                                <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Nature Of Stores</asp:Label>
                                <asp:TextBox CssClass="form-control" placeholder="NOF" ID="NOF" runat="server"></asp:TextBox>

                            </div>
                            <div class="col-lg-4 col-md-4 ">
                                <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Total Amount</asp:Label>
                                <asp:TextBox CssClass="form-control" placeholder="Total Amount" ID="TotalAmount" runat="server"></asp:TextBox>

                            </div>
                            <div class="col-lg-4 col-md-4 ">
                                <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Paid LFY</asp:Label>
                                <asp:TextBox CssClass="form-control" placeholder="PTLFY" ID="PTLFY" runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div id="CarryOverExtra1" runat="server" class="row buttom-margin">
                            <div class="col-lg-4 col-md-4 ">
                                <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Total Paid</asp:Label>
                                <asp:TextBox CssClass="form-control" placeholder="Total Paid" ID="TotalPaid" runat="server"></asp:TextBox>

                            </div>
                            <div class="col-lg-4 col-md-4">
                                <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server">Est Val To Be Paid</asp:Label>
                                <asp:TextBox CssClass="form-control" placeholder="EVTP" ID="EVTP" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" ControlToValidate="EVTP" ValidationGroup="grp_est" runat="server" Display="None" ErrorMessage="EVTP Missing"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row" style="margin: 15px" hidden>
                            <fieldset class="fieldset1">
                                <legend style="color: #3C8DBC;" id="ReqLegend" class="legend1">Requirement 2017-2018</legend>
                                <div class="form-group">



                                    <asp:TextBox Width="75px" ID="PSO_REC" placeholder="PSO App" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="PSO_REC" runat="server" Display="None" ErrorMessage="Numbers allowed" ValidationExpression="\d+" ValidationGroup="VGNew"></asp:RegularExpressionValidator>

                                    <asp:TextBox Width="75px" ID="PLANS_REC" placeholder="Rec by Plans" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="PLANS_REC" runat="server" Display="None" ErrorMessage="Numbers allowed" ValidationExpression="\d+" ValidationGroup="VGNew"></asp:RegularExpressionValidator>

                                    <asp:TextBox Width="75px" ID="DCAS_SUP_REC" placeholder="DCAS Supp" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="DCAS_SUP_REC" runat="server" Display="None" ErrorMessage="Numbers allowed" ValidationExpression="\d+" ValidationGroup="VGNew"></asp:RegularExpressionValidator>



                                </div>
                            </fieldset>
                        </div>

                    </div>

                    <%-- <div style="display:none" id="Sub-foam" class="box box-primary">
            <div class="box-body">

                <input type="text" placeholder="Part No" id="PartNo" style="width:15%" />
                <input type="text" placeholder="Nomenclature" id="Nomenclature" style="width:15%" />
                <input type="text" placeholder="ERRC" id="ERRC" style="width:15%" />
                <input type="text" placeholder="Type" id="Type" style="width:15%" />
                <div class="row" style="margin:15px">
                    <fieldset class="fieldset1" style="margin-bottom:10px !important">
                        <legend id="ReqLegend" class="legend1">Definitize Asset Details</legend>
                        <div class="form-group">
                            <input type="number" style="width:15%" id="AuthAsset" placeholder="Auth Asset" />
                            <input type="number" style="width:15%" id="Holding" placeholder="Holding" />
                            <input type="number" style="width:15%" id="Demanded" placeholder="Demanded" />
                        </div>
                    </fieldset>
                </div>
                <input type="number" placeholder="Req Quantity" id="ReqQuantity" style="width:15%" />
                <input type="number" placeholder="Unit Cost" id="UnitCost" style="width:15%" />

                <input type="number" placeholder="Net Demanded Value" id="NetDemandedValue" style="width:15%" />

            </div>
        </div>--%>
                </div>
            </asp:Panel>
        </div>
        
       
                             </div>
        <div class="modal fade in" id="bardetailsmodal"  style="z-index: 110000;" tabindex="-1" role="dialog" aria-labelledby="myAddRoleModal">
            <div class="modal-dialog modal-wide-width" style="width: 60%;" role="document">
              <div class="modal-content">
                  <div class="modal-header modal-header-primary">
                    <button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
                    <h4 class="modal-title">Budget Estimation Statistics</h4>
                  </div>
                  <div class="modal-body" style="margin: 10px;">
          
                    
                   
                           
                            <iframe src="Test.aspx" width="100%" height="400" style="border: none;"></iframe>
                       
                        <br><br>
            
                    
                  </div>
                  <!-- <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                  </div> -->
                </div>
             </div>
          </div>

        <div class="modal fade" id="drilldetailsmodal" style="z-index: 110000;" tabindex="-1" role="dialog" aria-labelledby="myAddRoleModal">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header modal-header-primary">
                    <button type="button" data-dismiss="modal" aria-hidden="true" class="close">×</button>
                    <h4 id="modal-header-primary-label" class="modal-title">Budget Estimation Statistics</h4>
                  </div>
                  <div class="modal-body" style="margin: 10px;">
          
                    <div id="drilldetails" style="display: none; width: 550px;">

                    </div>
                  </div>
                  <!-- <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                  </div> -->
                </div>
             </div>
          </div>
  <!-- END ADD REGION MODAL -->
        
        <div id="GridDiv" runat="server" class="col-md-10 col-lg-10">

            <h3 id="TReq" runat="server" style="color: #1D74D6; margin: 0px">Total Requirements</h3>

            <div runat="server" id="MainDetails" class="box box-info">

                <div class="box-body">

                    <div id="gridContainer" style="overflow: auto; height: 300px;">

                        <%--GridLines="None" Width="99%"--%>
                        <asp:GridView ID="GridEstimates" DataKeyNames="FY,DTE_SYMBOL,APPENDIX,SER_NO,DESCRIPTION,PROJECT_ID,PDIB_STATUS,PDIB_MEETING_NO,PRIORITY,EQUIPMENT_CAT,WEAPON_SYS,AMT_DEMANDED_LAST_YEAR,AMT_ALLOCATED_LAST_YEAR,JUSTIFICATION" OnRowDataBound="GridEstimates_RowDataBound" ShowFooter="true" OnRowCommand="GridEstimates_RowCommand" CssClass="Grid" Width="99%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDeleting="GridEstimates_RowDeleting" OnRowCreated="GridEstimates_RowCreated">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
                            <AlternatingRowStyle BackColor="White" />
                            <RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
                            <HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EmptyDataRowStyle BackColor="#EFF3FB" />

                            <Columns>

                                <asp:BoundField DataField="SNO" HeaderText="Sr No" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>


                                <%-- <asp:BoundField DataField="SNO" HeaderText="Sr No" Visible="True">
                                             
                                            </asp:BoundField>--%>


                                <asp:TemplateField>
                                    <HeaderTemplate>Description</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="lblDescWithToolTip" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <%-- <asp:TemplateField>
                                    <HeaderTemplate>Eqpmt Cat</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label style="color: #3C8DBC;font-weight: 700;"  ID="lblEqpmt_Cat"  runat="server" Text='<%#Eval("EQUIPMENT_CAT_DECODE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <%-- <asp:Label style="color: #3C8DBC;font-weight: 700;"  ID="Label1" Text="Total" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>--%>

                                <%-- <asp:BoundField DataField="EQUIPMENT_CAT_DECODE" HeaderText="Eqpmt Cat" Visible="True"></asp:BoundField>
                                --%>



                                <%--     <asp:BoundField DataField="AMT_ALLOC_LAST_TO_LAST" HeaderText="Alloc" Visible="True"></asp:BoundField>--%>

                                <asp:TemplateField>
                                    <HeaderTemplate>Dem</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="lblDEMANDED_LAST" runat="server" Text='<%#Eval("AMT_DEMANDED_LAST_YEAR") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="lblDemdTotal" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <%--<asp:BoundField DataField="AMT_DEMANDED_LAST_YEAR" HeaderText="Dem" Visible="True"></asp:BoundField>--%>

                                <%--<asp:BoundField DataField="AMT_ALLOCATED_LAST_YEAR" HeaderText="Alloc" Visible="True"></asp:BoundField>--%>
                                <asp:TemplateField>
                                    <HeaderTemplate>Alloc</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="lblAlloc_LAST" runat="server" Text='<%#Eval("AMT_ALLOCATED_LAST_YEAR") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="lblAlloc_LASTTotal" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Req</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="lblALLOC" runat="server" Text='<%#Eval("CURRENT_REQ") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="lblAllocTotal" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Justification</HeaderTemplate>

                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="lblJustWithToolTip" runat="server" Text='<%#Eval("JUSTIFICATION") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Desc">
                                    <ItemTemplate>

                                        <asp:ImageButton ID="ImgBtnEdtit" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/assets/img/1477300690_icon-136-document-edit.png" runat="server"
                                            CommandName="addDes" ToolTip="Add Description" CommandArgument='<%#Eval("SER_NO") %>' />

                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>



                                <%--    <asp:BoundField DataField="FY" HeaderText="FY" Visible="True" />--%>
                                <%-- <asp:BoundField DataField="DTE_SYMBOL" HeaderText="DTE SYMBOL" Visible="True" />
                                        <asp:BoundField DataField="APPENDIX" HeaderText="APPENDIX" Visible="True" />
                                        <asp:BoundField DataField="CURRENCY" HeaderText="CURRENCY" Visible="True" />

                                        <asp:BoundField DataField="REQUIREMENT_TYPE" HeaderText="REQUIREMENT TYPE" Visible="True" />
                                        <asp:BoundField DataField="PURCHASE_TYPE" HeaderText="PURCHASE TYPE" Visible="True" />
                                        <asp:BoundField DataField="UTILIZATION_MODE" HeaderText="UTILIZATION MODE" Visible="True" />--%>
                            </Columns>


                        </asp:GridView>

                        <asp:GridView ID="GridViewCaryOver" ShowFooter="true" DataKeyNames="FY,DTE_SYMBOL,APPENDIX,SER_NO,DESCRIPTION,PROJECT_ID,PDIB_STATUS,PDIB_MEETING_NO,PRIORITY,EQUIPMENT_CAT,WEAPON_SYS,AMT_DEMANDED_LAST_YEAR,AMT_ALLOCATED_LAST_YEAR,JUSTIFICATION,CURRENT_REQ,ESTIMATED_TO_BE_PAID" OnRowCommand="GridViewCaryOver_RowCommand" CssClass="Grid" Width="99%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDeleting="GridViewCaryOver_RowDeleting">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
                            <AlternatingRowStyle BackColor="White" />
                            <RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
                            <HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EmptyDataRowStyle BackColor="#EFF3FB" />

                            <Columns>

                                <asp:BoundField DataField="SNO" HeaderText="Sr No" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>


                                <%-- <asp:BoundField DataField="SNO" HeaderText="Sr No" Visible="True">
                                             
                                            </asp:BoundField>--%>


                                <asp:TemplateField>
                                    <HeaderTemplate>Contract No</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="lblDescWithToolTip" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField>
                                    <HeaderTemplate>Contract Amount</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" ID="lblEqpmt_Cat" runat="server" Text='<%#Eval("CONTRACT_VALUE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <%-- <asp:Label style="color: #3C8DBC;font-weight: 700;"  ID="Label1" Text="Total" runat="server" />--%>
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <%-- <asp:BoundField DataField="EQUIPMENT_CAT_DECODE" HeaderText="Eqpmt Cat" Visible="True"></asp:BoundField>
                                --%>



                                <%--     <asp:BoundField DataField="AMT_ALLOC_LAST_TO_LAST" HeaderText="Alloc" Visible="True"></asp:BoundField>--%>
                                <asp:TemplateField>
                                    <HeaderTemplate>Paid Till LFY</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("PAID_TILL_LFY") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Est Paid</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("ESTIMATED_TO_BE_PAID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <%--<asp:BoundField DataField="AMT_DEMANDED_LAST_YEAR" HeaderText="Dem" Visible="True"></asp:BoundField>--%>

                                <%--<asp:BoundField DataField="AMT_ALLOCATED_LAST_YEAR" HeaderText="Alloc" Visible="True"></asp:BoundField>--%>
                                <asp:TemplateField>
                                    <HeaderTemplate>Paid Till Now</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("PAID_TILL_NOW") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>Req</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("AMT_ALLOC_LAST_TO_LAST") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div style="padding: 0 0 5px 0">
                                            <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>

                                        <asp:ImageButton ID="ImgBtnEdit" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/assets/img/1477300690_icon-136-document-edit.png" runat="server"
                                            CommandName="edt" ToolTip="Edit" CommandArgument='<%#Eval("SNO") %>' />

                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>

                                        <asp:ImageButton ID="ImgBtndel1" CssClass="vertical-align-mid" ImageUrl="~/assets/img/clear.png" runat="server"
                                            CommandName="delete" ToolTip="Delete" CommandArgument='<%#Eval("SNO") %>' />

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

    <div class="row">

        <div id="SubFormGrid" runat="server" class="col-md-10 col-lg-10">
            <h3 id="DesDetail" runat="server" style="color: #1D74D6; margin: 0px">Description Detail</h3>
            <div class="box box-info" runat="server" id="Div1">

                <div class="box-body">
                    <asp:GridView ID="GridViewEstDetail"
                        DataKeyNames="SER_NO,PARTS_NO_NSN,NOMENCLATURE,ERRC_CODE,DTE_SYMBOL,AMOUNT_REC_BGT,FY,HOLD_QTY,PRICE_PER_UNIT,QTY_AUTH,QTY,TOTAL_REQ" OnRowCommand="GridViewEstDetail_RowCommand" ShowFooter="true" CssClass="Grid" Width="99%" AllowPaging="false" runat="server" AutoGenerateColumns="false" CellPadding="4" AllowSorting="True" OnRowDeleting="GridViewEstDetail_RowDeleting">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle CssClass="cssPager" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Names="Verdana" />
                        <AlternatingRowStyle BackColor="White" />
                        <RowStyle CssClass="GridviewScrollItem" BackColor="#EFF3FB" />
                        <HeaderStyle CssClass="GridviewScrollHeader ListHeader newlocked" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EmptyDataRowStyle BackColor="#EFF3FB" />

                        <Columns>

                            <asp:BoundField DataField="SNO" HeaderText="Sr No" ItemStyle-BackColor="#EFEFEF"></asp:BoundField>

                            <asp:TemplateField>
                                <HeaderTemplate>Part No</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("PARTS_NO_NSN") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField>
                                <HeaderTemplate>Nom</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("NOMENCLATURE") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div style="padding: 0 0 5px 0">
                                    </div>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <HeaderTemplate>ERRC</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("ERRC_CODE") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div style="padding: 0 0 5px 0">
                                    </div>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Auth Asset</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("QTY_AUTH") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div style="padding: 0 0 5px 0">
                                    </div>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Holding</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("HOLD_QTY") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div style="padding: 0 0 5px 0">
                                    </div>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <HeaderTemplate>Quantity</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("QTY") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Unit Cost</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("PRICE_PER_UNIT") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Total Req</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label Style="color: #3C8DBC; font-weight: 700;" runat="server" Text='<%#Eval("TOTAL_REQ") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>

                                    <asp:ImageButton ID="ImgBtnEdit1" Height="18px" CssClass="vertical-align-mid" ImageUrl="~/assets/img/1477300690_icon-136-document-edit.png" runat="server"
                                        CommandName="edt" ToolTip="Edit" CommandArgument='<%#Eval("SNO") %>' />

                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>

                                    <asp:ImageButton ID="ImgBtndel2" CssClass="vertical-align-mid" ImageUrl="~/assets/img/clear.png" runat="server"
                                        CommandName="delete" ToolTip="Delete" CommandArgument='<%#Eval("SNO") %>' />

                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>


                    </asp:GridView>

                </div>
            </div>

        </div>
    </div>


    <script type="text/javascript">

        //var parameters = ["_FirstName", 'aasim', "_LastName", 'sajjad'];

        //var paramList = '';
        //if (parameters.length > 0) {
        //    for (var i = 0; i < parameters.length; i += 2) {
        //        if (paramList.length > 0) paramList += ',';
        //        paramList += '"' + parameters[i] + '":"' + parameters[i + 1] + '"';
        //    }
        //}

        //paramList = '{' + paramList + '}';
        //console.log(paramList);
        paramList = {
            '_FirstName': 'aasim',
            '_LastName': 'sajjad'
        };
        paramList = JSON.stringify(paramList);
        $.ajax({
            type: "POST",
            url: 'BgtEstQry.aspx/handleAjaxRequest',
            contentType: 'application/json; charset=utf-8',
            data: paramList,
            dataType: 'json',
            success: function (data, status, xhr) {
                console.log(data);
            }
        });
        //$("#showgraph_view").click(function () {

        //    $.ajax({
        //        type: "POST",
        //        url: "BgtEstQry.aspx/GetCustomers",
        //        data: '{}',
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",

        //        success: function (response) {

        //            alert('sss');
        //        },
        //        failure: function (response) {

        //            alert(response.d);
        //        },
        //        error: function (response) {
        //            alert(response.d);
        //        }
        //    });
        //    //$.ajax({
        //    //    type: "GET",
        //    //    url: "BgtEstQry.aspx/GetCustomers",
        //    //    cache: false,
        //    //    success: function (data) {
        //    //        alert(data);
        //    //        $('#barRain').html("");
        //    //        console.log(data);
        //    //        $('#barRain').html(data);
        //    //    }
        //    //});
        //});
        //$("#showgraph_view").click(function () {
        //    //$(document.getElementById("MainContent_g")).removeClass("col-md-10 col-lg-10");
        //            //$(document.getElementById("MainContent_g")).addClass("col-md-6 col-lg-6");

        //            //$(document.getElementById("graphview_div")).removeClass("col-md-1");
        //            //$(document.getElementById("graphview_div")).addClass("col-md-6 col-lg-6");

        //            $('#barRain').highcharts({
        //                chart: {
        //                    type: 'column'
        //                },
        //                title: {
        //                    text: 'Budget Estimation Statistics'
        //                },
        //                subtitle: {
        //                    text: 'Budget Value'
        //                },
        //                xAxis: {
        //                    categories: [
        //                        'Jan',
        //                        'Feb',
        //                        'Mar',
        //                        'Apr',
        //                        'May',
        //                        'Jun',
        //                        'Jul',
        //                        'Aug',
        //                        'Sep',
        //                        'Oct',
        //                        'Nov',
        //                        'Dec'
        //                    ],
        //                    crosshair: true
        //                },
        //                yAxis: {
        //                    min: 0,
        //                    title: {
        //                        text: 'Cost (total)'
        //                    }
        //                },
        //                tooltip: {
        //                    headerFormat: '<span style="margin-left: 20px; font-size: 14px; font-weight: bold;">{point.key}</span><table>',
        //                    pointFormat: '<tr><td></td><td><span style="color: {series.color};"> {series.name} </span> </td><td ><span style="margin-left: 20px;"> {point.y: 1f}</span></td></tr>',
        //                    footerFormat: '</table>',
        //                    shared: true,
        //                    useHTML: true
        //                },
        //                plotOptions: {
        //                    series: {
        //                        cursor: 'pointer',
        //                        //point: {
        //                        events: {
        //                            click: function(event){
        //                                //console.log(event);
        //                                //console.log(event.point.category);
        //                                //console.log(event.currentTarget._i);
        //                                var clickedCategory = event.currentTarget._i;
        //                                var category = '';

        //                                //Ajax request to show details of that category ..... offcourse we can do alot more now :)

        //                                //console.log('Officers & month: '+ event.point.category+ ' & value : '+event.point.y);


        //                                $('#drilldetails').highcharts({
        //                                    chart: {
        //                                        plotBackgroundColor: null,
        //                                        plotBorderWidth: null,
        //                                        plotShadow: false
        //                                    },
        //                                    title: {
        //                                        text: 'Budget Estimation Statistics For The Month Of <b>' + event.point.category
        //                                    },
        //                                    tooltip: {
        //                                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        //                                    },
        //                                    plotOptions: {
        //                                        pie: {
        //                                            allowPointSelect: true,
        //                                            cursor: 'pointer',
        //                                            dataLabels: {
        //                                                enabled: true,
        //                                                color: '#000000',
        //                                                connectorColor: '#000000',
        //                                                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
        //                                            }
        //                                        }
        //                                    },
        //                                    series: [{
        //                                        type: 'pie',
        //                                        name: 'Budget Share',
        //                                        data: [
        //                                            ['Demand', 45.0],

        //                                            {
        //                                                name: 'Allocation',
        //                                                y: 12.8,
        //                                                sliced: true,
        //                                                selected: true
        //                                            },
        //                                            ['Required', 8.5],
        //                                            ['Miscellenous', 6.2],
        //                                            ['Others', 0.7]
        //                                        ]
        //                                    }]
        //                                });

        //                                $("#drilldetails").show();
        //                                $("#drilldetailsmodal").modal('show');

        //                            }
        //                        }
        //                        //} 
        //                    },
        //                    /*column: {
        //                        pointPadding: 0.2,
        //                        borderWidth: 0
        //                    }*/
        //                },
        //                series: [{
        //                    name: 'Demand',
        //                    data: [1228, 3323, 2213, 4333,21234, 3, 115, 6, 22, 1823, 1112, 434]
        //                }, {
        //                    name: 'Allocation',
        //                    data: [1151, 342, 3337, 632, 10230, 720, 4120, 333, 702, 903, 110, 1220]
        //                }, {
        //                    name: 'Required',
        //                    data: [6218, 3440, 6170, 330, 8031, 220, 20, 60, 8110, 330, 9120, 1230]
        //                }, {
        //                    name: 'Miscellenous',
        //                    data: [4320, 3120, 1030, 630, 4320, 10, 2380, 30, 4230, 9110, 1320, 3230]
        //                }]
        //            });


        //            $("#bardetailsmodal").show();
        //            $("#bardetailsmodal").modal('show');
        //});

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>

