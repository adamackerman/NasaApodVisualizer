package com.powerflasher.SampleApp {
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	/**
	 * @author Adam
	 */
	//Imports
import flash.display.Shape;
import flash.display.Sprite;
import flash.geom.Rectangle;

//Class
public class DialogBox extends Sprite {

    //Vars
    protected var box:Shape;
    protected var yesBtn:Sprite;
	public var img:BitmapData;
	public var image:Bitmap;

    //Constructor
    public function DialogBox($:Rectangle, img: BitmapData):void {

        //Initialise
        box = new Shape();
        addChild(box);
		image = new Bitmap(img);
		image.x = 200;
		image.y = 100;
		image.width = 150;
		image.height = 150;
		addChild(image);
		
        //Render
        with (box.graphics) {
            lineStyle(1);
            beginFill(0, .5);
            drawRect($.x, $.y, $.width, $.height);
            endFill();
        }
		
	}
}
}