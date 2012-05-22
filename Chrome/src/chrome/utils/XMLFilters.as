package chrome.utils
{
	import com.lgt.kernel.utils.*;
	import com.lgt.utils.Logger;
	
	import flash.utils.getDefinitionByName;
	
	public class XMLFilters
	{	
		private static var _logger:Logger			= Logger.getLogger(XMLFilters);
		
		public static function fromXML(xml:XML):Array
		{
			var returnValue:Array = [];
			var fltCls:Class;
			var filter:*;
			var attr:Object;
			
			for each (var flt:XML in xml.filter)
			{
				try
				{
					fltCls = getDefinitionByName("flash.filters." + flt.@type) as Class;
					filter = new fltCls();
					attr = XMLVars.fromXML(flt);
					for (var p:String in attr)
					{
						filter[p] = attr[p];
					}
					returnValue.push(filter);
				} catch (e:Error) {
					_logger.error(e);
				}
			}
			
			return returnValue;
		}
	}
}