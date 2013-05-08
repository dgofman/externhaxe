package jqGrid;

import jQuery.JQuery;

/**
 * ...
 * @author David Gofman
 */

class JQGridHelper {
	
	public static function create(container:JQuery, params:Dynamic):JQGrid {
		var grid:JQGrid = null;
		untyped {
			grid = container.jqGrid(params);
		}
		return grid;
	}
}

#if JQUERY_NOCONFLICT
@:native("jQuery")
#else
@:native("$")
#end
extern class JQGridHelperFunctions
{
	static public inline var jgrid = JQGridFunctions;
}

#if JQUERY_NOCONFLICT
@:native("jQuery.jgrid")
#else
@:native("$.jgrid")
#end
extern class JQGridFunctions
{
	public static function findPos(obj:Dynamic):Array<Float>;
	public static function createModal(aIDs:Dynamic, content:JQuery, p:Dynamic, insertSelector:JQuery, posSelector:JQuery, appendsel:Bool, css:Dynamic):Void;
	public static function viewModal(selector:String, o:Dynamic):Void;
	public static function info_dialog(caption:String, content:String, c_b:Bool, modalopt:Dynamic):Void;
	public static function createEl(eltype:String, options:Dynamic, vl:String, autowidth:Bool, ajaxso:Dynamic):Dynamic;
}

