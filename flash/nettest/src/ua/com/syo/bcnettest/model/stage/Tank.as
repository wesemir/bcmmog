package ua.com.syo.bcnettest.model.stage {
	import flash.display.Shape;
	import flash.display.Sprite;
	
	import ua.com.syo.bcnettest.data.StageData;

	public class Tank extends Sprite {
		
		public var id:String;
		
		public function Tank(id:String) {
			this.id = id;
			var r:Shape = new Shape();
			r.graphics.beginFill(0xcccccc, 1);
			r.graphics.drawRect(1, 1, StageData.cellW - 2, StageData.cellH - 2);
			addChild(r);
		}

	}
}

