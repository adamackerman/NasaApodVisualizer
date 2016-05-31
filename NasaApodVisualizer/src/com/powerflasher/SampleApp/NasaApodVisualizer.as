package com.powerflasher.SampleApp {
	import flash.events.EventDispatcher;
	import flash.utils.setTimeout;
	import flash.utils.setInterval;
	import flash.net.URLRequestMethod;
	import flash.text.TextField;
	import flash.net.URLLoader;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.display.Bitmap;

	//import com.adobe.serialization.json.JSON;
	
	/**
	 * @author Adam
	 */
	public class NasaApodVisualizer extends Sprite {
		var ImageArray:Array = new Array();
		var iconHolder:Sprite = new Sprite();
		var URLArray:Array = [];
		var rows: int = 1;
		var maxRows: int = 5;
		var image:Loader;
		var requestor:URLLoader;
		var output:TextField = new TextField();
		public function NasaApodVisualizer() {
			var canvas : Shape = new Shape();
			canvas.graphics.beginFill(0x000000);
			canvas.graphics.drawRect(5, 5, 300, 300);
			
			for (var r : int = 0; r < maxRows; r++) {
				for (var x : int = 0; x < 5; x++) {
					// will call method to get url from apod
					var url : String = "http://apod.nasa.gov/apod/image/1504/VolcanoWay_montufar_1181.jpg";

					var image : Loader = new Loader();
					image.x = 5 + (200 * x);
					image.y = 5 + (200 * (rows - 1));

					image.load(new URLRequest(url));

					iconHolder.addChild(image);
					image.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);
					if ((x + 1) % 5 == 0) {
						rows++;
					}
				}
			}
			
			output.text = "Testing";
			output.width = 400;
			addChild(output);
			//iconHolder.addEventListener(Event.COMPLETE, loadImages);
			//addChild(iconHolder);
			
			//addChild(canvas);
			var d:Date = new Date();
		
			for(var x:int = 0; x < 20; x++)
			{
				getURL(d);
				d.setDate(d.date -1);
				
			}
			
			setTimeout(function(){
			URLArray = output.text.split(",");
			}, 4000);
			
			
			
			
		}
		
		function imageLoaded(e:Event):void {
   			var image:Bitmap = (Bitmap)(e.target.content);
			image.width = 200;
			image.height = 200;
			
		}
		
		function getURL(date:Date):void{
			var request:URLRequest = new URLRequest();
			var day:String = new String();
			var zero:String = "0";
			
			//format date to fit in api request
			day = date.getFullYear() + "-"; 
			if((date.getMonth()+1)<=9)
			{
				 day += zero;
			}
			day += (date.getMonth() + 1) +"-";
			if(date.getDate() <= 9)
			{
				day+=zero;
			}
			day+= date.getDate();
			//////////////////////////////////
			
			//output.text += day +"\n";
			
			request.url = "https://api.nasa.gov/planetary/apod?date=" + day + "&api_key=0XGnJvxIoRRuH9789ZuumkuAxq7AQE9mf6AQQXM1";
			request.method = URLRequestMethod.GET;
			requestor = new URLLoader();
			requestor.addEventListener(Event.COMPLETE, onLoad);
			
			requestor.load(request);
			
			
			
		}
		function onLoad(e: Event): void{
			
			requestor.removeEventListener(Event.COMPLETE, onLoad);
			
			var data:String = new String();
			data = e.target.data;
			var dataArray:Array = data.split(",");
			
		
			var pictureUrl:String = dataArray[dataArray.length - 1].substring(11, dataArray[dataArray.length - 1].length - 3);
			//URLArray.push(pictureUrl.toString());
			
			output.text = output.text + "," + pictureUrl;
				
		}
		
	}
}