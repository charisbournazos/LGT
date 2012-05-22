package com.lgt.kernel.utils
{
	import com.lgt.utils.Logger;
	
	public class XMLVars
	{	
		private static var _logger:Logger			= Logger.getLogger(XMLVars);
		
		public static function fromXML(xml:XML):Object
		{
			var returnValue:Object = {};
			
			for each (var attr:XML in xml.*)
			{
				try
				{
					returnValue[attr.name()] = Utils.typeCast(attr.@value.toString(), attr.@type.toString());
				} catch (e:Error) {
					_logger.error(e);
				}
			}
			
			return returnValue;
		}
	}
}