package ua.com.syo.bcnettest.view {
	import flash.display.MovieClip;
	
	import ua.com.syo.bcnettest.data.StageData;
	import ua.com.syo.bcnettest.model.stage.Tank;
	import ua.com.syo.bcnettest.view.stage.StageView;
	
	public class UIManager extends MovieClip {

		/**
		 * Singleton
		 */
		private static var _instance:UIManager;

		public static function get instance():UIManager {

			if (_instance == null) {
				_instance = new UIManager();
			}
			return _instance;
		}
		
		public var stageView:StageView;
		
		public function init():void {
			stageView = new StageView();
			addChild(stageView);
			
			buildStage();
		}
		
		public function buildStage():void {
			stageView.build();
		}

	}
}

