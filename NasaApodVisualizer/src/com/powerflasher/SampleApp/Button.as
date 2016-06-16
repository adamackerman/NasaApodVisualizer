package com.powerflasher.SampleApp {
	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import flash.display.Shape;
	/**
	 * @author Adam
	 */
	
	public class Button extends Sprite{
		protected var box:Shape;
		
		public function Button(rect:Rectangle)
		{
			box = new Shape();
			addChild(box);
			
			with (box.graphics) {
            lineStyle(1);
            beginFill(0x000000, 1);
            drawRect(rect.x, rect.y, rect.width, rect.height);
            endFill();
        }
			
		}
	}
}