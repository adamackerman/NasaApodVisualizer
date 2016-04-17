package com.powerflasher.SampleApp {
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.display.Bitmap;
	/**
	 * @author Adam
	 */
	import flash.display.Sprite;
	
	public class ImageIcon extends Sprite {
		private var iname:String;
		private var url:String;
		private var ImageLoader: Loader;
		
		function ImageIcon(name:String, url:String, x:int, y:int):void
		{
			this.url = url;
			this.iname = name;
			drawImage(x , y);
		}
		
		function drawImage(x:int, y:int):void
		{
			ImageLoader = new Loader();
			ImageLoader.load(new URLRequest(url));
			ImageLoader.mouseEnabled = false;
		    ImageLoader.x = x;
			ImageLoader.y = y;
			addChild(ImageLoader);
			ImageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);	
		}
		function imageLoaded(e:Event):void {
   			var image:Bitmap = (Bitmap)(e.target.content);
			image.width = 200;
			image.height = 200;
			
		}
	}
}