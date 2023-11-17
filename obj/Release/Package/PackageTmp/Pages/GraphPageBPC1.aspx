<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraphPageBPC1.aspx.cs" Inherits="BMSWeb.Pages.GraphPageBPC1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">



    <%: Scripts.Render("~/bundles/jquery") %>
    <%: Scripts.Render("~/bundles/bootstrap")%>
    <%: Scripts.Render("~/bundles/jqueryui")%>
    <%: Scripts.Render("~/bundles/datepicker")%>
    <%--<script src="../Scripts/MaskMoney.js"></script>--%>
    <%--<script src="../assets/js/uncompressed/jquery.maskedinput.js"></script>--%>
    <link href="../Content/css/skins/_all-skins.css" rel="stylesheet" />
	<link href="../Content/bootstrap.min.css" rel="stylesheet" />
	<link href="../Content/css/AdminLTE.css" rel="stylesheet" />
	<link href="../assets/AdminLTE.min.css" rel="stylesheet" />
	<link href="../Content/Site.css" rel="stylesheet" />
    <script src="../Scripts/app.min.js"></script>
<%--	<script src="../Scripts/pattern-fill-v2.js"></script>--%>
    <%--<script src="../Scripts/AdminLTE/jquery.nicescroll.js"></script>--%>

    <script src="../Scripts/AdminLTE/scripts.js"></script>
    <script src="../assets/highcharts/js/highcharts.js"></script>
    <script src="../Assets/highcharts/js/modules/exporting.js"></script>
    <script src="../Assets/highcharts/js/modules/offline-exporting.js"></script>
    <script src="../Assets/highcharts/js/highcharts-3d.js"></script>
		<script src="../Scripts/pattern-fill-v2.js"></script>
    <style>
