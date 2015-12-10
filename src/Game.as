package
{
	import org.flixel.*;
	import managers.*;
	
	public class Game extends FlxGame
	{
		private const resolution:FlxPoint = new FlxPoint(768, 432);
		private const zoom:uint = 2;
		private const fps:uint = 60;
		
		public function Game()
		{
			super(resolution.x / zoom, resolution.y / zoom, TitleScreen, zoom);
			FlxG.flashFramerate = fps;
			Registry.pauseGroup = new PauseGroup();
			Registry.SunGemPieces = 0;
			
			//levels
			Registry.lastlevel = 0;
			Registry.eastGem = false;
			Registry.westGem = false;
			
			//managers
			Registry.effects = new EffectsManager();
			Registry.enemies = new EnemyManager();
		}
	}
}