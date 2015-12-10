package  
{
	import managers.*;
	import org.flixel.*;
	
	public class East extends FlxState
	{
		private var level:BaseLevel;
		private var columns:FlxGroup = new FlxGroup();
		private var play:Boolean;
		private var sunGemPiece:SunGem;
		private var altarChat:FlxChatBox;
		
		public function East():void
		{
			
		}
		
		protected function onSpriteAddedCallback(sprite:FlxSprite, group:FlxGroup):void
		{
			if (sprite is Column) columns.add(sprite);
			if (sprite is Skeleton) Registry.enemies.add(sprite);
		}
		
		override public function create():void
		{
			FlxG.framerate = 60;
			FlxG.flashFramerate = 60;
			FlxG.bgColor = 0xFF2c376f;
			Registry.lastlevel = 2;
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
			
			level = new Level_East(true, onSpriteAddedCallback);
			
			//KNIGHTS
			var knight1:Knight = new Knight(271, 992);
			add(knight1);
			var knight1chat:FlxChatBox = new FlxChatBox(100, knight1, ["Who are you really? You say you are your 'self' but who is that?"]);
			add(knight1chat);
			
			var knight2:Knight = new Knight(1840, 336);
			add(knight2);
			var knight2chat:FlxChatBox = new FlxChatBox(100, knight2, ["Am I here because of you?"]);
			add(knight2chat);
			
			var knight3:Knight = new Knight(1858, 1072);
			add(knight3);
			var knight3chat:FlxChatBox = new FlxChatBox(100, knight3, ["First they ignore you, then they laugh at you, then they fight you, then you win."]);
			add(knight3chat);
			
			var knight4:Knight = new Knight(687, 1984);
			add(knight4);
			var knight4chat:FlxChatBox = new FlxChatBox(100, knight4, ["It is only dark because you do not know what light truly is."]);
			add(knight4chat);
			
			//PLAYERS
			Registry.player = new Player(30, 124);
			//Registry.player = new Player(700, 1982);
			add(Registry.player);
			
			//SUNGEM
			sunGemPiece = new SunGem(1785, 2215);
			sunGemPiece.frame = 13;
			add(sunGemPiece);
			if (Registry.eastGem) sunGemPiece.visible = false;
			else sunGemPiece.visible = true;
			
			//HEALTHBAR
			Registry.healthBar = new HealthBar();
			add(Registry.healthBar);
			
			//AltarChat
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
			
			//Managers
			Registry.effects = new EffectsManager();
			add(Registry.effects);
			
			Registry.map = level.mainLayer;
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_LOCKON);
			FlxG.camera.setBounds(16, 0, level.mainLayer.width-16, level.mainLayer.height);
			FlxG.worldBounds.make(0, 0, level.mainLayer.width, level.mainLayer.height);
		}
		
		override public function update():void
		{
			//SUPER
			if (!FlxG.paused) super.update();
			Registry.pauseGroup.update();
			
			if (Registry.player.x < 19) FlxG.switchState(new Altar);
			
			//MUSIC
			if (!play) { FlxG.playMusic(Sources.Mp3East); play = true;  }
			
			//SUNGEM PIECE
			if (!Registry.eastGem)
			{
				if (Registry.player.overlaps(sunGemPiece))
				{
					if (sunGemPiece.alive) Registry.SunGemPieces++;
					sunGemPiece.kill();
					Registry.eastGem = true;
					if (!altarChat.done) altarChat.chatting = true;
				}
			}
			if (altarChat.done) FlxG.fade(0xFF000000, 1, backtoAltar);
			
			//ENEMIES
			for (var k:int = 0; k < Registry.enemies.length; k++)
			{
				if (Registry.enemies.isEnemyHit(Registry.player, Registry.enemies.members[k])) Registry.enemies.hitEnemy(Registry.player, Registry.enemies.members[k]);
				if (Registry.enemies.isPlayerHit(Registry.player, Registry.enemies.members[k])) Registry.enemies.hitPlayer(Registry.player, Registry.enemies.members[k]);
			}
			
			//GAME OVER
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
					Registry.player = new Player(63, 124);
					add(Registry.player);
					FlxG.camera.follow(Registry.player, FlxCamera.STYLE_LOCKON);
				}
			}
			
			//OVERLAPS AND COLLIDES
			if (FlxG.overlap(Registry.player, columns)) FlxG.overlap(Registry.player, columns, climb);
			else Registry.player.climb = false;
			FlxG.collide(Registry.player, level.mainLayer);
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