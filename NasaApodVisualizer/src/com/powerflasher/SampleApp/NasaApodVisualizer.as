package com.powerflasher.SampleApp {
	
	import flash.text.TextFormat;
	import flash.display.SimpleButton;
	import flash.geom.Rectangle;
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
	import caurina.transitions.*;
	import flash.filters.*;


	//import com.adobe.serialization.json.JSON;
	
	/**
	 * @author Adam
	 */
	public class NasaApodVisualizer extends Sprite {
		var ImageArray:Array = new Array();
		var iconHolder:Sprite = new Sprite();
		var URLArray:Array = [];
		var allDataArray:Array = [];
		var rows: int = 1;
		var maxRows: int = 5;
		var image:Loader;
		var requestor:URLLoader;
		var glowFilter:GlowFilter = new GlowFilter();
		var dropShadowFilter:DropShadowFilter = new DropShadowFilter();
		var output:TextField = new TextField();
		var backText:TextField = new TextField();
		var d:Date;
		
		var allData:TextField = new TextField();
		
		var box:Rectangle = new Rectangle();
		var dialog:DialogBox;
		var i:int = 0;
		
		var loaded:Boolean = false;
		
		
		public function NasaApodVisualizer() {
			var canvas : Shape = new Shape();
			canvas.graphics.beginFill(0x000000);
			canvas.graphics.drawRect(5, 5, 300, 300);
		
			var format:TextFormat = new TextFormat();
			format.size = 18;
			format.underline = true;
			
			
			
			box.x = 125;
			box.y = 50;
			box.width = 300;
			box.height = 350;
			//dialog =  new DialogBox(box, null);
			
			backText.defaultTextFormat = format;
			backText.text = "Back";
			backText.textColor = 0x0000FF;
			backText.x = box.x;
			backText.y = box.y;
			backText.visible = false;
			

			backText.addEventListener(MouseEvent.CLICK, onButtonClick, false);
			//addChild(backButton);
			
			output.text = "Testing";
			output.width = 400;
			output.y = 500;
			addChild(output);
		
			
			
			//addChild(canvas);
			
			
			d = new Date();
			getURL(d);
//			for(var x:int = 0; x < 30; x++)
//			{
//				getURL(d);
//				d.setDate(d.date -1);
//				
//			}
			var delay:int = 0;
//			while(loaded == false)
//			{
//				delay++;
//			}
			output.text = ""+delay;
			setTimeout(function(){
			URLArray = output.text.split(",");
			allDataArray = allData.text.split(";");
			
			var urlcount:int = 0;
			var url : String = "";
			var date: String = "";
			var dateField: TextField = new TextField();
			
			output.text = "k"
			for (var r : int = 0; r < maxRows; r++) {
				
				for (var x : int = 0; x < 5; x++) {
//					while(loaded == false)
//					{
//						delay++;
//					}
					loaded = false;
					while(URLArray[urlcount].indexOf(".jpg") == -1)
					{
						urlcount++;
					}
					url = URLArray[urlcount];
					dateField = new TextField();
					date = getDate(allDataArray[urlcount]);
					dateField.text = date;
					
					output.text = output.text + "\n" + URLArray[urlcount];
					urlcount++;

					image = new Loader();
					
					image.x = 5 + (125 * x);
					image.y = 5 + (125 * (rows - 1));
					iconHolder.addChild(image);
					
					dateField.x = image.x + 20;
					dateField.y = image.y + 105;
					
					image.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);
					image.addEventListener(MouseEvent.MOUSE_OVER, onOver);
					image.addEventListener(MouseEvent.MOUSE_OUT, onExit);
					image.addEventListener(MouseEvent.CLICK, onClick);
					
					image.load(new URLRequest(url));
					
					iconHolder.addChild(dateField);
					
					
					if ((x + 1) % 5 == 0) {
						rows++;
					}
					
				}
			}
			
			addChild(iconHolder);
			
			}, 50000);
				
		}
	
	
		function onOver(event: MouseEvent):void {
			//Tweener.addTween(event.target.content, {scaleX:.5,scaleY:.5, time:1, transition:"linear"});
			//Tweener.addTween(event.target.content, {alpha:1, time:1, transition:"easeoutelastic"});
			
		    event.target.content.filters = [dropShadowFilter];
			output.text = event.target.name;
			//image.content.filters = [glowFilter];
		}
		
		function onClick(event: MouseEvent):void {
			dialog = new DialogBox(box, event.target.content.bitmapData);
			dialog.visible = true;
			addChild(dialog);
			addChild(backText);
			iconHolder.visible = false;
			backText.visible = true;
		}
		
		function onButtonClick(event: MouseEvent):void {
			dialog.visible = false;
			iconHolder.visible = true;
			backText.visible = false;
			
		}
		
		function onExit(event: MouseEvent):void {
			event.target.content.filters = [];
		}
		
		function imageLoaded(e:Event):void {
			image.removeEventListener(Event.COMPLETE, imageLoaded);
   			var imageIcon:Bitmap = (Bitmap)(e.target.content);
			imageIcon.width = 100;
			imageIcon.height = 100;
			
			
//			var loader:Loader = e.target.loader;
//   		    var index:int = iconHolder.getChildIndex(loader);
//    		// this will add the contents of the loader in the same order the loader was originally added
//    		iconHolder.addChildAt(loader.content, index);
//   			iconHolder.removeChild(loader);
			
			
			//output.text = output.text +"n"
			
		}
		
		function getDate(data:String):String {
			var DataArray:Array = data.split(";");
			var date:String = new String();
			for(var x:int = 0; x < DataArray.length; x++)
			{
				var dateArray:Array = DataArray[x].split(",");
				for(var y: int = 0; y < dateArray.length; y++)
				 {
					if (dateArray[y].indexOf("date") != -1)
					 {
						date = dateArray[y].substring(dateArray[y].indexOf(":") + 3, dateArray[y].lastIndexOf("\""));
						break;
					}
				}
				
			}
			return date;
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
			if(pictureUrl.indexOf(".jpg") != -1)
			{
				output.text = output.text + "," + pictureUrl;
				allData.text = allData.text + ";" + data;
			}
			if(i < 30)
			{
				d.setDate(d.date - 1);
				getURL(d);
				i++;
			}
			else{
				loaded = true;
			}
				
		}
		
	}
}