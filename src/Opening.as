package
{
	import managers.*;
	import org.flixel.*;
	
	public class Opening extends FlxState
	{
		private var level:BaseLevel;
		private var beam:FlxSound;
		private var gemSound:FlxSound;
		private var emitter:FlxEmitter;
		private var particle:FlxParticle;
		private var platform:FlxSprite;
		private var wizard:Wizard;
		private var wizardChat:FlxChatBox;
		private var sunGem:SunGem;
		private var timer:Number = 0;
		private var light:FlxSprite;
		
		public function Opening():void
		{
			
		}
		
		protected function onSpriteAddedCallback(sprite:FlxSprite, group:FlxGroup):void
		{
			if (sprite is Skeleton) Registry.enemies.add(sprite);
		}
		
		override public function create():void
		{
			FlxG.framerate = 60;
			FlxG.flashFramerate = 60;
			FlxG.bgColor = 0xFF2c376f;
			FlxG.flash(0xFF000000, 1);
			
			FlxG.playMusic(Sources.Mp3Theme, 0.65);
			FlxG.music.fadeIn(7);
			
			gemSound = new FlxSound();
			gemSound.loadEmbedded(Sources.Mp3Gem);
			gemSound.volume = 0.5;
			add(gemSound);
			
			beam = new FlxSound();
			beam.loadEmbedded(Sources.Mp3Beam);
			add(beam);
			
			emitter = new FlxEmitter(0,0, 130);
			emitter.width = 384;
			emitter.height = 80;
			emitter.setXSpeed(0, 0);
			emitter.setYSpeed(0, 0);
			emitter.start(true, 0, 0.05);
			add(emitter);
			for(var i:int = 0; i < emitter.maxSize; i++)
			{
				particle = new FlxParticle();
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
			
			level = new Level_Opening(true, onSpriteAddedCallback);
			
			wizard = new Wizard(2242, 157);
			add(wizard);
			
			sunGem = new SunGem(2155, 180);
			add(sunGem);
			
			Registry.player = new Player(112, 448);
			//Registry.player = new Player(1975, 160);
			add(Registry.player);
			
			light = new FlxSprite(2153, 200);
			light.makeGraphic(20, 400, 0xFFFFFFFF);
			light.alpha = 0.5;
			add(light);
			
			platform = new FlxSprite(2086, 176);
			platform.makeGraphic(140, 120, 0xFF111111);
			platform.immovable = true;
			add(platform);
			
			wizardChat = new FlxChatBox(40, wizard, [
			"........."]);
			add(wizardChat);
			
			Registry.effects = new EffectsManager();
			add(Registry.effects);
			
			Registry.healthBar = new HealthBar();
			add(Registry.healthBar);
			
			Registry.map = level.mainLayer;
			FlxG.camera.setBounds(16, 0, level.mainLayer.width-16, level.mainLayer.height);
			FlxG.worldBounds.make(0, 0, level.mainLayer.width, level.mainLayer.height);
		}
		
		override public function update():void
		{
			if (!FlxG.paused) super.update();
			Registry.pauseGroup.update();
			
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
					Registry.player = new Player(112, 448);
					add(Registry.player);
					FlxG.camera.follow(Registry.player, FlxCamera.STYLE_LOCKON);
				}
			}
			
			cutScene();
			FlxG.collide(Registry.player, level.mainLayer);
			FlxG.collide(Registry.enemies, level.mainLayer);
			FlxG.collide(Registry.player, platform);
			
			for (var i:int = 0; i < Registry.enemies.length; i++)
			{
				if (Registry.enemies.isEnemyHit(Registry.player, Registry.enemies.members[i])) Registry.enemies.hitEnemy(Registry.player, Registry.enemies.members[i]);
				if (Registry.enemies.isPlayerHit(Registry.player, Registry.enemies.members[i])) Registry.enemies.hitPlayer(Registry.player, Registry.enemies.members[i]);
			}
		}
		
		private function cutScene():void
		{
			if (Registry.player.x > 2158) 
			{
				FlxG.paused = false;
				FlxG.music.volume -= 0.005;
				Registry.player.freeze = true;
				if (!wizardChat.done) wizardChat.chatting = true;
				else 
				{
					timer += FlxG.elapsed;
					if (timer > 3)
					{
						var path1:FlxPath = new FlxPath([new FlxPoint(2173, 104)]);
						sunGem.followPath(path1, 25, FlxObject.PATH_VERTICAL_ONLY);
						if (sunGem.y > 105) gemSound.play();
						if (sunGem.y - sunGem.height/2 < (Registry.player.y - Registry.player.height/2)) FlxG.camera.follow(sunGem);
					}
					if (timer > 8)
					{
						FlxG.shake(0.005, 10);
						beam.play();
					}
					if (timer > 9 && timer < 9.5) sunGem.play("break");
					if (timer > 10)
					{
						var path2:FlxPath = new FlxPath([new FlxPoint(2173, 70)]);
						light.followPath(path2, 500, FlxObject.PATH_VERTICAL_ONLY);
					}
					if (timer > 13)
					{
						platform.y++;
					}
					if (timer > 14)
					{
						EndLevel();
					}
				}
			}
			else
			{
				FlxG.camera.follow(Registry.player, FlxCamera.STYLE_LOCKON);
			}
		}
		
		private function EndLevel():void
		{
			FlxG.fade(0xff000000, 3, end);
		}
		
		private function end():void
		{
			FlxG.switchState(new Altar);
		}
	}
}