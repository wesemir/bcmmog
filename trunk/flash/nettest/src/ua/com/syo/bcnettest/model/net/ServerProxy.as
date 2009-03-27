package ua.com.syo.bcnettest.model.net {
	import ua.com.syo.bcnettest.data.Globals;
	import ua.com.syo.bcnettest.model.net.connections.IConnection;
	import ua.com.syo.bcnettest.model.net.connections.ServerMockConnection;
	import ua.com.syo.bcnettest.model.net.connections.SocketConnection;
	import ua.com.syo.bcnettest.model.net.events.CommunicateEvent;
	

	public class ServerProxy {

		/**
		 * Singleton
		 */
		private static var _instance:ServerProxy;

		public static function get instance():ServerProxy {

			if (_instance == null) {
				_instance = new ServerProxy();
			}

			return _instance;
		}
		
		private var connection:IConnection;
		
		public static var SOCKET_CONNECTION_TYPE:String = "socket";
		public static var OFFLINE_CONNECTION_TYPE:String = "offline";
		
		/**
		 * connect to server
		 */
		public function connect():void {
			switch (Globals.connectionType) {
				case SOCKET_CONNECTION_TYPE:
					connection = new SocketConnection(); 
					break;
				case OFFLINE_CONNECTION_TYPE:
					connection = new ServerMockConnection();   
					break;
			}
			initListeners();
			connection.connect();
		}
		
		private function initListeners():void {
			//connection.addEventListener(CommunicateEvent.CONNECT, connectSuccesfulHandler);
			//connection.addEventListener(CommunicateEvent.CONNECT_FAILED, connectFailedHandler);
			//connection.addEventListener(CommunicateEvent.DATA_RECEIVED, dataReceivedHandler);
		}
		
		private function removeListeners():void {
			//connection.removeEventListener(CommunicateEvent.CONNECT, connectSuccesfulHandler);
			//connection.removeEventListener(CommunicateEvent.CONNECT_FAILED, connectFailedHandler);
			//connection.removeEventListener(CommunicateEvent.DATA_RECEIVED, dataReceivedHandler);
		}
	}
}

