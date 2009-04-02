package {
	import flash.display.Sprite;
	
	import ua.com.syo.bcnettest.controller.Controller;
	import ua.com.syo.bcnettest.view.UIManager;
	import ua.com.syo.utils.log.Logger;

	[SWF(width="320", height = "320", frameRate = "31")]
	
	public class Main extends Sprite {
		
		public function Main() {
			// container for logger panel 
			var loggerContainer:Sprite = Logger.init(this, true, true, true);
			
			Controller.instance.init();
			
			// add root view
			addChild(UIManager.instance);
			
			if (Logger.enableDebugMode) {
				// put logger panel on the upper level
				swapChildren(loggerContainer, UIManager.instance);
			}
		}
	}
}
