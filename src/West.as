package  
{
	import managers.*;
	import org.flixel.*;
	
	public class West extends FlxState
	{
		private var level:BaseLevel;
		private var columns:FlxGroup = new FlxGroup();
		private var platforms:FlxGroup = new FlxGroup();
		private var strings:StringManager = new StringManager;
		private var play:Boolean;
		private var knight1chat:FlxChatBox;
		private var sunGemPiece:SunGem;
		private var altarChat:FlxChatBox;
		
		private var platformPath:FlxPath;
		
		public function West():void
		{
			
		}
		
		protected function onSpriteAddedCallback(sprite:FlxSprite, group:FlxGroup):void
		{
			if (sprite is Column) columns.add(sprite);
			if (sprite is Skeleton) Registry.enemies.add(sprite);
			if (sprite is Platform) platforms.add(sprite);
			if (sprite is Rope) strings.add(sprite);
		}
		
		override public function create():void
		{
			FlxG.framerate = 60;
			FlxG.flashFramerate = 60;
			FlxG.bgColor = 0xFF2c376f;
			Registry.lastlevel = 1;
			FlxG.music.stop();
			
			var emitter:FlxEmitter = new FlxEmitter(0,0, 130);
			emitter.width = 384;
			emitter.height = 80;
			emitter.setXSpeed(0, 0);
			emitter.setYSpeed(0, 0);
			emitter.start(true, 0, 0.05);
			add(emitter);
			for(var i:int = 0; i < emitter.maxSize; i++)
			{
				var particle:FlxParticle = new FlxParticle();
				particle.scrollFactor.x = particle.scrollFactor.y = 0;
				particle.makeGraphic(1, 1, 0xFFFFFFF);
				particle.alpha = 0.35;
				particle.exists = false;
				emitter.add(particle);
				particle = new FlxParticle();
				particle.scrollFactor.x = particle.scrollFactor.y = 0;
				particle.makeGraphic(2, 2, 0xFFFFFFFF);
				particle.alpha = 0.2;
				particle.exists = false;
				emitter.add(particle);
			}
			
			level = new Level_West(true, onSpriteAddedCallback);
			
			//KNIGHTS
			var knight1:Knight = new Knight(2113, 1536);
			knight1.facing = FlxObject.LEFT;
			add(knight1);
			knight1chat = new FlxChatBox(100, knight1, ["There use to be a bridge here to reach the other side..", "I wonder what happened to it..."]);
			add(knight1chat);
			
			var knight2:Knight = new Knight(2906, 1008);
			add(knight2);
			var knight2chat:FlxChatBox = new FlxChatBox(100, knight2, ["Is this my dream or yours?"]);
			add(knight2chat);
			
			var knight3:Knight = new Knight(2034, 800);
			knight3.facing = FlxObject.LEFT;
			add(knight3);
			var knight3chat:FlxChatBox = new FlxChatBox(100, knight3, ["Why must things be destroyed for them to change?"]);
			add(knight3chat);
			
			var knight4:Knight = new Knight(1781, 304);
			add(knight4);
			var knight4chat:FlxChatBox = new FlxChatBox(100, knight4, ["If I've ever been myself, it wasn't tonight..."]);
			add(knight4chat);
			
			//PLATFORMS
			platformPath = new FlxPath([new FlxPoint(2001, 1566)]);
			
			//SUNGEM PIECE
			sunGemPiece = new SunGem(163, 1640);
			sunGemPiece.frame = 12;
			add(sunGemPiece);
			if (Registry.westGem) sunGemPiece.visible = false;
			else sunGemPiece.visible = true;
			
			if (Registry.SunGemPieces == 0)
			{
				altarChat = new FlxChatBox(FlxG.width, sunGemPiece, [
				"Warrior you have obtained a piece of the sun gem.", 
				"You are very close to saving us all.",
				"Warrior please hurry."],
				8, false, false, "center");
			}
			else
			{
				altarChat = new FlxChatBox(FlxG.width, sunGemPiece, [
				"Warrior you have done it.",
				"Come to me and I will explain what you must do."],
				8, false, false, "center");
			}
			add(altarChat);
			
			//PLAYERS
			Registry.player = new Player(3150, 1665);
			Registry.player.facing = FlxObject.LEFT;
			//Registry.player = new Player(155, 1662);
			add(Registry.player);
			
			Registry.healthBar = new HealthBar();
			add(Registry.healthBar);
			
			//Managers
			Registry.effects = new EffectsManager();
			add(Registry.effects);
			
			Registry.map = level.mainLayer;
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_LOCKON);
			FlxG.camera.setBounds(16, 0, level.mainLayer.width-32, level.mainLayer.height-16);
			FlxG.worldBounds.make(0, 0, level.mainLayer.width, level.mainLayer.height);
		}
		
		override public function update():void
		{
			//SUPER
			if (!FlxG.paused) super.update();
			Registry.pauseGroup.update();
			
			if (Registry.player.x > 3170) FlxG.switchState(new Altar);
			
			//PLATFORMS
			if (!strings.members[0].alive) knight1chat.ChangeChat(["Hey there's a piece of the bridge!", "I wonder if there's more pieces hanging around..."]);
			
			for (var c:int = 0; c < platforms.length; c++)
			{
				if (!strings.members[c].alive) 
				{
					platforms.members[c].followPath(platformPath, 50, FlxObject.PATH_VERTICAL_ONLY);
				}
			}
			
			//STRINGS
			for (var i:int = 0; i < strings.length; i++)
			{
				strings.cutString(Registry.player, strings.members[i]);
			}
			
			//MUSIC
			if (!play)
			{
				FlxG.playMusic(Sources.Mp3West);
				FlxG.music.fadeIn(3);
				play = true;
			}
			
			//ENEMIES
			for (var k:int = 0; k < Registry.enemies.length; k++)
			{
				if (Registry.enemies.isEnemyHit(Registry.player, Registry.enemies.members[k])) Registry.enemies.hitEnemy(Registry.player, Registry.enemies.members[k]);
				if (Registry.enemies.isPlayerHit(Registry.player, Registry.enemies.members[k])) Registry.enemies.hitPlayer(Registry.player, Registry.enemies.members[k]);
			}
			
			//SUNGEM PIECE
			if (!Registry.westGem)
			{
				if (Registry.player.overlaps(sunGemPiece))
				{
					if (sunGemPiece.alive) Registry.SunGemPieces++;
					sunGemPiece.kill();
					Registry.westGem = true;
					if (!altarChat.done) altarChat.chatting = true;
				}
			}
			if (altarChat.done) FlxG.fade(0xFF000000, 1, backtoAltar);
			
			//GAME OVER
			if (Registry.player.y > 1723) if (Registry.player.alive) Registry.player.kill();
			if (Registry.player.alive == false)
			{
				if (Registry.GameOver == null)
				{
					Registry.GameOver = new FlxText(FlxG.width / 2, FlxG.height / 2, FlxG.width / 3, "YOU DIED \npress a");
					Registry.GameOver.setFormat("NES", 18, 0xFFFFFFFF, "center", 0xFF000000);
					Registry.GameOver.scrollFactor.x = Registry.GameOver.scrollFactor.y = 0;
					Registry.GameOver.alpha = 0;
					add(Registry.GameOver);
				}
				Registry.GameOver.alpha += 0.01;
				if (Registry.GameOver.alpha >= 0.8) 
				if (FlxG.keys.justPressed("A")) 
				{
					Registry.GameOver.kill();
					Registry.GameOver = null; 
					Registry.player = new Player(3119, 1662);
					add(Registry.player);
					FlxG.camera.follow(Registry.player, FlxCamera.STYLE_LOCKON);
				}
			}
			
			//OVERLAPS AND COLLIDES
			FlxG.overlap(Registry.player, columns, climb);
			FlxG.collide(Registry.player, level.mainLayer);
			FlxG.collide(Registry.player, platforms);
			FlxG.collide(Registry.enemies, level.mainLayer);
		}
		
		private function climb(player:Player, column:Column):void
		{
			if (player.overlaps(column))
			{
				if (FlxG.keys.UP) Registry.player.climb = true;
			}
			else player.climb = false;
		}
		
		private function backtoAltar():void
		{
			FlxG.switchState(new Altar);
		}
	}
}