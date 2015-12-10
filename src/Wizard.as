package  
{
	import org.flixel.*;
	import managers.Enemy;
	
	public class Wizard extends Enemy
	{
		
		public function Wizard(X:int, Y:int):void
		{
			super(X, Y);
			loadGraphic(Sources.ImgWizard, true, true, 25, 18);
			addAnimation("idle", [0, 1, 2], 5);
			addAnimation("about", [3, 4, 5, 6, 7], 5, false);
			addAnimation("floating", [8, 9, 10], 5);
			addAnimation("death", [11, 11, 11, 11, 11, 11, 11, 11, 11, 12, 11, 12, 11, 12, 11, 12, 11, 12, 11, 12, 13, 14, 15, 16, 17], 4, false);
			play("idle");
			
			health = 100;
		}
		
		override public function kill():void
		{
			super.kill();
			play("death");
			alive = false;
			exists = true;
			maxVelocity.x = 0;
			health = 0;
		}
	}
}