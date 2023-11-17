<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraphPageBPCRs.aspx.cs" Inherits="BMSWeb.Pages.GraphPageBPCRs" %>

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

    <%--<script src="../Scripts/AdminLTE/jquery.nicescroll.js"></script>--%>

    <script src="../Scripts/AdminLTE/scripts.js"></script>
    <script src="../assets/highcharts/js/highcharts.js"></script>
    <script src="../Assets/highcharts/js/modules/exporting.js"></script>
    <script src="../Assets/highcharts/js/modules/offline-exporting.js"></script>
    <script src="../Assets/highcharts/js/highcharts-3d.js"></script>
    <script src="../Scripts/pattern-fill-v2.js"></script>
	<style>
		g{
	stroke:Green !important;
	  
}
/*path{
	
   stroke:Green !important;
 
}*/
tspan{
	font-size:16px !important;
}
	</style>
    <script type="text/javascript">
        //Highcharts.setOptions({
        //    colors: ['#008000', '#5B5C5F', '#00F1FD', '#0065FD', '#B300FD', '#E49808', '#1EFF05', '#DBB7FB'],
        //    height: '100',
        //    width: '100'
        //});
        Highcharts.setOptions({
            //negativeColors: ['#DBB7FB'],
            //negativeColor:'Blue',
            colors: ['#008000', '#5B5C5F', '#00F1FD', '#0065FD', '#B300FD', '#E49808', '#1EFF05', '#DBB7FB'],

        });
        $(document).ready(function () {

            //$(window).on("load", (function (e) {
            var b = Number($("#TotalRs_OandM").val());
            var a = Number($("#RecRs_OandM").val());

            var d = Number($("#TotalRs_NM").val());
            var c = Number($("#RecRs_NM").val());

            var b1 = Number($("#LPTotalRs_OandM").val());
            var a1 = Number($("#LPRecRs_OandM").val());

            var d1 = Number($("#LPTotalRs_NM").val());
            var c1 = Number($("#LPRecRs_NM").val());

            var d2 = Number($("#TotalRs_RRC").val());
            var c2 = Number($("#RecRs_RRC").val());
            if (b<0) {
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
            if (b1 < 0) {
            	PrintGraphLPNeg(a1, b1)
            }
            else {
            	PrintGraphLP(a1, b1)
            }
            
            if (d1 < 0) {
            	PrintGraphLP1Neg(c1, d1)
            }
            else {
            	PrintGraphLP1(c1, d1)
            }

            if (d2 < 0) {
            	PrintGraphRRCNeg(c2, d2);
            }
            else {
            	PrintGraphRRC(c2, d2);
            }

         
        });
        function PrintGraph(a, b) {

            $('#ChartOandM').highcharts({
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    },


                },
                title: {
                    text: 'Central Purchase (O&M) <p color="Green">2000.000</p>'
                },

                plotOptions: {
                    pie: {
                        innerSize: 30,
                        depth: 30
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
        				alpha: 45
        			},


        		},
        		title: {
        			text: 'Central Purchase (O&M) <p color="Green">2000.000</p>'
        		},

        		plotOptions: {
        			pie: {
        				innerSize: 30,
        				depth: 30
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
        		        color: 'Green',

        		        connectorColor: 'Green',
        		        //formatter: function () {
        		        //	return 'Amount-' + (this.point.index - 1);
        		        //}
        		    }
        		}]
        	});
        }

        function PrintGraphRRC(a, b) {

            $('#RRCChart').highcharts({
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    },


                },
                title: {
                    text: 'RRC Ceiling <p color="Green">1500.000</p>'
                },

                plotOptions: {
                    pie: {
                        innerSize: 30,
                        depth: 30
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

        	$('#RRCChart').highcharts({
        		chart: {
        			type: 'pie',
        			options3d: {
        				enabled: true,
        				alpha: 45
        			},


        		},
        		title: {
        			text: 'RRC Ceiling <p color="Green">1500.000</p>'
        		},

        		plotOptions: {
        			pie: {
        				innerSize: 30,
        				depth: 30
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
        		        color: 'Green',

        		        connectorColor: 'Green',
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
                    text: 'Central Purchase (NM) <p color="Green">3000.000</p>'
                },

                plotOptions: {
                    pie: {
                        innerSize: 30,
                        depth: 30
                    }
                },
                series: [{
                    name: 'Amount',
                    data: [['Allocated', a],
                    ['Remaining', b]]
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
        			text: 'Central Purchase (NM) <p color="Green">3000.000</p>'
        		},

        		plotOptions: {
        			pie: {
        				innerSize: 30,
        				depth: 30
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
        		        color: 'Green',

        		        connectorColor: 'Green',
        		        //formatter: function () {
        		        //	return 'Amount-' + (this.point.index - 1);
        		        //}
        		    }
        		}]
        	});
        }
        function PrintGraphLP(a, b) {

            $('#LPChartOandM').highcharts({
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    },


                },
                title: {
                    text: 'Local Purchase (O&M) <p color="Green">750.000</p>'
                },

                plotOptions: {
                    pie: {
                        innerSize: 30,
                        depth: 30
                    }
                },
                series: [{
                    name: 'Amount',
                    data: [['Allocated', a],
                    ['Remaining', b]]
                }]
            });
        }
        function PrintGraphLPNeg(a, b) {

        	$('#LPChartOandM').highcharts({
        		chart: {
        			type: 'pie',
        			options3d: {
        				enabled: true,
        				alpha: 45
        			},


        		},
        		title: {
        			text: 'Local Purchase (O&M) <p color="Green">750.000</p>'
        		},

        		plotOptions: {
        			pie: {
        				innerSize: 30,
        				depth: 30
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
        		        color: 'Green',

        		        connectorColor: 'Green',
        		        //formatter: function () {
        		        //	return 'Amount-' + (this.point.index - 1);
        		        //}
        		    }
        		}]
        	});
        }
        function PrintGraphLP1(a, b) {
           // console.log(a, b);
            $('#LPChartNM').highcharts({
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }

                },
                title: {
                    text: 'Local Purchase (NM) <p color="Green">750.000</p>'
                },

                plotOptions: {
                    pie: {
                        innerSize: 30,
                        depth: 30
                    }
                },
                series: [{
                    name: 'Amount',
                    data: [['Allocated', a],
                    ['Remaining', b]]
                }]
            });
        }
        function PrintGraphLP1Neg(a, b) {
        	// console.log(a, b);
        	$('#LPChartNM').highcharts({
        		chart: {
        			type: 'pie',
        			options3d: {
        				enabled: true,
        				alpha: 45
        			}

        		},
        		title: {
        			text: 'Local Purchase (NM) <p color="Green">750.000</p>'
        		},

        		plotOptions: {
        			pie: {
        				innerSize: 30,
        				depth: 30
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
        	            color: 'Green',

        	            connectorColor: 'Green',
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
        hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 1px !important;
    border-top: 5px solid #000 !important;
}
    </style>
</head>
<body>
    <form id="form1" runat="server" style="height:730px">
        <input style="display:none" id="TotalRs_OandM" runat="server" type="text" value="" />
        <input style="display:none" id="RecRs_OandM" runat="server" type="text" value="" />
                      
                      
        <input style="display:none" id="TotalRs_NM" value="" runat="server" />
        <input style="display:none" id="RecRs_NM" value="" runat="server" />

        <input style="display:none" id="LPTotalRs_OandM" runat="server" type="text" value="" />
        <input style="display:none" id="LPRecRs_OandM" runat="server" type="text" value="" />
                      
                      
        <input style="display:none" id="LPTotalRs_NM" value="" runat="server" />
        <input style="display:none" id="LPRecRs_NM" value="" runat="server" />

       <input style="display:none" id="TotalRs_RRC" value="" runat="server" />
        <input style="display:none" id="RecRs_RRC" value="" runat="server" />

        <div class="row" style="height:33%; padding:0px">

            <div class="col-lg-6 col-md-6 col-sm-6" enableviewstate="true" visible="true" style="height: 100%; text-align: center; align-content: center" id="ChartOandM" runat="server">
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6" enableviewstate="true" visible="true" style="height: 100%; text-align: center; align-content: center" id="ChartNM" runat="server">
            </div>

        </div>
      <%--  <hr />--%>
        <div class="row" style="height:33%;padding:0px">

            <div class="col-lg-6 col-md-6 col-sm-6" enableviewstate="true" visible="true" style="height: 100%; text-align: center; align-content: center" id="LPChartOandM" runat="server">
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6" enableviewstate="true" visible="true" style="height: 100%; text-align: center; align-content: center" id="LPChartNM" runat="server">
            </div>

        </div>
         <div class="row" style="height:33%;padding:0px">

            <div class="col-lg-6 col-md-6 col-sm-6" enableviewstate="true" visible="true" style="height: 100%; text-align: center; align-content: center" id="RRCChart" runat="server">
            </div>
        </div>
    </form>
</body></html>
