package ua.com.syo.bcnettest.model.stage {
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import ua.com.syo.bcnettest.data.StageData;

	public class Tank extends Sprite {
		
		public var id:String;
		private var _direction:int = 2;
		
		public var speed:int = 1;
		
		public var dx:int = 0;
		public var dy:int = 0;
		
		public var newX:int = 0;
		public var newY:int = 0;
		
		public var gX:int = 0;
		public var gY:int = 0;
		
		public var dirChangeDelay:int = 50;
		
		private var tf:TextField;
		
		public var isUser:Boolean = false;
		
		public function Tank(id:String, isU:Boolean) {
			this.id = id;
			this.isUser = isU;
			
			var r:Shape = new Shape();
			r.graphics.beginFill(0xcccccc, 1);
			r.graphics.drawRect(1, 1, StageData.cellW - 2, StageData.cellH - 2);
			addChild(r);
			
			tf = new TextField();
			tf.text = id;
			tf.selectable = false;
			addChild(tf);
		}
		
		public function move():void {
			
			newX = x + dx * speed;
			newY = y + dy * speed;
			
			var oldGX:int = Math.round(x / StageData.cellW);
			var oldGY:int = Math.round(y / StageData.cellH);
			
			StageData.setCellId("_", oldGX, oldGY);
			
			gY = Math.round(newY / StageData.cellH);
			gX = Math.round(newX / StageData.cellW);
			
			if (_direction == 1 || _direction == 4) {
				gX = Math.floor(newX /StageData.cellW);
				gY = Math.floor(newY / StageData.cellH);
			} 
			if (_direction == 2 || _direction == 3) {
				gX = Math.ceil(newX / StageData.cellW);
				gY = Math.ceil(newY / StageData.cellH);
			} 
			
			//gX = Math.round( (x + dx) / StageData.cellW );
			//gY = Math.round( (y + dy) / StageData.cellH );
			
			if (StageData.getCellId(gX, gY) == "_") {
				x = newX;
				y = newY;
				StageData.setCellId("|", Math.round(x / StageData.cellW), Math.round(y / StageData.cellH))
				
			} else {
				if (!isUser) {
					direction = Math.round(Math.random()*3) +1;
					dirChangeDelay = Math.round(Math.random()*200);
				}
				
			}
			if (!isUser) {
				if (-- dirChangeDelay < 0) {
					direction = Math.round(Math.random()*3);
					dirChangeDelay = Math.round(Math.random()*200);
				}
			}
		}
		
		public function set direction(value:int):void {
				_direction = value;
				//tf.text = value.toString();
				switch (_direction) {
					// up
					case 1:
						dx = 0; 
						dy = -1; 
						x = Math.round( x / StageData.cellW ) *  StageData.cellW;
						break;
					// right	
					case 2:
						dx = 1; 
						dy = 0; 
						y = Math.round( y / StageData.cellH ) *  StageData.cellH;
						break;
					// down
					case 3:
						dx = 0; 
						dy = 1; 
						x = Math.round( x / StageData.cellW ) *  StageData.cellW;
						break;
					// left	
					case 4:
						dx = -1; 
						dy = 0; 
						y = Math.round( y / StageData.cellH ) *  StageData.cellH;
						break;
				}
			
		}

	}
}

