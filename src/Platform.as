package  
{
	import org.flixel.*;
	
	public class Platform extends FlxSprite 
	{
		public var go:Boolean;
		
		public function Platform(X:int, Y:int):void
		{
			super(X, Y, Sources.ImgPlatform);
			immovable = true;
		}
	}
}