@:native("jqGrid")
extern class JQGrid 
{
	/**
	 * Get and Set properties by name. See $.jgrid.getAccessor
	 */
	public function jqGrid(name:String, ?p1:Dynamic, ?p2:Dynamic, ?p3:Dynamic, ?p4:Dynamic, ?p5:Dynamic, ?p6:Dynamic, ?p7:Dynamic, ?p8:Dynamic):Dynamic;
	
	/**
	 * Inserts a new row with id = rowid containing the data in data (an object) at the position specified 
	 * (first in the table, last in the table or before or after the row specified in srcrowid). 
	 * The syntax of the data object is: {name1:value1,name2: value2…} where name is the name of the column 
	 * as described in the colModel and the value is the value. 
	 * This method can insert multiple rows at once. In this case the data parameter should be array defined as
	 * [{name1:value1,name2: value2…}, {name1:value1,name2: value2…} ] and the first option rowid should contain 
	 * the name from data object which should act as id of the row. It is not necessary that the name of the rowid in 
	 * this case should be a part from colModel. 
	 */
	public function addRowData(rowid:Dynamic, data:Dynamic, position:String="last", srcrowid:Dynamic=null):Bool;
	
	/**
	 * Populates a grid with the passed data.
	 */
	public function addXmlData(data:String):Void;

	/**
	 * When called the method make it so that it is possible to select a row with Up and Down keys - i.e 
	 * we scroll the grid data with keys. It is possible to invoke additional events when the row is selected 
	 * and a key like enter, space, left or right are pressed. To these events a selected id of the row is passed as parameter.
	 */
	public function bindKeys(settings:Dynamic):JQGrid;

	/**
	 * Clears the currently loaded data from grid. If the clearfooter parameter is set to true, 
	 * the method clears the data placed on the footer row.
	 */
	public function clearGridData(clearfooter:Bool=true):JQGrid;
	
	/**
	 * Deletes the row with the id = rowid. This operation does not delete data from the server.
	 */
	public function delRowData(rowid:Dynamic):Bool;

	/**
	 * Edits the row specified by rowid. keys is a boolean value, indicating if to use 
	 * the Enter key to accept the value ane Esc to cancel the edit, or not.
	 */
	public function editRow(rowid:Dynamic, keys:Bool):Void;

	/*
	 * This method gets or sets data on footer. See footerrow in options array.
	 * action - can be 'get' or 'set'. The default is get. 'get' returns an object of type name:value, 
	 * where the name is a name from colModel. This will return data from the footer. 
	 * The other two options have no effect in this case. 'set' takes a data array (object) and places the values in the footer. 
	 * The object should be in name:value pair, where the name is the name from colModel 
	 * format - default is true. This instruct the method to use the formatter (if set in colModel) when new values are set. 
	 * A value of false will disable the using of formatter
	*/
	public function footerData(action:String = "get", data:Dynamic = null, format:Bool = true):JQGrid;

	/**
	 * Returns the content of the cell specified by id = rowid and column = iCol. iCol can be either the column index or the name specified in colModel.
	 */
	public function getCell(rowid:Dynamic, iCol:Int):Dynamic;
	
	/**
	 * This method returns an array with the values from the column. colname can be either a number that represents the index of the column
	 * or a name from colModel. returntype determines the type of the returned array. When set to false (default) the array contain only the values.
	 * When set to true the array contain a set of objects. The object is defined as {id:rowid, value:cellvalue} where the rowid is the id of 
	 * the row and cellvalue is the value of the cell. For example, such output can be [{id:1,value:1},{id:2,value:2}…] 
	 * The valid options for mathoperation are - 'sum, 'avg', 'count'. If this parameter is set and is valid, the returned value 
	 * is a scalar representing the operation applied to the all values in the column. If the parameter is not valid the returned value is empty array
	 */
	public function getCol(colname:Dynamic, returntype:Bool = false, mathoperation:String = null):Array<Dynamic>;

	/**
	 * This method returns an array of the id's in the current grid view. It returns an empty array if no data is available.
	 */
	public function getDataIDs():Array<String>;
	
	/**
	 * Returns the value of the requested parameter. name is the name from the options array. If the name is not set, the entry options are returned.
	 */
	public function getGridParam(name:String):Dynamic;

	/**
	 * This method returns the index of the row in the grid table specified by id= rowid when rowcontent set to false (default). 
	 * If rowcontent is set to true, it returns the entry row object. If the rowid can not be found, the function returns false.
	 */
	public function getInd(rowid:Dynamic, rowcontent:Bool = false):Int;

	/**
	 * Return the row data from the local array stored in data parameter when the datatype is local
	 */
	public function getLocalRow(rowid:Dynamic):Dynamic;
	
	/**
	 * Returns an array with data of the requested id = rowid. The returned array is of type name:value, where the name is a name from colModel and the value 
	 * from the associated column in that row. It returns an empty array if the rowid can not be found.
	 */
	public function getRowData(rowid:Dynamic = null):Array<Dynamic>;

	/**
	 * Given a single colname, it hides the column with that name. Given an array of colnames [“name1”,”name2”], 
	 * it hides the columns with those names, 'name1' and 'name2', in the example. The names in colname or colnames 
	 * must all be valid names from the colModel. 
	 */
	public function hideCol(colname:Dynamic):JQGrid;

	/**
	 * Reorder the grid columns based on the permutation array. The indexes of the permutation array are the current order, 
	 * the values are the new order. By example if the array has values [1,0,2] after calling this method the first column 
	 * will be reordered as second. updateCells if set to true will reorder the cell data. keepHeader if set to true 
	 * will reorder the data above the header cells.
	 */
	public function remapColumns(permutation:String, updateCells:Bool, keepHeader:Bool):Void;

	/**
	 * Resets (unselects) the selected row(s). Also works in multiselect mode.
	 */
	public function resetSelection():JQGrid;

	/**
	 * Restores the data to original values before the editing of the row specified by rowid.
	 */
	public function restoreRow(rowid:Dynamic):Void;

	/**
	 * Saves the row specified by rowid, after it has been opened for editing mode by the editRow method. callback is a function 
	 * called after the save is complete. The function accepts an XMLHttpRequest object with the response from the server. 
	 * url is the URL used to submit the values. If specified, this value overrides the value specified by the editurl option. 
	 * extraparas are additional parameters passed to the server. Data is posted in the form 
	 * id=rowid&name=value…, where the name is the “name” from colModel.
	 */
	public function saveRow(rowid:Dynamic, successfunc:Dynamic->Void, url:String, ?extraparam:Dynamic, 
				?aftersavefunc:String->Dynamic->Void, ?errorfunc:String->Dynamic->String->Dynamic->Void, ?afterrestorefunc:String->Void):Void;

	/**
	 * Sets a new caption of the grid. If the Caption layer was hidden, it is shown.
	 */
	public function setCaption(caption:String):JQGrid;

	/**
	 * This method can change the content of particular cell and can set class or style properties. Where: rowid the id of the row, 
	 * colname the name of the column (this parameter can be a number (the index of the column) beginning from 0 
	 * data the content that can be put into the cell. If empty string the content will not be changed 
	 * class if class is string then we add a class to the cell using addClass; if class is an array we set the new css properties via css 
	 * properties sets the attribute properies of the cell, 
	 * forceup If the parameter is set to true we perform update of the cell instead that the value is empty 
	 */
	public function setCell(rowid:Dynamic, colname:Dynamic, data:Dynamic, cssp:Bool=false, properties:Dynamic=null, forceup:Bool=false):JQGrid;
	/**
	 * Sets a particular parameter. Note - for some parameters to take effect a trigger("reloadGrid") 
	 * should be executed. Note that with this method we can override events. The name (in the name:value pair) is the name from options array.
	 */
	public function setGridParam(object:Dynamic):JQGrid;

	/**
	 * Sets the new height of the grid dynamically. Note that the height is set only to the grid cells and not to the grid. 
	 * new_height can be in pixels, percentage, or 'auto'.
	 */
	public function setGridHeight(new_height:Dynamic):JQGrid;

	/**
	 * Sets a new width to the grid dynamically. The parameters are: new_width is the new width in pixels.
	 * shrink (true or false) has the same behavior as shrinkToFit - see options. If this parameter is not set we take the value of shrinkToFit.
	 */
	public function setGridWidth(new_width:Dynamic):JQGrid;

	/**
	 * Sets a new label in the header for the specified column; can also set attributes and classes . The parameters are:
	 * colname the name of the column (this parameter can be a number (the index of the column) beginning from 0 
	 * data the content that can be put into the label. If empty string the content will not be changed 
	 * class if class is string then we add a class to the label using addClass; if class is an array we set the new css properties via css 
	 * properties sets the attribute properies of the label
	 */
	public function setLabel(colname:Dynamic, data:Dynamic, cssp:String=null, properties:Dynamic=null):JQGrid;

	/**
	 * Updates the values (using the data array) in the row with rowid. The syntax of data array is: {name1:value1,name2: value2…} 
	 * where the name is the name of the column as described in the colModel and the value is the new value. 
	 * If the cssprop parameter is string we use addClass to add classes to the row. 
	 * If the parameter is object we use css to add css properties. 
	 * Note that we can set properties and classes without data, in this case we should set data to false 
	 */
	public function setRowData(rowid:Dynamic, data:Dynamic, cssprop:Dynamic=null):Bool;

	/**
	 * Toggles a selection of the row with id = rowid; if onselectrow is true (the default) then the event onSelectRow is launched, otherwise it is not.
	 */
	public function setSelection(rowid:Dynamic, onselectrow:Bool=true):JQGrid;
	
	/**
	 * Shows a column with a given colname. If the colname is a string we show only the specified column. 
	 * If colname is array of type [“name1”,”name2”] then the columns with names 'name1' and 'name2' 
	 * will be shown at the same time The names in colname must be valid names from colModel. The width does not change.
	 */
	public function showCol(colname:Dynamic):JQGrid;

	/**
	 * unbind the events defined in bindKeys method
	 */
	public function unbindKeys():JQGrid;

	/**
	 * this synchronizes the width of the headers with the data. Useful when used with table drag and drop.
	 */
	public function updateColumns():Void;	
	
	/**
	 * Reloads the grid with the current settings. This means that a new request is send to the server if datatype is xml or json. 
	 * This method should be applied to an already-constructed grid. Pay attention that this method does not change HEADER information, 
	 * that means that any changes to colModel would not be affected. You should use gridUnload to reload new configuration with different colModel.
	 * 
	 * @type "reloadGrid" - for reloading grid data
	 */
	public function trigger(type:String):Void;
}