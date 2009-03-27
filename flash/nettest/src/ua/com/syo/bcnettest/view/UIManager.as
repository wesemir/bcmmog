package ua.com.syo.bcnettest.view {
	import flash.display.MovieClip;
	
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
		
		public function init():void {
		}

	}
}

