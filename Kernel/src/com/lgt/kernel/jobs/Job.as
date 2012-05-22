package com.lgt.kernel.jobs
{
	public class Job
	{
		private var _id		: uint;
		private var _type	: String;
		
		public function get id():uint { return _id; }
		public function get type():String { return _type; }
		
		public function Job(id:uint, type:String)
		{
			_id = id;
			_type = type;
		}
	}
}