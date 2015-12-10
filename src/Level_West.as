//Code generated with DAME. http://www.dambots.com

package 
{
	import org.flixel.*;
	public class Level_West extends BaseLevel
	{
		//Embedded media...
		[Embed(source="org/flixel/data/private/maps/west/mapCSV_Group1_moon.csv", mimeType="application/octet-stream")] public var CSV_Group1moon:Class;
		[Embed(source="org/flixel/data/private/graphics/mountain.png")] public var Img_Group1moon:Class;
		[Embed(source="org/flixel/data/private/maps/west/mapCSV_Group1_mountain.csv", mimeType="application/octet-stream")] public var CSV_Group1mountain:Class;
		[Embed(source="org/flixel/data/private/graphics/mountain.png")] public var Img_Group1mountain:Class;
		[Embed(source="org/flixel/data/private/maps/west/mapCSV_Group1_ground.csv", mimeType="application/octet-stream")] public var CSV_Group1ground:Class;
		[Embed(source="org/flixel/data/private/graphics/tile.png")] public var Img_Group1ground:Class;
		[Embed(source="org/flixel/data/private/maps/west/mapCSV_Group1_grass.csv", mimeType="application/octet-stream")] public var CSV_Group1grass:Class;
		[Embed(source="org/flixel/data/private/graphics/grass.png")] public var Img_Group1grass:Class;

		//Tilemaps
		public var layerGroup1moon:FlxTilemap;
		public var layerGroup1mountain:FlxTilemap;
		public var layerGroup1ground:FlxTilemap;
		public var layerGroup1grass:FlxTilemap;

		//Sprites
		public var Group1spritesGroup:FlxGroup = new FlxGroup;


		public function Level_West(addToStage:Boolean = true, onAddSpritesCallback:Function = null)
		{
			// Generate maps.
			layerGroup1moon = new FlxTilemap;
			layerGroup1moon.loadMap( new CSV_Group1moon, Img_Group1moon, 80,50, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1moon.x = 0.000000;
			layerGroup1moon.y = 0.000000;
			layerGroup1moon.scrollFactor.x = 0.000000;
			layerGroup1moon.scrollFactor.y = 0.000000;
			layerGroup1mountain = new FlxTilemap;
			layerGroup1mountain.loadMap( new CSV_Group1mountain, Img_Group1mountain, 80,50, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1mountain.x = 0.000000;
			layerGroup1mountain.y = -35.000000;
			layerGroup1mountain.scrollFactor.x = 0.050000;
			layerGroup1mountain.scrollFactor.y = 0.010000;
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
			masterLayer.add(layerGroup1mountain);
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
			boundsMinY = -35;
			boundsMaxX = 3200;
			boundsMaxY = 1776;

		}

		override public function addSpritesForLayerGroup1sprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(Column, Group1spritesGroup , 2274.000, 1352.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Tree, Group1spritesGroup , 2853.000, 1600.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2996.000, 1600.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2633.000, 1536.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2470.000, 1504.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2145.000, 1472.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2357.000, 1504.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2367.000, 1248.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Column, Group1spritesGroup , 3043.000, 1064.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Tree, Group1spritesGroup , 2662.000, 1168.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2473.000, 1560.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2723.000, 1226.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2838.000, 1255.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2952.000, 1175.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2421.000, 1560.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 3116.000, 1160.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2575.000, 1287.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Column, Group1spritesGroup , 2967.000, 1480.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Tree, Group1spritesGroup , 2492.000, 1232.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Column, Group1spritesGroup , 1976.000, 808.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 2606.000, 456.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Tree, Group1spritesGroup , 2117.000, 1008.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2262.000, 976.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2477.000, 912.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2850.000, 944.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2701.000, 864.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2287.000, 656.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2140.000, 672.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Column, Group1spritesGroup , 1832.000, 312.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1368.000, 313.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Tree, Group1spritesGroup , 985.000, 432.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1275.000, 432.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2470.000, 384.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2346.000, 400.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 2241.000, 416.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1906.000, 416.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1544.000, 272.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1714.000, 240.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1448.000, 240.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Column, Group1spritesGroup , 1227.000, 489.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2756.000, 921.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2530.000, 968.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2493.000, 968.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2600.000, 951.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2431.000, 934.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2272.000, 1031.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2702.000, 921.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2109.000, 1061.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2214.000, 728.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2480.000, 662.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2295.000, 469.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2255.000, 468.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1911.000, 471.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1596.000, 326.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1650.000, 310.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1510.000, 296.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1561.000, 325.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1001.000, 488.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Platform, Group1spritesGroup , 1942.000, 1359.000, 0.000, false, 1, 1, onAddCallback );//"Platform"
			addSpriteToLayer(Rope, Group1spritesGroup , 2004.000, 1310.000, 0.000, false, 1, 1, onAddCallback );//"Rope"
			addSpriteToLayer(Platform, Group1spritesGroup , 1775.000, 1008.000, 0.000, false, 1, 1, onAddCallback );//"Platform"
			addSpriteToLayer(Rope, Group1spritesGroup , 1837.000, 960.000, 0.000, false, 1, 1, onAddCallback );//"Rope"
			addSpriteToLayer(Platform, Group1spritesGroup , 1608.000, 511.000, 0.000, false, 1, 1, onAddCallback );//"Platform"
			addSpriteToLayer(Platform, Group1spritesGroup , 1444.000, 511.000, 0.000, false, 1, 1, onAddCallback );//"Platform"
			addSpriteToLayer(Rope, Group1spritesGroup , 1670.000, 464.000, 0.000, false, 1, 1, onAddCallback );//"Rope"
			addSpriteToLayer(Rope, Group1spritesGroup , 1509.000, 461.000, 0.000, false, 1, 1, onAddCallback );//"Rope"
			addSpriteToLayer(Platform, Group1spritesGroup , 1271.000, 703.000, 0.000, false, 1, 1, onAddCallback );//"Platform"
			addSpriteToLayer(Rope, Group1spritesGroup , 1329.000, 654.000, 0.000, false, 1, 1, onAddCallback );//"Rope"
			addSpriteToLayer(Platform, Group1spritesGroup , 1095.000, 848.000, 0.000, false, 1, 1, onAddCallback );//"Platform"
			addSpriteToLayer(Rope, Group1spritesGroup , 1154.000, 800.000, 0.000, false, 1, 1, onAddCallback );//"Rope"
			addSpriteToLayer(Column, Group1spritesGroup , 68.000, 1480.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 254.000, 1480.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Tree, Group1spritesGroup , 874.000, 1472.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 966.000, 1472.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 769.000, 1472.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 710.000, 1504.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 624.000, 1504.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 526.000, 1504.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 449.000, 1537.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 352.000, 1536.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 821.000, 1472.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 574.000, 1504.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 670.000, 1504.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 921.000, 1472.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 400.000, 1536.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Column, Group1spritesGroup , 1585.000, 464.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 887.000, 520.000, 0.000, false, 1, 1, onAddCallback );//"Column"
		}


	}
}
