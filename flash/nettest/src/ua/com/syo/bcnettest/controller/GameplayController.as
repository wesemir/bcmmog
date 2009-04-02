package ua.com.syo.bcnettest.controller {
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	import ua.com.syo.bcnettest.data.StageData;
	import ua.com.syo.bcnettest.model.stage.Tank;
	import ua.com.syo.bcnettest.view.stage.StageView;

	public class GameplayController extends EventDispatcher {
		
		/**
		 * Singleton
		 */
		private static var _instance:GameplayController;

		public static function get instance():GameplayController {

			if (_instance == null) {
				_instance = new GameplayController();
			}
			return _instance;
		}
		
		private var objectsDict:Dictionary;
		
		public var stageV:StageView; 
		public var tickTimer:Timer;
		
		public function init(sv:StageView):void {
			stageV = sv;
			
			objectsDict = new Dictionary(true);
			
			tickTimer = new Timer(10);
			tickTimer.addEventListener(TimerEvent.TIMER, timerHandler);
			
			tickTimer.start();
			addObject("user", 5, 5, true);
			
			for (var i:int = 2; i < 10; i++) {
				addObject(i.toString(), 1, 1);
			}
		}
		
		private function timerHandler(event:TimerEvent):void {
			//stageV.moveObject("1");
			for each (var o:Object in objectsDict) {
				var t:Tank = (o as Tank);
				t.move();
			}
		}
		
		public function addObject(id:String, gX:int, gY:int, isUser:Boolean = false, dir:int = 2):void {
			var t:Tank = new Tank(id, isUser);
			objectsDict[t.id] = t;
			stageV.addObject(t, gX * StageData.cellW, gY * StageData.cellH);
			t.direction = dir;
		}
		

	}
}

