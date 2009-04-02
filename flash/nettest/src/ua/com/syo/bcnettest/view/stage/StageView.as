package ua.com.syo.bcnettest.view.stage {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	import ua.com.syo.bcnettest.data.StageData;
	import ua.com.syo.bcnettest.model.stage.SimpleCell;
	import ua.com.syo.bcnettest.model.stage.Tank;
	import ua.com.syo.utils.log.Logger;

	public class StageView extends Sprite {
		
		private var mapContainer:Sprite;
		private var objectsContainer:Sprite;
		public var userTank:Tank;
		
		public function StageView() {
			
			mapContainer = new Sprite();
			addChild(mapContainer);
			
			objectsContainer = new Sprite();
			addChild(objectsContainer);
			addEventListener(Event.ACTIVATE, activateHandler);
		}
		
		public function build():void {
			for (var x:int = 0; x < StageData.stageW; x ++) {
				for (var y:int = 0; y < StageData.stageH; y ++) {
					//trace(StageData.getCellId(x, y));
					if (StageData.getCellId(x, y) == "|") {
						var c:SimpleCell = new SimpleCell();
						c.x = x * StageData.cellW;
						c.y = y * StageData.cellH;
						mapContainer.addChild(c);
					}
				}
			}
		}
		
		public function addObject(t:Tank, x:int = 0, y:int = 0):void {
			objectsContainer.addChild(t);
			t.x = x;
			t.y = y;
			if (t.isUser) {
				initListeners();
				userTank = t;
			}
		}
		
		
		public function removeObject(t:Tank):void {
			objectsContainer.removeChild(t);
		}
		
		private function activateHandler(event:Event):void {
			stage.focus = this;
		}
		
		private function initListeners():void {
			addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		private function keyDownHandler(event:KeyboardEvent):void {
			Logger.DEBUG(event.keyCode);
			switch (event.keyCode) {
				case 38:
					userTank.direction = 1;
					break;
				case 39:
					userTank.direction = 2;
					break;
				case 40:
					userTank.direction = 3;
					break;
				case 37:
					userTank.direction = 4;
					break;			
			}
		}


	}
}

