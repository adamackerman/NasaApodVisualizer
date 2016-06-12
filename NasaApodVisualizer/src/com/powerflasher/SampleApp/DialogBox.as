package com.powerflasher.SampleApp {
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

    //Constructor
    public function DialogBox($:Rectangle):void {

        //Initialise
        box = new Shape();
        addChild(box);
		
        //Render
        with (box.graphics) {
            lineStyle(1);
            beginFill(0, 0.4);
            drawRect($.x, $.y, $.width, $.height);
            endFill();
        }
	}
}
}