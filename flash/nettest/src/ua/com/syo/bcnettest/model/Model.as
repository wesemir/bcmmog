package ua.com.syo.bcnettest.model {
	import flash.events.EventDispatcher;
	
	import ua.com.syo.bcnettest.model.net.ServerProxy;
	

	public class Model extends EventDispatcher {

		/**
		 * Singletone
		 */
		private static var _instance:Model;

		public static function get instance():Model {

			if (_instance == null) {
				_instance = new Model();
			}
			return _instance;
		}
		
		/**
		 * init
		 */
		public function init():void {
			//Logger.DEBUG("Model initialized");
			ServerProxy.instance.connect();
		}
	}
}

