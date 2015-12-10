package  
{
	import flash.geom.Point;
	import org.flixel.*;
	import managers.*;
	
	public class BossFight extends FlxState 
	{
		private var level:BaseLevel;
		private var play:Boolean;
		private var wizard:Wizard;
		private var wizardHealth:FlxSprite;
		private var wizardanimation:Boolean;
		
		private var energyBall:EnergyBall;
		private var energyPath:FlxPath;
		private var shoot:Boolean;
		private var anim:Boolean;
		private var hit:Boolean;
		private var point:FlxPoint
		private var hitCount:int = 0;
		private var missChance:Number = 0;
		
		private var cutscene:Boolean;
		private var timer:Number = 0;
		
		private var Spawn:Boolean;
		
		public function BossFight():void
		{
			Registry.enemies = new EnemyManager();
		}
		
		protected function onSpriteAddedCallback(sprite:FlxSprite, group:FlxGroup):void
		{
			
		}
		
		override public function create():void
		{
			FlxG.framerate = 60;
			FlxG.flashFramerate = 60;
			FlxG.bgColor = 0xFF2c376f;
			
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
			
			level = new Level_Boss(true, onSpriteAddedCallback);
			
			//ENERGY BALL
			energyBall = new EnergyBall(-50, 0);
			energyBall.scrollFactor.x = energyBall.scrollFactor.y = 0;
			add(energyBall);
			
			point = new FlxPoint();
			energyPath = new FlxPath();
			
			//WIZARD
			wizard = new Wizard(1693, 366);
			add(wizard);
			
			wizardHealth = new FlxSprite(5, FlxG.height - 20);
			wizardHealth.makeGraphic(FlxG.width - 10, 5, 0xFFd72b2b);
			wizardHealth.scrollFactor.x = wizardHealth.scrollFactor.y = 0;
			wizardHealth.setOriginToCorner();
			wizardHealth.visible = false;
			add(wizardHealth);
			
			add(Registry.enemies);
			
			//PLAYERS
			Registry.player = new Player(34, 470);
			//Registry.player = new Player(1500, 367);
			add(Registry.player);
			
			Registry.healthBar = new HealthBar();
			add(Registry.healthBar);
			
			//Managers
			Registry.effects = new EffectsManager();
			add(Registry.effects);
			
			missChance = FlxG.random();
			
			Registry.map = level.mainLayer;
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_LOCKON);
			FlxG.camera.setBounds(16, 0, level.mainLayer.width-32, level.mainLayer.height);
			FlxG.worldBounds.make(0, 0, level.mainLayer.width, level.mainLayer.height);
		}
		
		override public function update():void
		{
			//SUPER
			if (!FlxG.paused) super.update();
			Registry.pauseGroup.update();
			
			if (Registry.player.x > 1555) if (!play) { FlxG.playMusic(Sources.Mp3BossBattle, 0.55); play = true } 
			
			if (wizard.alive)
			{
				if (!cutscene)
				{
					if (Registry.player.x > 1555)
					{
						timer += FlxG.elapsed;
						Registry.player.freeze = true;
						if (timer > 1)
						{
							if (!wizardanimation) { wizard.play("about"); wizardanimation = true; }
							else 
							{
								if (wizard.finished) 
								{
									if (wizard.y > 319) wizard.y -= 0.5;
									else wizardHealth.visible = true;
									wizard.play("floating");
								}
							}
						}
						if (timer > 5)
						{
							Registry.player.freeze = false;
							timer = 0;
							cutscene = true;
						}
					}
				}
				else
				{
					if (Registry.player.x < 1745) wizard.x = Registry.player.x + 136;
					else wizard.x = 1880;
					
					if (!Spawn) 
					{
						energyBall.maxVelocity.x = energyBall.maxVelocity.y = 0;
						timer += FlxG.elapsed;
						
						if (timer > 1) spawnSkeletons();
					}
					else 
					{	
						if (Registry.enemies.count == 0)
						{
							timer += FlxG.elapsed;
							if (timer > 1) tennis();
						}
					}
					
					
				}
			}
			
			//WIZARD
			if (wizard.health > 0) { wizardHealth.scale.x = wizard.health / 100; }
			else 
			{
				wizardHealth.visible = false;
				Registry.player.freeze = true;
				FlxG.music.stop();
				if (wizard.y < 366) { wizard.y += 1; timer = 0 }
				else
				{
					timer += FlxG.elapsed;
					
					if (timer > 7) { FlxG.fade(0xff000000, 5, end); }
				}
			}
			
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
					FlxG.music.stop();
					FlxG.resetState();
				}
			}
			
			//COLLIDES
			FlxG.collide(Registry.player, level.mainLayer);
			FlxG.collide(Registry.enemies, level.mainLayer);
		}
		
		
		private function spawnSkeletons():void
		{
			timer = 0;
			for (var i:int = 0; i < 6; i++)
			{
				Registry.enemies.add(new Skeleton(1265 + (i * 100), 210));
				Registry.enemies.count++;
			}
			Spawn = true;
		}
		
		private function tennis():void
		{
			if (!shoot)
			{
				energyBall.pathSpeed = 110;
				energyBall.visible = true;
				wizard.getScreenXY(point);
				energyBall.x = point.x;
				energyBall.y = point.y-10;
				
				if (!anim) 
				{
					energyBall.play("ChargingUp");
					FlxG.play(Sources.Mp3EnergyBallCharge, 0.7);
					anim = true; 
				}
				else 
				{
					if (energyBall.finished) shoot = true;
				}
			}
			else 
			{
				energyBall.play("Big");
				energyBall.maxVelocity.x = energyBall.maxVelocity.y = 400;
				
				if (!hit)
				{
					if (energyBall.overlaps(Registry.player, true)) 
					{
						Registry.player.hurt(30);
						FlxG.play(Sources.Mp3Hurt);
						stopTennis();
					}
					
					var playerPoint:FlxPoint = new FlxPoint();
					Registry.player.getScreenXY(playerPoint);
					energyPath.addPoint(playerPoint);
					
					if (Registry.player.attack)
					{
						if (Registry.player.facing == FlxObject.RIGHT)
						if (energyBall.overlapsPoint(new FlxPoint(Registry.player.x + Registry.player.width + 8, Registry.player.y + Registry.player.height / 2), true)
						|| energyBall.overlapsPoint(new FlxPoint(Registry.player.x + Registry.player.width, Registry.player.y + Registry.player.height / 2), true)
						|| energyBall.overlapsPoint(new FlxPoint(Registry.player.x + Registry.player.width + 9, Registry.player.y - Registry.player.height / 2), true)
						|| energyBall.overlapsPoint(new FlxPoint(Registry.player.x + Registry.player.width + 6, Registry.player.y - Registry.player.height / 2), true)
						|| energyBall.overlapsPoint(new FlxPoint(Registry.player.x + Registry.player.width + 6, Registry.player.y - Registry.player.height / 2 + 4), true)
						|| energyBall.overlapsPoint(new FlxPoint(Registry.player.x + Registry.player.width + 4, Registry.player.y - Registry.player.height / 2 + 4), true)
						|| energyBall.overlapsPoint(new FlxPoint(Registry.player.x + Registry.player.width + 2, Registry.player.y - Registry.player.height / 2 + 4), true)
						|| energyBall.overlapsPoint(new FlxPoint(Registry.player.x + Registry.player.width, Registry.player.y - Registry.player.height/2 + 4), true))
						if (Registry.player.frame == 9 || Registry.player.frame == 10)
						{
							energyBall.pathSpeed += 20;
							hit = true;
							FlxG.play(Sources.Mp3EnergyBallHit, 0.7);
						}
					}
				}
				else
				{
					var wizardPoint:FlxPoint = new FlxPoint();
					wizard.getScreenXY(wizardPoint);
					energyPath.addPoint(new FlxPoint(point.x+4, point.y));
					
					if (energyBall.overlaps(wizard, true)) 
					{
						if (hitCount > 5)
						{
							if (missChance < 0.4)
							{
								wizard.hurt(25);
								stopTennis();
								FlxG.play(Sources.Mp3WizardHurt, 0.8);
							}
							else
							{
								FlxG.globalSeed = FlxG.random();
								missChance = FlxG.random();
								hit = false;
								FlxG.play(Sources.Mp3EnergyBallHit, 0.7);
							}
						}
						else 
						{
							energyBall.pathSpeed += 20;
							hitCount++;
							hit = false;
							FlxG.play(Sources.Mp3EnergyBallHit, 0.7);
						}
					}
				}
				
				energyPath.nodes.reverse();
				energyBall.followPath(energyPath, energyBall.pathSpeed);
			}
			
		}
		
		private function stopTennis():void
		{
			FlxG.shake(0.005, 1);
			var emitter:FlxEmitter = new FlxEmitter(energyBall.x, energyBall.y, 60);
			emitter.width = 5;
			emitter.height = 5;
			emitter.setXSpeed(-40, 40);
			emitter.setYSpeed(-20, 20);
			emitter.start(true, 2, 0.05);
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
				particle.makeGraphic(1, 1, 0xFFFFFFFF);
				particle.alpha = 0.35;
				particle.exists = false;
				emitter.add(particle);
			}
			energyBall.visible = false;
			timer = 0;
			hitCount = 0;
			missChance = FlxG.random();
			anim = false;
			shoot = false;
			hit = false;
			Spawn = false;
			energyBall.stopFollowingPath();
		}
		
		private function end():void
		{
			FlxG.switchState(new Win);
		}
	}

}