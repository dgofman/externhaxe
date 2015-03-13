Extern libraries for Haxe JS

Highcharts.hx:

> var highcharts"Highcharts = new Highcharts({
> chart: {
> > renderTo: "chartcontainer",
> > marginLeft: 50

> },
> xAxis: {
> > title: {
> > > enabled: true,
> > > margin: -5,
> > > offset: 30

> > }

> },
> yAxis: {
> > title: {
> > > text: ""

> > },

> },
> legend: {
> > layout: "vertical",
> > align: "right",
> > verticalAlign: "top",
> > borderWidth: 1,
> > enabled: true

> }
> });

JQGrid.hx:

> var table:JQuery = new JQuery("#datagridtable");
> var dataGrid:JQGrid = JQGridHelper.create(table,
> {
> > datatype: "local",
> > colNames: colNames,
> > colModel: colModel,
> > rowNum: 9999

> });

Underscore.hx:

> Underscore.template(new JQuery("#myTemplate").html(), { name: name, type:type} );

JQueryUI.hx:

> if(JQueryUI.ui.ddmanager.current && JQueryUI.ui.ddmanager.current.