package  
{
	import org.flixel.*;
	
	public class Tree extends FlxSprite
	{
		
		public function Tree(X:int, Y:int):void
		{
			super(X, Y);
			loadGraphic(Sources.ImgTree, false, false, 90, 80);
			randomFrame();
		}
	}
}