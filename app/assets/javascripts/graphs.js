var dataArray = [23, 13, 21, 14, 37, 15, 18, 34, 30];
var dataText = ["uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve"];
var svg = d3.select("body").append("svg").attr("height","100%").attr("width","100%");

svg.selectAll("rect")
.data(dataArray)
.enter().append("rect")
.attr("class","barra")
.attr("height",20)
.attr("width",function(d,i){ return d * 10 })
.attr("x", 10)
.attr("y", function(d, i){ return (i * 25) + 5 });

svg.selectAll("text")
.data(dataText)
.enter().append("text")
.text(function(d){ return d; })
.attr("class","text")
.attr("x", 10 )
.attr("y", function(d, i){ return (i * 25) + 20 });
