package com.lgt.utils
{
	/**
	 * ...
	 * @author Bournazos Harry
	 */
	
	import flash.external.ExternalInterface;
	import flash.utils.*;
	
	public class Logger 
	{
		public static var logLevel			: uint	= 6;
		private static const logLevelTypes	: Array	= ["fatal", "error", "warn", "debug", "info", "log"];
		
		/**
		 * Create a new logger
		 * 
		 * @param	name String or class instance. The name of the logger will appear on every message. If you pass a class instance the fully qualified name of the class will be used as the name.
		 * 
		 * @return A Logger instance.
		 */
		public static function getLogger(NameSrc:*):Logger
		{
			if (!(NameSrc is String))
				NameSrc = getQualifiedClassName(NameSrc);
			
			if (!NameSrc)
				throw(new Error("Incompatible name source for Logger."));
			
			return new Logger(NameSrc);
		}
		
		private var _jsAvailable:Boolean;
		private var _name:String;
		
		public function get name():String { return _name; }
		
		public function Logger(name:String):void
		{
			if (!name)
				throw(new Error("Logger must have a name"));
			
			_name = name;
			checkJSAvailability();
		}
		
		public function log(...args):void
		{
			out.apply(this, [5].concat(args));
		}
		
		public function info(...args):void
		{
			out.apply(this, [4].concat(args));
		}
		
		public function debug(...args):void
		{
			out.apply(this, [3].concat(args));
		}
		
		public function warn(...args):void
		{
			out.apply(this, [2].concat(args));
		}
		
		public function error(...args):void
		{
			out.apply(this, [1].concat(args));
		}
		
		public function fatal(...args):void
		{
			out.apply(this, [0].concat(args));
		}
		
		private function checkJSAvailability():void
		{
			try
			{
				_jsAvailable = ExternalInterface.call("function(){ return true; }");
			} catch (e:Error) {}
		}
		
		private function out(level:uint, ...args):void
		{
			if (logLevel > level)
			{
				var type:String = logLevelTypes[level];
				if (type)
				{
					var msg:String = _name + " says: " + args.join();
					
					if (_jsAvailable)
						ExternalInterface.call("console." + type, msg);
					
					trace(type + ": " + msg);
				}
			}
		}
	}
}