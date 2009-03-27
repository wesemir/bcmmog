/**
 * Logger.as			
 * @author				Krivosheya Sergey
 * @link    			http://www.syo.com.ua/
 * @link    			mailto: syopic@gmail.com
 */
package ua.com.syo.utils.log {
	import flash.display.Sprite;
	import flash.utils.getTimer;

	public class Logger {

		public static var container:Sprite;
		private static var outputInHtml:Boolean = false;
		private static var logPanel:LogPanel;
		/**
		 * trace level
		 * 
		 * 1 All messages
		 * 2 INFO
		 * 3 DEBUG
		 * 4 WARNING
		 * 5 ERROR
		 */
		private static var traceLevel:int = 1;
		public static var enableDebugMode:Boolean = true;

		/**
		 * logger init
		 * @param cont DisplayObject container
		 * @param autoShow show, when incoming any message
		 * @param output as html (for coloring) - WARNING - dont work with XML
		 * 
		 * @return logPanel instance
		 */
		public static function init(cont:Sprite, 
									autoShow:Boolean = true, 
									outInHtml:Boolean = false,
									enableDM:Boolean = false):Sprite {
			enableDebugMode = enableDM;						
			if (enableDebugMode) {
				container = cont;
				outputInHtml = outInHtml;
				logPanel = new LogPanel(container, autoShow, outputInHtml);
			}
			return logPanel;
		}

		/**
		 * set trace level
		 */
		public static function setTraceLevel(level:Number):void {
			traceLevel = level;
		}

		/**
		 * get time since launch
		 */
		private static function getTime():String {
			return (getTimer() / 1000).toFixed(3);
		}

		/**
		 * simple tracer
		 */
		public static function trace(str:* = ""):void {
			if (logPanel != null && enableDebugMode) {
				logPanel.append("[" + getTime() + "]" + str);
			}
		}

		/**
		 * different levels
		 */
		public static function INFO(str:* = ""):void {
			if (logPanel != null && traceLevel < 3 && enableDebugMode) {
					
				if (outputInHtml) {
					logPanel.append("<font color='#0066FF'>[" + getTime() + "]<b> INFO:  </b> " + str + "</font>");
				} else {
					logPanel.append("[" + getTime() + "] INFO: " + str);
				}
			}
		}

		public static function DEBUG(str:* = ""):void {
			str = str.toString();
			if (logPanel != null && traceLevel < 4 && enableDebugMode) {
				if (outputInHtml) {
					logPanel.append("<font color='#006600'>[" + getTime() + "]<b> DEBUG: </b> " + str + "</font>");
				} else {
					logPanel.append("[" + getTime() + "] INFO: " + str);
				}
			}
		}

		public static function WARNING(str:* = ""):void {
			if (logPanel != null && traceLevel < 5 && enableDebugMode) {
				if (outputInHtml) {
					logPanel.append("<font color='#FF9900'>[" + getTime() + "]<b> WARNING:</b> " + str + "</font>");
				} else {
					logPanel.append("[" + getTime() + "] WARNING: " + str);
				}
			}
		}

		public static function ERROR(str:* = ""):void {
			if (logPanel != null && traceLevel < 6 && enableDebugMode) {
				if (outputInHtml) {
					logPanel.append("<font color='#FF0000'>[" + getTime() + "]<b> ERROR: </b> " + str + "</font>");
				} else {
					logPanel.append("[" + getTime() + "] ERROR: " + str);
				}
			}
		}
	}
}