package com.powerflasher.SampleApp {
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.display.Sprite;

	/**
	 * @author Adam
	 */
	public class NasaApodVisualizer extends Sprite {
		var ImageArray:Array = new Array();
		var iconHolder:Sprite = new Sprite();
		public function NasaApodVisualizer() {
			
			var columns: int = 5;
			
			
			
		}
		function loadImages(event:Event):void
		{
			//will use APOD api here to get new string for each day
			var url:String = "http://apod.nasa.gov/apod/image/1504/VolcanoWay_montufar_1181.jpg";
			
			for(var i:int = 0; i < 30; i++)
			{
				ImageArray.push(new ImageIcon("picture", url));
				iconHolder.addChild(ImageArray[i]);
				
			}
			
		}
	}
}