g{
	stroke:Red !important;
	  
}
/*path{
	
   stroke:Red !important;
 
}*/
tspan{
	font-size:16px !important;
}
        .highcharts-series-group{
            font-family: "Lucida Grande", "Lucida Sans Unicode", Arial, Helvetica, sans-serif;
    font-size: 78px !important;
        }
    </style>
    <script type="text/javascript">
    	Highcharts.setOptions({
    		//negativeColors: ['#DBB7FB'],
    		//negativeColor:'Blue',
    		colors: ['#FF0000', '#5B5C5F', '#00F1FD', '#0065FD', '#B300FD', '#E49808', '#1EFF05', '#DBB7FB'],

    	});
    	$(document).ready(function () {

    		//$(window).on("load", (function (e) {
    		var b = Number($("#TotalFE_OandM").val());
    		var a = Number($("#RecFE_OandM").val());

    		var d = Number($("#TotalFE_NM").val());
    		var c = Number($("#RecFE_NM").val());

    		var d1 = Number($("#TotalFE_RRC").val());
    		var c1 = Number($("#RecFE_RRC").val());
    		if (b < 0) {
    			PrintGraphNeg(a, b)
    		}
    		else {
    			PrintGraph(a, b)
    		}


    		if (d < 0) {
    			PrintGraph1Neg(c, d)
    		}
    		else {
    			PrintGraph1(c, d)
    		}
    		if (d1 < 0) {
    			PrintGraphRRCNeg(c1, d1)
    		}
    		else {
    			PrintGraphRRC(c1, d1)
    		}

    	});
    	function PrintGraph(a, b) {

    		$('#ChartOandM').highcharts({
    			chart: {
    				type: 'pie',
    				options3d: {
    					enabled: true,
    					alpha: 45,
    					spacingTop: 20,
    					spacingLeft: 20,
    					spacingRight: 20,
    					spacingLeft: 20
    				},


    			},
    			title: {
    				text: 'Foreign Exchange (O&M) <p color="Red">125.000</p>'
    			},

    			plotOptions: {
    				pie: {
    					innerSize: 100,
    					depth: 45,
    					//  className: 'main-color',
    					//negativeColor: 'Green',
    					//color:'Red',
    				}
    			},
    			series: [{
    				name: 'Amount',
    				data: [['Allocated', a],
                    ['Remaining', b]]
    			}]
    		});
    	}
    	function PrintGraphNeg(a, b) {

    		$('#ChartOandM').highcharts({
    			chart: {
    				type: 'pie',
    				options3d: {
    					enabled: true,
    					alpha: 45,
    					spacingTop: 20,
    					spacingLeft: 20,
    					spacingRight: 20,
    					spacingLeft: 20
    				},


    			},
    			title: {
    				text: 'Foreign Exchange (O&M) <p color="Red">125.000</p>'
    			},

    			plotOptions: {
    				pie: {
    					innerSize: 100,
    					depth: 45,
    					//  className: 'main-color',
    					//negativeColor: 'Green',
    					//color:'Red',
    				}
    			},
    			series: [{
    				type: 'pie',
    				borderColor: Highcharts.getOptions().colors[0],
    				name: 'Amount',
    				data: [{
    					name: 'Allocated',
    					y: a,
    				//	color: 'url(#highcharts-default-pattern-0)'
    				}, {
    					name: 'Remaining',
    					y: b,
    					color: 'url(#highcharts-default-pattern-5)'
    				}],
    				dataLabels: {
    					color: 'Red',

    					connectorColor: 'Red',
    					//formatter: function () {
    					//	return 'Amount-' + (this.point.index - 1);
    					//}
    				}
    			}]
    		});
    	}
    	function PrintGraph1Neg(a, b) {

    		$('#ChartNM').highcharts({
    			chart: {
    				type: 'pie',
    				options3d: {
    					enabled: true,
    					alpha: 45
    				}

    			},
    			title: {
    				text: 'Foreign Exchange (NM) <p color="Red">200.000</p>'
    			},

    			plotOptions: {
    				pie: {
    					innerSize: 100,
    					depth: 45,
    					//  className: 'main-color',
    					// negativeColor:'green',

    				}
    			},

    			series: [{
    				type: 'pie',
    				borderColor: Highcharts.getOptions().colors[0],
    				name: 'Amount',
    				data: [{
    					name: 'Allocated',
    					y: a,
    					//color: 'url(#highcharts-default-pattern-0)'
    				}, {
    					name: 'Remaining',
    					y: b,
    					color: 'url(#highcharts-default-pattern-5)'
    				}],
    				dataLabels: {
    					color: 'Red',

    					connectorColor: 'Red',
    					//formatter: function () {
    					//	return 'Amount-' + (this.point.index - 1);
    					//}
    				}
    			}]
    		});
    	}

    	function PrintGraph1(a, b) {

    		$('#ChartNM').highcharts({
    			chart: {
    				type: 'pie',
    				options3d: {
    					enabled: true,
    					alpha: 45
    				}

    			},
    			title: {
    				text: 'Foreign Exchange (NM) <p color="Red">200.000</p>'
    			},

    			plotOptions: {
    				pie: {
    					innerSize: 100,
    					depth: 45,
    					//  className: 'main-color',
    					// negativeColor:'green',

    				}
    			},

    			series: [{
    				name: 'Amount',
    				data: [['Allocated', a],
                    ['Remaining', b]]
    			}]
    		});
    	}
    	function PrintGraphRRC(a, b) {

    		$('#ChartRRC').highcharts({
    			chart: {
    				type: 'pie',
    				options3d: {
    					enabled: true,
    					alpha: 45
    				},


    			},
    			title: {
    				text: 'RRC Ceiling <p color="Red">225.000</p>'
    			},

    			plotOptions: {
    				pie: {
    					innerSize: 100,
    					depth: 45
    				}
    			},
    			series: [{
    				name: 'Amount',
    				data: [['Allocated', a],
                    ['Remaining', b]]
    			}]
    		});
    	}
    	function PrintGraphRRCNeg(a, b) {

    		$('#ChartRRC').highcharts({
    			chart: {
    				type: 'pie',
    				options3d: {
    					enabled: true,
    					alpha: 45
    				},


    			},
    			title: {
    				text: 'RRC Ceiling <p color="Red">225.000</p>'
    			},

    			plotOptions: {
    				pie: {
    					innerSize: 100,
    					depth: 45
    				}
    			},
    			series: [{
    				type: 'pie',
    				borderColor: Highcharts.getOptions().colors[0],
    				name: 'Amount',
    				data: [{
    					name: 'Allocated',
    					y: a,
    				//	color: 'url(#highcharts-default-pattern-0)'
    				}, {
    					name: 'Remaining',
    					y: b,
    					color: 'url(#highcharts-default-pattern-5)'
    				}],
    				dataLabels: {
    					color: 'Red',

    					connectorColor: 'Red',
    					//formatter: function () {
    					//	return 'Amount-' + (this.point.index - 1);
    					//}
    				}
    			}]
    		});
    	}
    </script>
    <style>
        .highcharts-container {
            width: 100% !important;
            height: 100% !important;
        }
          .highcharts-title tspan {
    color: #00369E !important;
    font-size: 18px;
    fill: #00369E !important;
    font-family:Arial !important;
    width: 499px;
    font-weight:500;
}
		 .highcharts-graph{
			 stroke:green;
		  }
		 .highcharts-area.highcharts-negative{
			 stroke:blue
		 }
		 .highcharts-point.highcharts-negative{
			 fill:blue;
		 }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <input style="display:none" id="TotalFE_OandM" runat="server" type="text" value="" />
        <input style="display:none" id="RecFE_OandM" runat="server" type="text" value="" />
                      
                      
        <input style="display:none" id="TotalFE_NM" value="" runat="server" />
        <input style="display:none" id="RecFE_NM" value="" runat="server" />

        <input style="display:none" id="TotalFE_RRC" value="" runat="server" />
        <input style="display:none" id="RecFE_RRC" value="" runat="server" />
        <div class="row" style="height:360px;padding:0px">

            <div class="col-lg-6 col-md-6 col-sm-6" enableviewstate="true" visible="true" style="height: 100%; text-align: center; align-content: center" id="ChartOandM" runat="server">
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6" enableviewstate="true" visible="true" style="height: 100%; text-align: center; align-content: center" id="ChartNM" runat="server">
            </div>
        </div>
        <div class="row" style="height:360px;padding:0px">

            <div class="col-lg-6 col-md-6 col-sm-6" enableviewstate="true" visible="true" style="height: 100%; text-align: center; align-content: center" id="ChartRRC" runat="server">
            </div>
            
        </div>
       
    </form>
</body>
</html>



