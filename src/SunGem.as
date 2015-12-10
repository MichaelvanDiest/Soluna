package  
{
	import org.flixel.*;
	
	public class SunGem extends FlxSprite
	{
		
		public function SunGem(X:int, Y:int):void
		{
			super(X, Y);
			loadGraphic(Sources.ImgSunGem, true, false, 16, 16);
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7], 10);
			addAnimation("break", [8, 9, 10, 11], 2, false);
			play("idle");
		}
	}
}