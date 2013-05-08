package jQueryUI;

import jQuery.JQuery;
import jQuery.plugins.jQueryUI.Datepicker;

import js.Dom;

/**
 * ...
 * @author David Gofman
 */

#if JQUERY_NOCONFLICT
@:native("jQuery")
#else
@:native("$")
#end
extern class JQueryUI 
{
	static public inline var ui = JQueryUIStatic;
}

#if JQUERY_NOCONFLICT
@:native("jQuery.ui")
#else
@:native("$.ui")
#end
extern class JQueryUIStatic {

	static public  function accordion ( options:Dynamic, element:JQuery ):Void;
	
	static public  function autocomplete ( options:Dynamic, element:JQuery ):Void;
	
	static public  function button ( options:Dynamic, element:JQuery ):Void;
	
	static public  function buttonset ( options:Dynamic, element:JQuery ):Void;

	static public  function contains ( a:Int, b:Int ):Bool;
	
	static public var cookie:Dynamic;
	
	static public var datepicker:Datepicker;

	inline static public var ddmanager = JQueryDragDropManager;

	static public  function dialog ( options:Dynamic, element:JQuery ):Void;
	
	static public  function draggable ( options:Dynamic, element:JQuery ):Void;

	static public  function droppable ( options:Dynamic, element:JQuery ):Void;
	
	static public  function hasScroll ( el :Dom, a:String ):Bool;

	static public  function intersect ( draggable:Dom, droppable:Dom, toleranceMode:String ):Void;

	static public  function isOver ( y:Float, x:Float, top:Float, left:Float, height:Float, width:Float ):Bool;
	
	static public  function isOverAxis ( x:Float, reference:Float, size:Float ):Bool;

	static public var keyCode:Int;

	static public  function menu ( options:Dynamic, element:JQuery ):Void;
	
	static public  function mouse ( options:Dynamic, element:JQuery ):Void;

	static public var plugin:Dynamic;

	static public var position:Float;

	static public  function progressbar ( options:Dynamic, element:JQuery ):Void;
	
	static public  function resizable ( options:Dynamic, element:JQuery ):Void;
	
	static public  function selectable ( options:Dynamic, element:JQuery ):Void;
	
	static public  function slider ( options:Dynamic, element:JQuery ):Void;
	
	static public  function sortable ( options:Dynamic, element:JQuery ):Void;
	
	static public  function tabs ( options:Dynamic, element:JQuery ):Void;
}

#if JQUERY_NOCONFLICT
@:native("jQuery.ui.ddmanager")
#else
@:native("$.ui.ddmanager")
#end
extern class JQueryDragDropManager {
	
	static public var current:Dynamic;

	static public  function drag ( draggable:JQuery, event:Event ):Void;
	
	static public  function dragStart ( draggable:JQuery, event:Event ):Void;
		
	static public  function dragStop ( draggable:JQuery, event:Event ):Void;
	
	static public  function drop ( draggable:JQuery, event:Event ):Void;
	
	static public var droppables:Dynamic;

	static public  function prepareOffsets ( t:Dynamic, event:Event ):Void;
}
