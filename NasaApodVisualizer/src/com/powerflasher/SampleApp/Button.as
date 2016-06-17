package com.powerflasher.SampleApp {
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import flash.display.Shape;
	/**
	 * @author Adam
	 */
	
	public class Button extends Sprite{
		public var box:Shape;
		public var text:TextField;
		
		public function Button(rect:Rectangle)
		{
			box = new Shape();
			addChild(box);
			text = new TextField();
			var format:TextFormat = new TextFormat();
			format.size = 18;
			format.underline = true;
			
			text.defaultTextFormat = format;
			text.text = "Back";
			text.textColor = 0x0000FF;
			text.x = rect.x;
			text.y = rect.y;
			addChild(text);
			
			
			
			
			with (box.graphics) {
            beginFill(0, 0);
            drawRect(rect.x, rect.y, rect.width, rect.height);
            endFill();
        }
			
		}
		
	}
}