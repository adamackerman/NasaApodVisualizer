package com.powerflasher.SampleApp {
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.display.Bitmap;
	/**
	 * @author Adam
	 */
	public class NasaApodVisualizer extends Sprite {
		var ImageArray:Array = new Array();
		var iconHolder:Sprite = new Sprite();
		var rows: int = 1;
		var maxRows: int = 5;
		var image:Loader;
		public function NasaApodVisualizer() {
			var canvas : Shape = new Shape();
			canvas.graphics.beginFill(0x000000);
			canvas.graphics.drawRect(5, 5, 300, 300);
			
			for(var r: int = 0; r < maxRows; r++)
			{
				for (var x : int = 0; x < 5; x++) {
				//will call method to get url from apod
				var url : String = "http://apod.nasa.gov/apod/image/1504/VolcanoWay_montufar_1181.jpg";

				var image : Loader = new Loader();
				image.x = 5 + (200 * x);
				image.y = 5 + (200 * (rows-1));

				image.load(new URLRequest(url));

				iconHolder.addChild(image);
				image.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);
				if((x+1) % 5 == 0)
				{
					rows++;
				}
			}
			}
			
			
			
			//iconHolder.addEventListener(Event.COMPLETE, loadImages);
			addChild(iconHolder);
			
			//addChild(canvas);

			
		}
		
		function imageLoaded(e:Event):void {
   			var image:Bitmap = (Bitmap)(e.target.content);
			image.width = 200;
			image.height = 200;
			
		}
	}
}