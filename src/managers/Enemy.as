package managers 
{
	import org.flixel.*;
	
	public class Enemy extends FlxSprite
	{
		public var hit:Boolean;
		public var attacking:Boolean;
		
		private var timer:Number = 0;
		
		public function Enemy(X:int, Y:int):void
		{
			super(X, Y);
		}
		
		override public function update():void
		{
			super.update();
			
			if (hit)
			{
				timer += FlxG.elapsed;
				if (timer > 0.3) 
				{
					hit = false;
					timer = 0;
				}
			}
		}
	}
}