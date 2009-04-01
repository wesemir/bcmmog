package ua.com.syo.bcnettest.data {

	public class StageData {
		
		public static var stageW:int = 20;
		public static var stageH:int = 20;
		
		public static var cellW:int = 16;
		public static var cellH:int = 16;
		
		private static var mArray:Array;
		
		private static var isParse:Boolean = false;
		
		private static var map:String = 
			"_________|__________" +
			"____________________" +
			"__||____|___________" +
			"____||______________" +
			"___|_____|__________" +
			"___|___|_____|||____" +
			"|_____||____________" +
			"__|______|____||||__" +
			"|__________________|" +
			"_________|__________" +
			"___________________|" +
			"__||____|_||||||___|" +
			"____||_____________|" +
			"___|_____|__________" +
			"___|___|____________" +
			"|_____||____________" +
			"__|______|__________" +
			"|__________________|" +
			"|___________________" +
			"|___________________";
			
			
		public static function getCellId(gX:int, gY:int): String {
			if (!isParse) {
				parseMap();
			}
			
			if (gX < 0 || gY < 0 || gX >= stageW || gY >= stageH) {
				return null;
			}
			
			return mArray[gX][gY];
		}
		
		public static function setCellId(id:String, gX:int, gY:int): void {
			if (gX >= 0 && gY >= 0 && gX < stageW && gY < stageH) {
				mArray[gX][gY] = id;
			}
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
						mArray[y][x] = "|";
					}
					counter++;
				}
			}
			isParse = true;
		}	
	}
}

