package underscore;

/**
 * ...
 * @author David Gofman
 */

 @:native("_")
extern class Underscore {

	static public inline var version:String = "1.3.3";

	static public function each(obj:Dynamic, iterator:Dynamic->Dynamic->Dynamic->Dynamic, ?context:Dynamic = null):Void;

	public static inline var forEach = each;

	public static function map(obj:Dynamic, iterator:Dynamic, ?context:Dynamic = null):Array<Dynamic>;

	public static inline var collect = map;

	public static function reduce(obj:Dynamic, iterator:Dynamic, ?memo:Dynamic = null, ?context:Dynamic):Dynamic;

	public static inline var fold = reduce;

	public static inline var inject = reduce;

	public static function reduceRight(obj:Dynamic, iterator:Dynamic, ?memo:Dynamic = null, ?context:Dynamic):Dynamic;

	static public inline var foldr = reduceRight;

	static public function find(obj:Dynamic, iterator:Dynamic, ?context:Dynamic=null):Dynamic;

	static public inline var detect = find;

	static public function filter(obj:Dynamic, iterator:Dynamic, ?context:Dynamic = null):Array<Dynamic>;

	public static inline var select = filter;



	public static function any(obj:Dynamic, iterator:Dynamic):Bool;

	public static function some(obj:Dynamic, iterator:Dynamic):Bool;


	public static function include(obj:Dynamic, target:Dynamic):Bool;

	/**
	* Determine if a given value is included in the array or object.
	*/
	public static inline var contains = include;

	public static function invoke(obj:Dynamic, method:Dynamic, ?args:Dynamic = null):Dynamic;

	/**
	* Convenience version of a common use case of map:
	* fetching a property.
	*/
	public static function pluck(obj:Dynamic, key:Dynamic):Dynamic;

	private static function eq(a:Dynamic, b:Dynamic, ?stack:Dynamic):Bool;

	static public function clone(obj:Dynamic):Dynamic;

	static public function uniqueId(prefix:String = null):String;

	public static function ifNullSetValue(obj:Dynamic, val:Dynamic):Dynamic;

	static public function isEmpty(obj:Dynamic):Bool;

	static public function shuffle(obj:Dynamic):Dynamic;

	public static function size(obj:Dynamic):Int;

	public static function reverse(obj:Dynamic):Dynamic;

	//
	// ARRAY FUNCTIONS
	//

	public static function max(list:Dynamic):Dynamic;

	/**
	* Return the minimum element (or element-based computation).
	*/
	public static function min(list:Dynamic):Dynamic;

	/**
	* Return the position
	* of the first occurrence
	* of an item in an array, or -1
	* if the item is not included in the array.
	*/
	static public function indexOf(array:Array<Dynamic>, item:Dynamic):Int;

	static public function lastIndexOf(array:Array<Dynamic>, item:Dynamic):Int;

	/**
	* Generate an integer Array
	* containing an arithmetic progression.
	* A port of the native Python range() function.
	*/
	static public function range(start:Int, stop:Int, ?step:Int = 1):Array<Int>;

	//
	// FUNCTIONS FUNCTIONS
	//

	/**
	* Create a function bound to a given object
	* (assigning this, and arguments, optionally).
	* Binding with arguments is also known as curry.
	*/
	static public function bind(func:Dynamic):Void;

	/**
	* Bind all of an object's methods to that object.
	* Useful for ensuring that all callbacks
	* defined on an object belong to it.
	*/
	static public function bindAll(func:Dynamic):Void;

	/**
	* Memoize an expensive
	* function by storing
	* its results.
	*/
	static public function memoize(func:Dynamic, hasher:Dynamic):Void;

	/**
	* Delays a function
	* for the given number of milliseconds,
	* and then calls it with the arguments supplied.
	*/
	static public function delay(func:Dynamic, wait:Float):Void;

	/**
	* Defers a function,
	* scheduling it to run
	* after the current
	* call stack has cleared.
	*/
	static public function defer(func:Dynamic):Void;

	/**
	* Returns a function,
	* that, when invoked,
	* will only be triggered
	* at most once during a
	* given window of time.
	*/
	static public function throttle(func:Dynamic, wait:Float):Dynamic;

	/**
	* Returns a function, that, as long as it continues to be invoked,
	* will not be triggered.
	* The function will be called after it
	* stops being called for N milliseconds. If immediate is passed,
	* trigger the function on the leading edge,
	* instead of the trailing.
	*
	*/
	static public function debounce(func:Dynamic, wait:Dynamic, immediate:Dynamic):Dynamic;

	/**
	* Returns a function that
	* will be executed at most
	* one time, no matter
	* how often you call it.
	* Useful for lazy initialization.
	*/
	static public function once(func:Dynamic):Dynamic;

	/**
	* Returns the first function
	* passed as an argument to the second,
	* allowing you to adjust arguments,
	* run code before and after, and conditionally
	* execute the original function.
	*/
	static public function wrap(func:Dynamic,wrapper:Dynamic):Dynamic;

	/**
	* Returns a function that is the composition
	* of a list of functions,
	* each consuming the return
	* value of the function that follows.
	*/
	static public function compose(functionList:Dynamic):Dynamic;

	/**
	* Returns a function that will
	* only be executed after
	* being called N times.
	*/
	static public function after(times:Dynamic, func:Dynamic):Dynamic;

	//
	// OBJECT FUNCTIONS
	//
	/**
	* Perform a deep comparison to check if two objects are equal.
	*/
	public static function isEqual(a:Dynamic, b:Dynamic):Bool;

	/**
	* Retrieve the names of an object's properties.
	*/
	static public function keys(obj:Dynamic):Array<Dynamic>;

	/**
	* Retrieve the values of an object's properties.
	*/
	static public function values(obj:Dynamic):Array<Dynamic>;

	/**
	* Extend a given object with all
	* the properties in passed-in object(s).
	* @param target
	* @param sources
	*/
	public static function extend(target:Dynamic, sources:Array<Dynamic>):Dynamic;

	/**
	* Return a sorted list of the
	* function names available on the object. Aliased as methods
	*/
	static public function functions(obj:Dynamic):Array<String>;

	static public inline var methods = functions;

	/**
	* Return a copy of the object only
	* containing the whitelisted properties.
	*/
	static public function pick(obj:Dynamic, params:Array<String>):Dynamic;

	static public function defaults(obj:Dynamic, ?properties:Array<Dynamic> = null):Dynamic;

	static public function tap(obj:Dynamic):Void;

	static public function isObject(obj:Dynamic):Bool;

	/**
	* returns the object type
	*/
	public static function typeOf(obj:Dynamic):String;

	/**
	* return true if the object is a list , a hash or an array
	*/
	public static function isArray(obj:Dynamic):Bool;

	public static function isFunction(obj:Dynamic):Bool;

	static public function isString(obj:Dynamic):Bool;

	static public function isInt(el:Dynamic):Bool;

	/**
	* returns true if value is a float or a integer
	*/
	public static function isNumber(value:Dynamic):Bool;

	static public function isNaN(obj:Dynamic):Bool;

	static public function isBoolean(obj:Dynamic):Bool;

	static public function isDate(obj:Dynamic):Bool;

	static public function isRegExp(obj:Dynamic):Bool;

	public static function isNull(obj:Dynamic):Bool;

	static public function has(obj:Dynamic, attr:String):Bool;

	public static function isConstant(value:Dynamic):Bool;

	//
	// UTILITY FUNCTIONS
	//
	/**
	* Keep the identity function around for default iterators.
	* @param value
	*/
	public static function identity<T>(value:T):T;

	/**
	* Escape a string for HTML interpolation.
	* @param string
	*/
	static public function escape(string:String):String;

	/**
	* Add your own custom functions to
	* the Underscore object, ensuring that
	* they're correctly added to the OOP wrapper as well.
	*/
	static public function mixin(obj:Dynamic):Dynamic;

	static public function template(templateString:String, data:Dynamic, settings:Dynamic=null):Dynamic;
	
	static public inline var templateSettings = {
	evaluate : ~/<%([\s\S]+?)%>/g ,
	interpolate : ~/<%=([\s\S]+?)%>/g,
	escape : ~/<%-([\s\S]+?)%>/g
	};

	static private inline var noMatch = ~/.^/;
}