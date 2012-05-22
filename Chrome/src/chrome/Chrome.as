package chrome
{
	import chrome.utils.XMLFilters;
	
	import com.lgt.kernel.utils.XMLVars;
	import com.lgt.utils.Logger;
	
	import flash.display.Shape;

	public class Chrome
	{
		public static const chromesXML:XML =	<chromes>
													<application>
														<attributes>
															<border type='Number' value='10' />
															<roundness type='Number' value='5' />
															<bgcolor type='Number' value='0xefefef' />
														</attributes>
														<filters>
															<filter type='GlowFilter'>
																<color type='Number' value='0x000000' />
																<blurX type='Number' value='10' />
																<blurY type='Number' value='10' />
																<strength type='Number' value='2' />
																<quality type='Number' value='2' />
																<alpha type='Number' value='0.25' />
																<inner type='Boolean' value='true'/>
															</filter>
															<filter type='GlowFilter'>
																<color type='Number' value='0x000000' />
																<blurX type='Number' value='10' />
																<blurY type='Number' value='10' />
																<strength type='Number' value='2' />
																<quality type='Number' value='2' />
																<alpha type='Number' value='0.25' />
															</filter>
														</filters>
													</application>
												</chromes>
		
		private static var _logger		: Logger	= Logger.getLogger(Chrome);
		
		public static function createFromType(type:String):Chrome
		{
			return new Chrome(chromesXML.elements(type)[0]);
		}
		
		private var _manifest			: XML;
		private var _filtersStorage		: Shape;
		private var _border				: Number	= 0;
		private var _roundness			: Number	= 0;
		private var _bgcolor			: Number	= 0;
		
		public function get filters():Array { return _filtersStorage.filters; }
		
		public function get border():Number { return _border; }
		public function set border(value:Number):void { _border = value; }
		
		public function get roundness():Number { return _roundness; }
		public function set roundness(value:Number):void { _roundness = value; }
		
		public function get bgcolor():Number { return _bgcolor; }
		public function set bgcolor(value:Number):void { _bgcolor = value; }
		
		public function Chrome(manifest:XML)
		{
			if (manifest == null)
				_logger.error("Chrome manifest cannot be null.");
			
			_manifest = manifest;
			initialize();
		}
		
		private function initialize():void
		{
			_filtersStorage = new Shape();
			_filtersStorage.filters = XMLFilters.fromXML(_manifest.filters[0]);
			
			var attr:Object = XMLVars.fromXML(_manifest.attributes[0]);
			try
			{
				for (var p:String in attr)
					this[p] = attr[p];
			} catch (e:Error) {
				_logger.error(e);
			}
		}
	}
}