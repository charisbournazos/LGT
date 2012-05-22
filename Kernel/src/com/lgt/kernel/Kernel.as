package com.lgt.kernel
{
	import com.lgt.kernel.jobs.JobsManager;

	public class Kernel
	{
		private static var _instance:Kernel;
		
		public static function getInstance():Kernel
		{
			if (!_instance)
				_instance = new Kernel(new Private);
			
			return _instance;
		}
		
		private var _jobsMgr:JobsManager;
		
		public function Kernel(key:Private)
		{
			if (!(key is Private))
				throw(new Error("Please use Kernel.getInstance()"));
			
			initialize();
		}
		
		private function initialize():void
		{
			_jobsMgr = JobsManager.getInstance();
		}
	}
}

internal class Private {}