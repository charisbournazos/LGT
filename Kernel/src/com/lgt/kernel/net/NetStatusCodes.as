package com.lgt.kernel.net
{
	public class NetStatusCodes
	{
		public static const CONNECTION_CONNECT_SUCCESS				: String	= "NetConnection.Connect.Success";
		public static const CONNECTION_CONNECT_CLOSED				: String	= "NetConnection.Connect.Closed";
		public static const CONNECTION_CONNECT_FAILED				: String	= "NetConnection.Connect.Failed";
		public static const CONNECTION_CONNECT_REJECTED				: String	= "NetConnection.Connect.Rejected";
		public static const CONNECTION_CONNECT_APP_SHUTDOWN			: String	= "NetConnection.Connect.AppShutdown";
		public static const CONNECTION_CONNECT_INVALID_APP			: String	= "NetConnection.Connect.InvalidApp";
		
		public static const STREAM_CONNECT_SUCCESS					: String	= "NetStream.Connect.Success";
		public static const STREAM_CONNECT_REJECTED					: String	= "NetStream.Connect.Rejected";
		public static const STREAM_CONNECT_FAILED					: String	= "NetStream.Connect.Failed";
		
		public static const STREAM_MULTICASTSTREAM_RESET			: String	= "NetStream.MulticastStream.Reset";
		
		public static const STREAM_BUFFER_FULL						: String	=  "NetStream.Buffer.Full";
		
		public static const GROUP_CONNECT_SUCCESS					: String	= "NetGroup.Connect.Success";
		/**info.group**/
		public static const GROUP_CONNECT_REJECTED					: String	= "NetGroup.Connect.Rejected";
		/**info.group**/
		public static const GROUP_CONNECT_FAILED					: String	= "NetGroup.Connect.Failed";
		
		/**info.message, info.messageID**/
		public static const GROUP_POSTING_NOTIFY					: String	= "NetGroup.Posting.Notify";
		/**info.message, info.from, info.fromLocal**/
		public static const GROUP_SENDTO_NOTIFY						: String	= "NetGroup.SendTo.Notify";
		
		public static const GROUP_LOCALCOVERAGE						: String	= "NetGroup.LocalCoverage.Notify";
		
		/**info.neighbor**/
		public static const GROUP_NEIGHBOR_CONNECT					: String	= "NetGroup.Neighbor.Connect";
		/**info.neighbor**/
		public static const GROUP_NEIGHBOR_DISCONNECT				: String	= "NetGroup.Neighbor.Disconnect";
		
		/**info.name**/
		public static const GROUP_MULTICASTSTREAM_PUBLISHNOTIFY		: String	= "NetGroup.MulticastStream.PublishNotify";
		/**info.name**/
		public static const GROUP_MULTICASTSTREAM_UNPUBLISHNOTIFY	: String	= "NetGroup.MulticastStream.UnpublishNotify";
		
		/**info.index**/
		public static const GROUP_REPLICATION_FETCH_SENDNOTIFY		: String	= "NetGroup.Replication.Fetch.SendNotify";
		/**info.index**/
		public static const GROUP_REPLICATION_FETCH_FAILED			: String	= "NetGroup.Replication.Fetch.Failed";
		/**info.index, info.object**/
		public static const GROUP_REPLICATION_FETCH_RESULT			: String	= "NetGroup.Replication.Fetch.Result";
		/**info.index, info.requestID**/
		public static const GROUP_REPLICATION_REQUEST				: String	= "NetGroup.Replication.Request";
	}
}