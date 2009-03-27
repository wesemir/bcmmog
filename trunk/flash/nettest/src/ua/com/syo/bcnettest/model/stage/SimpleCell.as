package ua.com.syo.bcnettest.model.stage {
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import ua.com.syo.bcnettest.data.StageData;

	public class SimpleCell extends Sprite {

		public function SimpleCell() {
			var r:Shape = new Shape();
			r.graphics.beginFill(0x999999, 1);
			r.graphics.drawRect(1, 1, StageData.cellW - 2, StageData.cellH - 2);
			addChild(r);
		}

	}
}

