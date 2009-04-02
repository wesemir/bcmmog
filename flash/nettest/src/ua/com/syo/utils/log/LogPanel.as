/**
 * LogPanel.as			log trace visualization 
 * @author				Krivosheya Sergey
 * @link    			http://www.syo.com.ua/
 * @link    			mailto: syopic@gmail.com
 */
package ua.com.syo.utils.log {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	public class LogPanel extends Sprite {

		private var outputTextfield:TextField;
		private var auto:Boolean;
		private var outputInHtml:Boolean = false;
		private var startTick:Number;
		private var numFrames:Number;
		private var fpsLabel:TextField;
		private var memoryLabel:TextField;
		private var format:TextFormat;
		private var logArray:Array = new Array();
		private var logCounter:int = 0;
		private var maxLogLength:int = 300;

		/**
		 * constructor
		 */
		public function LogPanel(d:Sprite , autoshow:Boolean = true , outInHtml:Boolean = false) {
			d.addChild(this);
			create();
			this.outputInHtml = outInHtml;
			this.auto = autoshow;
			adjustSize(new Event(Event.RESIZE));
			d.addEventListener(Event.RESIZE, adjustSize);
		}

		/**
		 * creates the panel on the sprite
		 */
		private function create(barH:Number = 20 , outputH:Number = 50):void {
			// active bar
			var activeBar:Sprite = new Sprite();
			activeBar.graphics.beginFill(0xAAAAAA, 0.6);
			activeBar.graphics.drawRect(0, 0, outputH, barH);
			activeBar.name = "activeBar";
			format = new TextFormat();
			format.font = "Courier";
			format.size = 11;
			format.color = 0x000000;
			fpsLabel = new TextField();
			fpsLabel.height = barH;
			fpsLabel.mouseEnabled = false;
			memoryLabel = new TextField();
			memoryLabel.height = barH;
			memoryLabel.x = 70;
			memoryLabel.mouseEnabled = false;
			// output text field
			outputTextfield = new TextField();
			outputTextfield.y = barH;
			outputTextfield.type = TextFieldType.INPUT;
			outputTextfield.background = true;
			outputTextfield.backgroundColor = 0xEEEEEE;
			outputTextfield.height = outputH;
			outputTextfield.multiline = true;
			outputTextfield.wordWrap = true;
			outputTextfield.defaultTextFormat = format;
			format.color = 0x222222;
			fpsLabel.defaultTextFormat = format;
			memoryLabel.defaultTextFormat = format;
			activeBar.addEventListener(MouseEvent.CLICK, toggle);
			addEventListener(Event.ENTER_FRAME, onTick);
			addChild(activeBar);
			addChild(fpsLabel);
			addChild(memoryLabel);
			initFPS();
		}

		/**
		 * init FPS counter
		 */
		private function initFPS():void {
			numFrames = 0;
			startTick = getTimer();
			var t:Timer = new Timer(1000);
			t.addEventListener(TimerEvent.TIMER, timerHandler);
			t.start();
			adjustSize(new Event(Event.RESIZE));
		}

		private function timerHandler(event:TimerEvent):void {
			fpsLabel.text = "FPS:" + numFrames;
			memoryLabel.text = "MEM:" + (Math.round(((System.totalMemory / 1024) / 1024) * 10)) / 10 + " MB";
			numFrames = 0;
			if (getChildByName("activeBar").width > 160 ) {
				adjustSize(new Event(Event.RESIZE));
			}
		}

		/**
		 * show FPS and Memory usage
		 */
		public function onTick(event:Event):void {
			numFrames++;
		}

		/**
		 * adjusts the size of the panel depending on the stage
		 */
		public function adjustSize(e:Event):void {
			if (stage) {
				outputTextfield.width = stage.stageWidth;
				getChildByName("activeBar").width = 160;
				this.y = stage.stageHeight - this.height;
			}else {
				outputTextfield.width = 800;
				getChildByName("activeBar").width = 323;
				this.y = 323 - this.height;
			}
		}

		/**
		 * toggles the output panel
		 */
		private function toggle(e:Event = null):void {
			if(contains(outputTextfield)) {
				removeChild(outputTextfield);
			}else {
				addChild(outputTextfield);
			}
			adjustSize(new Event(Event.RESIZE));
		}

		/**
		 * add new string
		 */
		public function append(txt:String):void {
			//logArray.push(txt);
			if (++logCounter > maxLogLength) {
				//logArray.shift();
				logCounter = 0;
				outputTextfield.htmlText = "";
				outputTextfield.text = "";
			}

			outputTextfield.defaultTextFormat = format;
			//for (var i:int = 0; i<logArray.length; i++) {
			if (outputInHtml) {
				outputTextfield.htmlText += txt;
			}else {
				outputTextfield.appendText(txt);
			}

			//}
			outputTextfield.scrollV = outputTextfield.maxScrollV;
			if( auto && !contains(outputTextfield) ) toggle();
		}

		/**
		 * clear log
		 */
		public function clear():void {
			outputTextfield.text = "";
			outputTextfield.htmlText = "";
		}
	}
}
