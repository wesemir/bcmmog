package ua.com.syo.bcnettest.model.net.connections {
	import flash.events.IEventDispatcher;
	
	public interface IConnection extends IEventDispatcher {
		
		function connect():void;
		
		function send(command:String):void;
	}
}