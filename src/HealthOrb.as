package  
{
	import org.flixel.*;
	
	public class HealthOrb extends FlxSprite 
	{
		private var timer:Number = 0;
		
		public function HealthOrb(X:int, Y:int):void
		{
			super(X, Y);
			loadGraphic(Sources.ImgHealthOrb, true, false, 8, 8);
			addAnimation("idle", [0, 1, 2, 3, 4], 5);
			play("idle");
		}
		
		override public function update():void
		{
			super.update();
			if (timer > 0.5)
			{
				if (overlaps(Registry.player))
				{
					Registry.player.hurt( -15);
					super.kill();
				}
			}
			else timer += FlxG.elapsed;
		}
	}
}