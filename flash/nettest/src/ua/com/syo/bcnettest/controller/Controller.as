package ua.com.syo.bcnettest.controller {
	import flash.events.EventDispatcher;
	
	import ua.com.syo.bcnettest.model.Model;
	import ua.com.syo.bcnettest.view.UIManager;
	import ua.com.syo.utils.log.Logger;
	

	public class Controller extends EventDispatcher {

		/**
		 * Singleton
		 */
		private static var _instance:Controller;

		public static function get instance():Controller {

			if (_instance == null) {
				_instance = new Controller();
			}
			return _instance;
		}
		
		/**
		 * init all MVC components
		 */
		public function init():void {
			Model.instance.init();
			UIManager.instance.init();
			Logger.INFO("Controller initialized");
			
			GameplayController.instance.init(UIManager.instance.stageView);
		}
	}
}

