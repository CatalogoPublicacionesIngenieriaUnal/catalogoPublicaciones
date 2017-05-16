function categ(){
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: 'dataCateg',
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

function categPie(){
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: 'dataCategPie',
       dataType: 'json',
       success: function (data) {
        //json_data = data;
        console.log(data);
        //graficarPie(data);
        svg = d3.select("#graficas");
        svg.selectAll("*").remove();
        svg.append("g").attr("id","donuTest");
        Donut3D.draw("donuTest", data, 150, 130, 130, 100, 30, 0.4);
        addText( data );
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function themePie(){
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: 'dataThemePie',
       dataType: 'json',
       success: function (data) {
        //json_data = data;
        console.log(data);
        //graficarPie(data);
        svg = d3.select("#graficas");
        svg.selectAll("*").remove();
        svg.append("g").attr("id","donuTest");
        Donut3D.draw("donuTest", data, 150, 130, 130, 100, 30, 0.4);
        addText( data );
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function statusPie(){
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: 'dataStatusPie',
       dataType: 'json',
       success: function (data) {
        //json_data = data;
        console.log(data);
        //graficarPie(data);
        svg = d3.select("#graficas");
        svg.selectAll("*").remove();
        svg.append("g").attr("id","donuTest");
        Donut3D.draw("donuTest", data, 150, 130, 130, 100, 30, 0.4);
        addText( data );
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function profDptoPie(){
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: '../professors/dataDepartmentPie',
       dataType: 'json',
       success: function (data) {
        //json_data = data;
        console.log(data);
        //graficarPie(data);
        svg = d3.select("#graficas");
        svg.selectAll("*").remove();
        svg.append("g").attr("id","donuTest");
        Donut3D.draw("donuTest", data, 150, 130, 130, 100, 30, 0.4);
        addText( data );
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function profGenderPie(){
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: '../professors/dataGenderPie',
       dataType: 'json',
       success: function (data) {
        //json_data = data;
        console.log(data);
        //graficarPie(data);
        svg = d3.select("#graficas");
        svg.selectAll("*").remove();
        svg.append("g").attr("id","donuTest");
        Donut3D.draw("donuTest", data, 150, 130, 130, 100, 30, 0.4);
        addText( data );
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function addText( data ){
  svg = d3.select("#graficas");
  for( i = 0; i < Math.ceil(data.length / 8); i++ ){
    for( j = 0; j < 8; j++ ){
      svg.append("text")
        .text( data[ i * 8 + j ].label )
        .attr( "class", "texto" )
        .attr("x", 350 + i * 150 )
        .attr("y", 30 * j + 50);
      svg.append("rect")
        .attr( "class","barra" )
        .attr( "height", 15 )
        .attr( "width", 15 )
        .attr( "x", 332 + i * 150)
        .attr( "y", 30 * j + 38 )
        .attr( "fill", data[ i * 8 + j ].color );
    }
  }
}

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
