package ua.com.syo.bcnettest.view.stage {
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	import ua.com.syo.bcnettest.data.StageData;
	import ua.com.syo.bcnettest.model.stage.SimpleCell;
	import ua.com.syo.bcnettest.model.stage.Tank;

	public class StageView extends Sprite {
		
		private var mapContainer:Sprite;
		private var objectsContainer:Sprite;
		private var objectsDict:Dictionary;
		
		public function StageView() {
			
			objectsDict = new Dictionary(true);
			
			mapContainer = new Sprite();
			addChild(mapContainer);
			
			objectsContainer = new Sprite();
			addChild(objectsContainer);
		}
		
		public function build():void {
			for (var x:int = 0; x < StageData.stageW; x ++) {
				for (var y:int = 0; y < StageData.stageH; y ++) {
					//trace(StageData.getCellId(x, y));
					if (StageData.getCellId(x, y) == "1") {
						var c:SimpleCell = new SimpleCell();
						c.x = x * StageData.cellW;
						c.y = y * StageData.cellH;
						mapContainer.addChild(c);
					}
				}
			}
		}
		
		public function addObject(t:Tank, x:int = 0, y:int = 0):void {
			objectsDict[t.id] = t;
			objectsContainer.addChild(t);
			t.x = x;
			t.y = y;
		}
		
		public function moveObject(id:String):void {
			
		}
		
		public function removeObject(t:Tank):void {
			objectsDict[t.id] = null;
			objectsContainer.removeChild(t);
		}

	}
}

