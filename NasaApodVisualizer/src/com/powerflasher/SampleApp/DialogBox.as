package com.powerflasher.SampleApp {
	import flash.text.TextFormat;
	import flash.text.TextField;
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
	protected var bodyText:TextField;
	protected var titleText:TextField;

    //Constructor
    public function DialogBox($:Rectangle, img: BitmapData, txt:String, title:String):void {

        //Initialise
        box = new Shape();
        addChild(box);
		image = new Bitmap(img);
		image.x = 200;
		image.y = 100;
		image.width = 150;
		image.height = 150;
		addChild(image);
		
		bodyText = new TextField;
		bodyText.text = txt;
		bodyText.x = 140;
		bodyText.y = 300;
		bodyText.width = 285;
		bodyText.wordWrap = true;
		addChild(bodyText);
		
		var format:TextFormat = new TextFormat();
		format.size = 22;
		format.bold = true;
		
		titleText = new TextField();
		titleText.text = title;
		titleText.x = 220;
		titleText.y = 80;
		titleText.width = 120;
		titleText.defaultTextFormat = format;
		addChild(titleText);
		
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