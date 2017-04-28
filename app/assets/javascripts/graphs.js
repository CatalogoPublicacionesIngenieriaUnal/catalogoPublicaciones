function test001(){
  var dataArray = [23, 13, 21, 14, 37, 15, 18, 34, 30];
  var dataText = ["uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve"];
  var svg = d3.select("#graph").append("svg").attr("height","100%").attr("width","100%");

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
}

function categ(){
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: 'dataTest',
       dataType: 'json',
       success: function (data) {
        //json_data = data;
        //console.log(data);
        graficar2(data);
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function them(){
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: 'dataTheme',
       dataType: 'json',
       success: function (data) {
        //json_data = data;
        //console.log(data);
        graficar2(data);
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}
//console.log(json_data);

// function graficar(){
//
//   a = d3.select("#graficas").attr("height","80%").attr("width","80%");
//   a.append("rect").attr("fill","white").attr("height","100%").attr("width","100%").attr("x",0).attr("y",0);
//   a.append("rect").attr("class","barra").attr("height",20).attr("width",100).attr("x",10).attr("y",10);
//   var max = 0;
//   for( i = 0; i <= json_data.length; i++ ){
//     count = json_data[i].count;
//     console.log(count);
//     if( count > max ){ max = count; }
//   }
//   console.log( max );
// }

function graficar2(data){
  a = d3.select("#graficas").attr("height", data.length * 30 + 10 ).attr("width","80%");
  // var asda = document.getElementById("graficas");
  // var cosa = $('.graf')[0].getBoundingClientRect().width  ;
  a.append("rect").attr("fill","white").attr("height","100%").attr("width","100%").attr("x",0).attr("y",0);
  //a.append("rect").attr("class","barra").attr("height",20).attr("width", asda.width.baseVal.value ).attr("x",10).attr("y",10);
  var max = 0;
  for( i = 0; i < data.length; i++ ){
    count = data[i][1];
    //console.log(count);
    if( count > max ){ max = count; }
    a.append("rect")
      .attr("class","barra")
      .attr("height",20)
      .attr("width", count * 50 )
      .attr("x", 25)
      .attr("y", 30 * i + 10 );

    a.append("text")
      .text( data[i][0] )
      .attr("class","texto")
      .attr("x", 30)
      .attr("y", 30 * i + 25 );

    a.append("text")
      .text( count )
      .attr("class","texto")
      .attr("x", 10 )
      .attr("y", 30 * i + 25 );
}
  //console.log( asda );
}
