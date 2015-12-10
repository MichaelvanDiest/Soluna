package managers  
{
	import org.flixel.*;
	
	public class DamagePoints extends FlxText
	{
		private var timer:Number = 0;
		
		public function DamagePoints(X:int, Y:int, Dmg:int, player:Boolean, Dead:Boolean=false):void
		{
			super(X - 6, Y, 50);
			if (player) color = 0xFFFF0000;
			else color = 0xFFFFFFFF;
			if (!Dead) text = Dmg.toString();
			else text = "DEAD";
			shadow = 0xFF000000;
		}
		
		override public function update():void
		{
			super.update();
			y -= 0.5;
			
			timer += FlxG.elapsed;
			if (timer > 0.15) alpha -= 0.03;
			
			if (alpha == 0) kill();
		}
	}
}