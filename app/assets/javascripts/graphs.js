function categPie(){
  lediv = document.getElementById("addButtons").innerHTML = "";
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
        svg2 = d3.select("#monthChart");
        svg2.selectAll("*").remove();
        svg.append("g").attr("id","donuTest");
        Donut3D.draw("donuTest", data, 160, 140, 150, 120, 30, 0.3);
        addText( data );
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function themePie(){
  lediv = document.getElementById("addButtons").innerHTML = "";
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
        svg2 = d3.select("#monthChart");
        svg2.selectAll("*").remove();
        svg.append("g").attr("id","donuTest");
        Donut3D.draw("donuTest", data, 160, 140, 150, 120, 30, 0.3);
        addText( data );
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function statusPie(){
  lediv = document.getElementById("addButtons").innerHTML = "";
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: 'dataStatusPie',
       dataType: 'json',
       success: function (data) {
        //json_data = data;
        console.log(data);
        //graficarPie(data);
        svg2 = d3.select("#monthChart");
        svg2.selectAll("*").remove();
        svg = d3.select("#graficas");
        svg.selectAll("*").remove();
        svg.append("g").attr("id","donuTest");
        Donut3D.draw("donuTest", data, 160, 140, 150, 120, 30, 0.3);
        addText( data );
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function profDptoPie(){
  lediv = document.getElementById("addButtons").innerHTML = "";
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: '../professors/dataDepartmentPie',
       dataType: 'json',
       success: function (data) {
        //json_data = data;
        console.log(data);
        //graficarPie(data);
        svg2 = d3.select("#monthChart");
        svg2.selectAll("*").remove();
        svg = d3.select("#graficas");
        svg.selectAll("*").remove();
        svg.append("g").attr("id","donuTest");
        Donut3D.draw("donuTest", data, 160, 140, 150, 120, 30, 0.3);
        addText( data );
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function profGenderPie(){
  lediv = document.getElementById("addButtons").innerHTML = "";
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: '../professors/dataGenderPie',
       dataType: 'json',
       success: function (data) {
        //json_data = data;
        console.log(data);
        svg2 = d3.select("#monthChart");
        svg2.selectAll("*").remove();
        svg = d3.select("#graficas");
        svg.selectAll("*").remove();
        svg.append("g").attr("id","donuTest");
        Donut3D.draw("donuTest", data, 160, 140, 150, 120, 30, 0.3);
        addText( data );
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function appReqCreation(){
  lediv = document.getElementById("addButtons").innerHTML = "";
  $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: '../application_requests/dataRequestCreation',
       dataType: 'json',
       success: function (data) {
        svg = d3.select("#graficas");
        svg.selectAll("*").remove();
        lediv = document.getElementById("addButtons");
        for( i = 0; i < data.length; i++ ){
          btn = document.createElement("button");
          btn.innerHTML = data[i].label;
          btn.className += "button1 button2";
          btn.id = data[i].label;
          btn.onclick = function(){
            svg2 = d3.select("#monthChart");
            svg2.selectAll("*").remove();
            appReqCreationAux( data, this.id )
          };
          lediv.appendChild( btn );
        }
       },
      error: function (result) {
        console.log("error");
      },
      async: false
  });
}

function appReqCreationAux( dato, label ){

  var es_ES = {
    "decimal": ",",
    "thousands": ".",
    "grouping": [3],
    "currency": ["€", ""],
    "dateTime": "%a %b %e %X %Y",
    "date": "%d/%m/%Y",
    "time": "%H:%M:%S",
    "periods": ["AM", "PM"],
    "days": ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],
    "shortDays": ["Dom", "Lun", "Mar", "Mi", "Jue", "Vie", "Sab"],
    "months": ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
    "shortMonths": ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"]
  };

  var ES = d3.locale(es_ES);

  var data;
  var graphdata;
  for( i = 0; i < dato.length; i++ ){
    if(dato[i].label == label){
      graphdata = dato[i];
    }
  }
  console.log(graphdata.data);

  var m = [80, 80, 80, 80];
	var w = 850 - m[1] - m[3];
	var h = 400 - m[0] - m[2];

  data = graphdata.data

	var xLabels = d3.time.scale().domain([new Date(parseInt(label), 0, 1), new Date(parseInt(label), 11, 31)]).range([0, w]);
	var x = d3.scale.linear().domain([0, data.length]).range([0, w]);
	var y = d3.scale.linear().domain([0, d3.max(data)]).range([h, 0]);

	var line = d3.svg.line()
		.x(function(d,i) {
			return x(i);
		})
		.y(function(d) {
			return y(d);
		})

	var graph = d3.select("#monthChart")
    .append("svg:svg")
	      .attr("width", w + m[1] + m[3])
	      .attr("height", h + m[0] + m[2])
	    .append("svg:g")
	      .attr("transform", "translate(" + 120 + "," + m[0] + ")");

	var xAxis = d3.svg.axis().scale(xLabels).ticks(d3.time.months).tickFormat(ES.timeFormat("%B")).tickSize(-h).tickSubdivide(true);
	graph.append("svg:g")
	      .attr("class", "x axis")
	      .attr("transform", "translate(0," + h + ")")
	      .call(xAxis);

	var yAxisLeft = d3.svg.axis().scale(y).ticks(7).orient("left");
	graph.append("svg:g")
	      .attr("class", "y axis")
	      .attr("transform", "translate(-25,0)")
	      .call(yAxisLeft);

		graph.append("svg:path")
			.attr("d", line(data))
			.attr('class', 'line');
}

function addText( data ){
  svg = d3.select("#graficas");
  for( i = 0; i < Math.ceil(data.length / 8); i++ ){
    for( j = 0; j < 9; j++ ){
      svg.append("text")
        .text( data[ i * 9 + j ].label )
        .attr( "class", "texto" )
        .attr("x", 350 + i * 150 )
        .attr("y", 30 * j + 40);
      svg.append("rect")
        .attr( "class","barra" )
        .attr( "height", 15 )
        .attr( "width", 15 )
        .attr( "x", 332 + i * 150)
        .attr( "y", 30 * j + 28 )
        .attr( "fill", data[ i * 9 + j ].color );
    }
  }
}
