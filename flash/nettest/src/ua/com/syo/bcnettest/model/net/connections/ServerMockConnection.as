/**
 * ServerMockConnection.as	connection implements for offline mode
 * @author					Krivosheya Sergey
 * @link    				http://www.syo.com.ua/
 * @link    				mailto: syopic@gmail.com
 */
 
package ua.com.syo.bcnettest.model.net.connections {
	import flash.events.EventDispatcher;
	
	import ua.com.syo.bcnettest.model.net.events.CommunicateEvent;
	
	public class ServerMockConnection extends EventDispatcher implements IConnection  {
		
		
		/**
		 * Constructor
		 */
		public function ServerMockConnection() {
		}
		
		/**
		 * Connect to mock server
		 */
		public function connect():void {
		}
		
		/**
		 * data received from serverMock
		 */
		private function dataReceivedHandler(event:CommunicateEvent):void {
		}
		
		/**
		 * send command
		 * @param command command string
		 */
		public function send(command:String):void {
		}
		
		
	}
}