package highcharts;

/**
 * ...
 * @author David Gofman
 */

@:native("Highcharts.Chart")
extern class Highcharts 
{
	public function new(options:Dynamic):Void;
	
	/**
	 * Add a series dynamically after  time
	 *
	 * @param {Object} options The config options
	 * @param {Boolean} redraw Whether to redraw the chart after adding. Defaults to true.
	 * @param {Boolean|Object} animation Whether to apply animation, and optionally animation
	 *    configuration
	 *
	 * @return {Object} series The newly created series object
	 */
	public function addSeries(options:Dynamic, redraw:Bool=true, animation:Bool=true):Series;

	/**
	 * A reference to the containing HTML element as given in chart.renderTo.
	 */
	public var container:Dynamic;

	/**
	 * Removes the chart and purges memory. This method should be called beforewriting a new chart into the same container. 
	 * It is called internally on window unloadto prevent leaks.
	 */
	public function destroy():Void;
	
	/**
	 * Get an axis, series or point object by id.
	 * @param id {String} The id as given in the configuration options
	 */
	public function get(id:String):Dynamic;
		
	/**
	 * Get the currently selected points from all series
	 */
	public function getSelectedPoints():Array<Point>;
	
	/**
	 * Get the currently selected series
	 */
	public function getSelectedSeries():Array<Series>;

	/**
	 * Hide the loading layer
	 */
	public function hideLoading():Void;
	
	/**
	 * The options stucture for the chart.
	 */
	public var options:Dynamic;

	/**
	 * Exporting module required. Clears away other elements in the page and printsthe chart as it is displayed. 
	 * By default, when the exporting module is enabled,a button at the upper left calls this method.
	 */
	public function print():Void;

	/**
	 * Redraw the chart after changes have been done to the data or axis extremes. 
	 * All methodsfor updating axes, series or points have a parameter for redrawing the chart. 
	 * This istrue by default. But in many cases you want to do more than one operationon the chart before redrawing, 
	 * for example add a number of points. In those cases it isa waste of resources to redraw the chart for each new point added. 
	 * So you add the pointsand call chart.redraw() after.
	 */
	public function redraw():Void;
	
	public function render():Void;
	
	/**
	 * An array of all the chart's series.
	 */
	public var series:Array<Series>;

	/**
	 * Resize the box and re-align all aligned elements
	 * @param {Object} width
	 * @param {Object} height
	 * @param {Boolean} animate
	 *
	 */
	public function setSize(width:Float, height:Float, animate:Bool):Void;

	/**
	 * Update the axis title by options
	 */
	public function setTitle(newTitleOptions:Dynamic, redraw:Bool = true):Void;
	
	/**
	 * Dim the chart and show a loading text or symbol
	 * @param {String} str An optional text to show in the loading label instead of the default one
	 */
	public function showLoading(str:String):Void;
	
	/**
	 * An array of the chart's x axes. If only one x axis, it is referenced by chart.xAxis[0].
	 */
	public var xAxis:Array<Axis>;

	/**
	 * An array of the chart's y axes. If only one y axis, it is referenced by chart.yAxis[0].
	 */
	public var yAxis:Array<Axis>;
}

