package  
{
	import flash.display.Stage;
	import managers.*;
	import org.flixel.*
	
	public class Registry 
	{
		public static var stage:Stage;
		
		public static var pauseGroup:PauseGroup;
		
		public static var map:FlxTilemap;
		public static var effects:EffectsManager;
		public static var enemies:EnemyManager;
		
		public static var player:Player;
		public static var healthBar:HealthBar;
		public static var GameOver:FlxText;
		public static var SunGemPieces:int;
		
		public static var lastlevel:int; //1=west  2=east
		public static var eastGem:Boolean;
		public static var westGem:Boolean;
		
		public function Registry():void
		{
			
		}	
	}
}