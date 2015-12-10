package  
{
	import org.flixel.*;
	import managers.Enemy;
	
	public class EnergyBall extends Enemy
	{
		
		public function EnergyBall(X:int, Y:int):void
		{
			super(X, Y);
			loadGraphic(Sources.ImgEnergyBall, true, false, 16, 16);
			addAnimation("ChargingUp", [12, 13, 14, 15, 12, 13, 14, 15, 8, 9, 10, 11, 8, 9, 10, 11, 16, 17, 18, 19, 0, 1, 2, 3, 0, 1, 2, 3], 5);
			addAnimation("Big", [4, 5, 6, 7], 5);
			
			width = 10;
			height = 10;
			centerOffsets();
		}
		
	}

}