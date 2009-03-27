/**
 * SocketConnection.as		Socket Connection implementation
 * @author					Krivosheya Sergey
 * @link    				http://www.syo.com.ua/
 * @link    				mailto: syopic@gmail.com
 */
package ua.com.syo.bcnettest.model.net.connections {
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.Socket;
	import flash.net.XMLSocket;
	import flash.system.Security;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	import ua.com.syo.bcnettest.model.net.ServerProxy;
	import ua.com.syo.bcnettest.model.net.events.CommunicateEvent;
	
	public class SocketConnection extends EventDispatcher implements IConnection {
		
		/**
		 * Constructor
		 */
		public function SocketConnection() {
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