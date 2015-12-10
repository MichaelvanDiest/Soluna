package managers
{
	import managers.DamagePoints;
	import org.flixel.*;
	
	public class EffectsManager extends FlxGroup
	{
		
		public function EffectsManager():void
		{
			
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function addDamagePoints(X:int, Y:int, Dmg:int, player:Boolean):void
		{
			var damage:DamagePoints = new DamagePoints(X, Y-(5+(FlxG.random()*10)), Dmg, player);
			add(damage);
		}
		
		public function addDead(X:int, Y:int):void
		{
			var dead:DamagePoints = new DamagePoints(X, Y, 0, false, true);
			add(dead);
		}
	}
}