package com.lgt.utils
{
	public class Utils
	{
		public static function getTimestamp(sliceLast:int = -1):String
		{
			var returnValue:String = (new Date()).time.toString();
			if (sliceLast > 0)
				returnValue = returnValue.slice(Math.max(0, returnValue.length - sliceLast));
			
			return returnValue;
		}
	}
}