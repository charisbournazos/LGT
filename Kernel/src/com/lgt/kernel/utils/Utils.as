package com.lgt.kernel.utils
{
	public class Utils
	{
		public static function typeCast(value:String, type:String):*
		{
			var returnValue:* = value;
			
			switch (type)
			{
				case "Number":
					if (value.indexOf(".") == -1)
						returnValue = parseInt(value);
					else
						returnValue = parseFloat(value);
					
					break;
				case "Boolean":
					returnValue = (value.toLowerCase() == "true") || (value == "1");
			}
			
			return returnValue;
		}
	}
}