extern class Series
{
	/**
	 * Add a point dynamically after chart load time
	 * @param {Object} options Point options as given in series.data
	 * @param {Boolean} redraw Whether to redraw the chart or wait for an explicit call
	 * @param {Boolean} shift If shift is true, a point is shifted off the start
	 *    of the series as one is appended to the end.
	 * @param {Boolean|Object} animation Whether to apply animation, and optionally animation
	 *    configuration
	 */
	public function addPoint(options:Dynamic, redraw:Bool = true, shift:Bool = false, animation:Bool = true):Void;
	
	/**
	 * Read only. The chart that the series belongs to.
	 */
	public var chart:Highcharts;
	
	/**
	 * Read only. An array with the series' data point objects.
	 */
	public var data:Dynamic;
	
	/**
	 * Read only. The series name.
	 */
	public var name:String;

	/**
	 * Hides the series if visible. If the chart.ignoreHiddenSeries option is true,the chart is redrawn without this series.
	 */
	public function hide():Void;
	
	/**
	 * Read only. The series' options.
	 */
	public var options:Dynamic;

	/**
	 * Remove the series from the chart.
	 */
	public function remove(redraw:Bool=true):Void;

	/**
	 * Select or unselect the series. This means its selected property is set,the checkbox in the legend is toggled and when selected, 
	 * the series is returned in the chart.getSelectedSeries() method.
	 */
	public function select(select:Bool):Void;
	
	/**
	 * Read only. The series' selected state as set by series.select().
	 */
	public var selected:Bool;

	/**
	 * Replace the series data with a new set of data
	 * @param {Object} data
	 * @param {Object} redraw
	 */
	public function setData(data:Dynamic, redraw:Bool=true):Void;
	
	/**
	 * Show the graph
	 */
	public function show():Void;
	
	/**
	 * Read only. The series' type, like "line", "area" etc.
	 */
	public var type:Bool;
	
	/**
	 * Read only. The series' visibility state as set by series.show(), series.hide(), or the initial configuration.
	 */
	public var visible:Bool;
	
	/**
	 * An array of the chart's x axes. If only one x axis, it is referenced by chart.xAxis[0].
	 */
	public var xAxis:Array<Axis>;

	/**
	 * An array of the chart's y axes. If only one y axis, it is referenced by chart.yAxis[0].
	 */
	public var yAxis:Array<Axis>;
}

extern class Axis
{
	/**
	 * Add a plot band or plot line after render time
	 *
	 * @param options {Object} The plotBand or plotLine configuration object
	 */
	public function addPlotBand(options:Dynamic):Void;

	/**
	 * Add a plot line after render time.
	 *
	 * @param options {Object} The plotBand or plotLine configuration object
	 */
	public function addPlotLine(options:Dynamic):Void;
	
	/**
	 * Get the actual axis extremes
	 */
	public function getExtremes():Dynamic;

	/**
	 * Remove a plot band or plot line from the chart by id
	 * @param {String} id
	 */
	public function removePlotBandOrLine(id:String):Void;
		

	/**
	 * Remove a plot line by its id.
	 * @param {String} id
	 */
	public function removePlotLine(id:String):Void;
	
	/**
	 * Set new axis categories and optionally redraw
	 * @param {Array} newCategories
	 * @param {Boolean} doRedraw
	 */
	public function setCategories(cateories:Array<Dynamic>, redraw:Bool = true):Void;

	/**
	 * Set the extremes and optionally redraw
	 * @param {Number} newMin
	 * @param {Number} newMax
	 * @param {Boolean} redraw
	 * @param {Boolean|Object} animation Whether to apply animation, and optionally animation configuration
	 * @param {Object} eventArguments 
	 *
	 */
	public function setExtremes(min:Float, max:Float, redraw:Bool = true, animation:Bool):Void;

	/**
	 * Update the axis title by options
	 */
	public function setTitle(newTitleOptions:Dynamic, redraw:Bool = true):Void;
}

extern class  Point
{
	/**
	 * For categorized axes this property holds the category name for the point. For otheraxis it holds the x value.
	 */
	public var category:Dynamic;

	/**
	 * The percentage for points in a stacked series or pies.
	 */
	public var percentage:Float;
	
	/**
	 * Remove a point and optionally redraw the series and if necessary the axes
	 * @param {Boolean} redraw Whether to redraw the chart or wait for an explicit call
	 * @param {Boolean|Object} animation Whether to apply animation, and optionally animation configuration
	 */
	public function remove(redraw:Bool=true, animation:Bool=true):Void;


	/**
	 * Toggle the selection status of a point
	 * @param {Boolean} selected Whether to select or unselect the point.
	 * @param {Boolean} accumulate Whether to add to the previous selection. By default,
	 *     this happens if the control key (Cmd on Mac) was pressed during clicking.
	 */
	public function select(selected:Bool, accumulate:Bool):Void;

	/**
	 * Whether the point is selected or not.
	 */
	public var selected:Bool;
	
	/**
	 * The series object associated with the point.
	 */
	public var series:Array<Series>;


	/**
	 * Set or toggle whether the slice is cut out from the pie
	 * @param {Boolean} sliced When undefined, the slice state is toggled
	 * @param {Boolean} redraw Whether to redraw the chart. True by default.
	 */
	public function slice(sliced:Bool, redraw:Bool = true, animation:Bool = true):Void;
	
	/**
	 * The x value for the point.
	 */
	public var x:Float;

	/**
	 * The y value for the point.
	 */
	public var y:Float;
}