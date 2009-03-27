package ua.com.syo.bcnettest.data {

	public class StageData {
		
		public static var stageW:int = 20;
		public static var stageH:int = 20;
		
		public static var cellW:int = 16;
		public static var cellH:int = 16;
		
		private static var mArray:Array;
		
		private static var isParse:Boolean = false;
		
		private static var map:String = 
			"00000000010000000000" +
			"00000000000000000000" +
			"00110000100000000000" +
			"00001100000000000000" +
			"00010000010000000000" +
			"00010001000001110000" +
			"10000011000000000000" +
			"00100000010000111100" +
			"10000000000000000001" +
			"00000000010000000000" +
			"00000000000000000001" +
			"00110000101111110001" +
			"00001100000000000001" +
			"00010000010000000000" +
			"00010001000000000000" +
			"10000011000000000000" +
			"00100000010000000000" +
			"10000000000000000001" +
			"10000000000000000000" +
			"10000000000000000000";
			
			
		public static function getCellId(x:int, y:int): String {
			if (!isParse) {
				parseMap();
			}
			return mArray[x][y];
		}
		
		private static function parseMap():void {
			mArray = new Array();
			for (var m:int = 0; m < StageData.stageW; m++) {
				mArray[m] = new Array();
			}
			
			var counter:int = 0;
			for (var x:int = 0; x < StageData.stageW; x ++) {
				for (var y:int = 0; y < StageData.stageH; y ++) {
					mArray[y][x] = map.charAt(counter);
					if (!mArray[y][x]) { 
						mArray[y][x] = "1";
					}
					counter++;
				}
			}
		}	
	}
}

