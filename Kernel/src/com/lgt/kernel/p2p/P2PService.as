package com.lgt.kernel.p2p
{
	import com.lgt.kernel.net.NetStatusCodes;
	import com.lgt.utils.Logger;
	
	import flash.events.EventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;

	public class P2PService extends EventDispatcher
	{
		private static var _instance:P2PService;
		
		private var _logger						: Logger;
		private var _netConnection				: NetConnection;
		private var _connected					: Boolean;
		public function get connected():Boolean { return _connected; }
		
		public static function getInstance():P2PService
		{
			if (_instance == null)
				_instance = new P2PService(new Private);
			
			return _instance;
		}
		
		public function P2PService(key:Private = null)
		{
			if (!(key is Private))
				throw(new Error("Please use P2PService.getInstance()"));
			
			initialize();
		}
		
		private function initialize():void
		{
			_logger = Logger.getLogger(this);
			_netConnection = new NetConnection();
			_logger.log("Initialized.");
		}
		
		private function connect(url:String):void
		{
			if (_connected)
				disconnect();
			
			_netConnection.connect(url);
			_netConnection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);

			_logger.log("Connecting to: " + url);
		}
		
		private function disconnect():void
		{
			if (_connected)
			{
				_netConnection.removeEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
				_logger.log("Disconnected");
			}
		}
		
		private function netStatusHandler(event:NetStatusEvent):void
		{
			switch (event.info.code)
			{
				case NetStatusCodes.CONNECTION_CONNECT_SUCCESS:
					_logger.log("Connected!");
					break;
				case NetStatusCodes.CONNECTION_CONNECT_FAILED:
				case NetStatusCodes.CONNECTION_CONNECT_REJECTED:
				case NetStatusCodes.CONNECTION_CONNECT_INVALID_APP:
					_logger.error(event.info.code);
					break;
			}
			
			//event.stopPropagation();
		}
	}
}

internal class Private {}
