package com.powerflasher.SampleApp {
	import flash.net.URLRequest;
	import flash.display.Loader;
	/**
	 * @author Adam
	 */
	import flash.display.Sprite;
	
	public class ImageIcon extends Sprite {
		private var iname:String;
		private var url:String;
		private var ImageLoader: Loader;
		
		function ImageIcon(name:String, url:String):void
		{
			this.url = url;
			this.iname = name;
		}
		
		function drawImage():void
		{
			ImageLoader = new Loader();
			ImageLoader.load(new URLRequest(url));
			ImageLoader.mouseEnabled = false;
		    ImageLoader.x = -50;
			ImageLoader.y = -50;
			addChild(ImageLoader);	
		}
	}
}