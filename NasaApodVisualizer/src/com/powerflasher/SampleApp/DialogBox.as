package com.powerflasher.SampleApp {
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
	public var img:Bitmap;

    //Constructor
    public function DialogBox($:Rectangle, img: Bitmap):void {

        //Initialise
        box = new Shape();
        addChild(box);
		img.x = 200;
		img.y = 100;
		img.width = 150;
		img.height = 150;
		addChild(img);
		
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