package com.lgt.kernel.views
{
	import chrome.Chrome;
	
	import com.lgt.kernel.display.RedrawableSprite;
	import com.lgt.kernel.jobs.Job;
	
	import flash.display.*;
	import flash.events.Event;

	public class View extends RedrawableSprite
	{
		private var _job			: Job;
		private var _chrome			: Chrome;
		private var _chromeView		: Sprite;
		private var _content		: DisplayObject;
		private var _mask			: Shape;
		private var _width			: Number;
		private var _height			: Number;
		
		override public function get width():Number { return _width; }
		override public function set width(value:Number):void
		{
			_width = value;
			_invalidatedProperties.width = true;
			redraw();
		}
		
		override public function get height():Number { return _height; }
		override public function set height(value:Number):void
		{
			_height = value;
			_invalidatedProperties.height = true;
			redraw();
		}
		
		public function get chrome():Chrome { return _chrome; }
		public function set chrome(value:Chrome):void
		{
			_chrome = value;
			_invalidatedProperties.chrome = true;
			redraw();
		}
		
		public function get content():DisplayObject { return _content; }
		public function set content(value:DisplayObject):void
		{
			if (_content && _content.parent == this)
				removeChild(_content);
			
			_invalidatedProperties.content = true;
			
			if (value)
			{
				_content = value;
				addChild(_content);
				addChild(_mask);
				_content.mask = _mask;
				redraw();
			}
		}
		
		public function View(job:Job, chrome:Chrome, content:DisplayObject = null)
		{
			super();
			super.addEventListener(Event.CHANGE, _redraw);
			_job = job;
			this.chrome = chrome;
			_mask = new Shape();
			_mask.graphics.beginFill(0xff0000);
			_mask.graphics.drawRect(0, 0, 100, 100);
			_mask.graphics.endFill();
			
			_chromeView = new Sprite();
			addChild(_chromeView);
			
			_width = 0;
			_height = 0;
			
			if (content)
			{
				this.content = content;
				width = _content.width + _chrome.border*2;
				height = _content.height + _chrome.border*2;
			}
		}
		
		private function _redraw(event:Event):void
		{
			_mask.width = _width - _chrome.border*2;
			_mask.height = _height - _chrome.border*2;
			_mask.x =
			_mask.y = _chrome.border;
			
			if (_content)
			{
				_content.x =
				_content.y = _chrome.border;
			}
			
			_chromeView.graphics.clear();
			_chromeView.graphics.beginFill(_chrome.bgcolor);
			_chromeView.graphics.drawRoundRect(0, 0, _width, _height, _chrome.roundness, _chrome.roundness);
			_chromeView.graphics.endFill();
			_chromeView.filters = _chrome.filters;
		}
	}
}