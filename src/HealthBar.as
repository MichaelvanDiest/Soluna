package  
{
	import org.flixel.*;
	
	public class HealthBar extends FlxGroup
	{
		private var healthGraphic:FlxSprite;
		private var health:FlxSprite;
		
		private var sungemPiece1:SunGem;
		private var sungemPiece2:SunGem;
		
		public function HealthBar():void
		{
			health = new FlxSprite(17, 18);
			health.makeGraphic(66, 6, 0xFFd72b2b);
			health.scrollFactor.x = health.scrollFactor.y = 0;
			health.setOriginToCorner();
			add(health);
			
			healthGraphic = new FlxSprite(10, 10, Sources.ImgHealthBar);
			healthGraphic.scrollFactor.x = healthGraphic.scrollFactor.y = 0;
			add(healthGraphic);
			
			sungemPiece1 = new SunGem(30, 25);
			sungemPiece1.scrollFactor.x = sungemPiece1.scrollFactor.y = 0;
			sungemPiece1.scale.x = sungemPiece1.scale.y = 0.5;
			sungemPiece1.frame = 12;
			sungemPiece1.visible = false;
			add(sungemPiece1);
			
			sungemPiece2 = new SunGem(40, 25);
			sungemPiece2.scrollFactor.x = sungemPiece2.scrollFactor.y = 0;
			sungemPiece2.scale.x = sungemPiece2.scale.y = 0.5;
			sungemPiece2.frame = 13;
			sungemPiece2.visible = false;
			add(sungemPiece2);
		}
		
		override public function update():void
		{
			super.update();
			if (Registry.player.health > 0) { health.visible = true;  health.scale.x = Registry.player.health / 100; }
			else health.visible = false;
			
			if (Registry.SunGemPieces >= 1)
			{
				sungemPiece1.visible = true;
			}
			if (Registry.SunGemPieces >= 2)
			{
				sungemPiece2.visible = true;
			}
		}
	}
}