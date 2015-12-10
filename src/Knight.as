package  
{
	import org.flixel.*;
	
	public class Knight extends FlxSprite
	{
		
		public function Knight(X:int, Y:int):void
		{
			super(X, Y);
			loadGraphic(Sources.ImgKnight, true, true, 26, 16);
			addAnimation("idle", [0, 1], 3);
			play("idle");
		}
	}
}