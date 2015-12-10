//Code generated with DAME. http://www.dambots.com

package 
{
	import org.flixel.*;
	public class Level_Opening extends BaseLevel
	{
		//Embedded media...
		[Embed(source="org/flixel/data/private/maps/opening/mapCSV_Group1_moon.csv", mimeType="application/octet-stream")] public var CSV_Group1moon:Class;
		[Embed(source="org/flixel/data/private/graphics/mountain.png")] public var Img_Group1moon:Class;
		[Embed(source="org/flixel/data/private/maps/opening/mapCSV_Group1_mountains.csv", mimeType="application/octet-stream")] public var CSV_Group1mountains:Class;
		[Embed(source="org/flixel/data/private/graphics/mountain.png")] public var Img_Group1mountains:Class;
		[Embed(source="org/flixel/data/private/maps/opening/mapCSV_Group1_ground.csv", mimeType="application/octet-stream")] public var CSV_Group1ground:Class;
		[Embed(source="org/flixel/data/private/graphics/tile.png")] public var Img_Group1ground:Class;
		[Embed(source="org/flixel/data/private/maps/opening/mapCSV_Group1_grass.csv", mimeType="application/octet-stream")] public var CSV_Group1grass:Class;
		[Embed(source="org/flixel/data/private/graphics/grass.png")] public var Img_Group1grass:Class;

		//Tilemaps
		public var layerGroup1moon:FlxTilemap;
		public var layerGroup1mountains:FlxTilemap;
		public var layerGroup1ground:FlxTilemap;
		public var layerGroup1grass:FlxTilemap;

		//Sprites
		public var Group1spritesGroup:FlxGroup = new FlxGroup;


		public function Level_Opening(addToStage:Boolean = true, onAddSpritesCallback:Function = null)
		{
			// Generate maps.
			layerGroup1moon = new FlxTilemap;
			layerGroup1moon.loadMap( new CSV_Group1moon, Img_Group1moon, 80,50, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1moon.x = 0.000000;
			layerGroup1moon.y = 0.000000;
			layerGroup1moon.scrollFactor.x = 0.000000;
			layerGroup1moon.scrollFactor.y = 0.000000;
			layerGroup1mountains = new FlxTilemap;
			layerGroup1mountains.loadMap( new CSV_Group1mountains, Img_Group1mountains, 80,50, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1mountains.x = 0.000000;
			layerGroup1mountains.y = 20.000000;
			layerGroup1mountains.scrollFactor.x = 0.050000;
			layerGroup1mountains.scrollFactor.y = 0.010000;
			layerGroup1ground = new FlxTilemap;
			layerGroup1ground.loadMap( new CSV_Group1ground, Img_Group1ground, 16,16, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1ground.x = 0.000000;
			layerGroup1ground.y = 0.000000;
			layerGroup1ground.scrollFactor.x = 1.000000;
			layerGroup1ground.scrollFactor.y = 1.000000;
			layerGroup1grass = new FlxTilemap;
			layerGroup1grass.loadMap( new CSV_Group1grass, Img_Group1grass, 16,16, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1grass.x = 0.000000;
			layerGroup1grass.y = 0.000000;
			layerGroup1grass.scrollFactor.x = 1.000000;
			layerGroup1grass.scrollFactor.y = 1.000000;

			//Add layers to the master group in correct order.
			masterLayer.add(layerGroup1moon);
			masterLayer.add(layerGroup1mountains);
			masterLayer.add(layerGroup1ground);
			masterLayer.add(layerGroup1grass);
			masterLayer.add(Group1spritesGroup);


			if ( addToStage )
			{
				addSpritesForLayerGroup1sprites(onAddSpritesCallback);
				FlxG.state.add(masterLayer);
			}

			mainLayer = layerGroup1ground;

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 2400;
			boundsMaxY = 800;

		}

		override public function addSpritesForLayerGroup1sprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(Tree, Group1spritesGroup , -32.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 26.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , -16.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , -23.000, 385.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , -27.000, 383.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , -2.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 11.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , -8.000, 385.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 110.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 227.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 321.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 444.000, 352.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 545.000, 320.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 275.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 153.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 672.000, 368.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 845.000, 608.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 888.000, 608.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 961.000, 608.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1050.000, 608.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1112.000, 608.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1193.000, 608.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1279.000, 608.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1370.000, 608.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1411.000, 608.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1519.000, 576.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1664.000, 432.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1938.000, 96.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1039.000, 665.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1132.000, 665.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1267.000, 664.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1278.000, 664.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1509.000, 663.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
		}


	}
}
