package com.lgt.kernel.jobs
{
	import com.lgt.utils.Logger;
	
	import flash.utils.Dictionary;

	public class JobsManager
	{
		private static var _instance	: JobsManager;
		
		private var _jobs				: Vector.<Job>;
		private var _jobsIdIndex		: Dictionary;
		private var _logger				: Logger;
		private var _lastJobId			: uint;
		
		//******TEMP
		private var _jobManifest:XML = <job type='application' chrome='application' />
		//**********
		
		public static function getInstance():JobsManager
		{
			if (_instance == null)
				_instance = new JobsManager(new Private);
			
			return _instance;
		}
		
		public function JobsManager(key:Private = null)
		{
			if (!(key is Private))
				throw(new Error("Please use JobsManager.getInstance()"));
			
			initialize();
		}
		
		public function createJob(type:String):Job
		{
			var job:Job;
			
			job = new Job(++_lastJobId, type);
			_jobs.push(job);
			
			return job;
		}
		
		private function initialize():void
		{
			_jobs = new Vector.<Job>;
			_jobsIdIndex = new Dictionary();
		}
	}
}

internal class Private {}