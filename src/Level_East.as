//Code generated with DAME. http://www.dambots.com

package 
{
	import org.flixel.*;
	public class Level_East extends BaseLevel
	{
		//Embedded media...
		[Embed(source="org/flixel/data/private/maps/east/mapCSV_Group1_moon.csv", mimeType="application/octet-stream")] public var CSV_Group1moon:Class;
		[Embed(source="org/flixel/data/private/graphics/mountain.png")] public var Img_Group1moon:Class;
		[Embed(source="org/flixel/data/private/maps/east/mapCSV_Group1_mountains.csv", mimeType="application/octet-stream")] public var CSV_Group1mountains:Class;
		[Embed(source="org/flixel/data/private/graphics/mountain.png")] public var Img_Group1mountains:Class;
		[Embed(source="org/flixel/data/private/maps/east/mapCSV_Group1_ground.csv", mimeType="application/octet-stream")] public var CSV_Group1ground:Class;
		[Embed(source="org/flixel/data/private/graphics/tile.png")] public var Img_Group1ground:Class;
		[Embed(source="org/flixel/data/private/maps/east/mapCSV_Group1_grass.csv", mimeType="application/octet-stream")] public var CSV_Group1grass:Class;
		[Embed(source="org/flixel/data/private/graphics/grass.png")] public var Img_Group1grass:Class;

		//Tilemaps
		public var layerGroup1moon:FlxTilemap;
		public var layerGroup1mountains:FlxTilemap;
		public var layerGroup1ground:FlxTilemap;
		public var layerGroup1grass:FlxTilemap;

		//Sprites
		public var Group1spritesGroup:FlxGroup = new FlxGroup;


		public function Level_East(addToStage:Boolean = true, onAddSpritesCallback:Function = null)
		{
			// Generate maps.
			layerGroup1moon = new FlxTilemap;
			layerGroup1moon.loadMap( new CSV_Group1moon, Img_Group1moon, 80,50, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1moon.x = -20.000000;
			layerGroup1moon.y = -45.000000;
			layerGroup1moon.scrollFactor.x = 0.000000;
			layerGroup1moon.scrollFactor.y = 0.000000;
			layerGroup1mountains = new FlxTilemap;
			layerGroup1mountains.loadMap( new CSV_Group1mountains, Img_Group1mountains, 80,50, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1mountains.x = 0.000000;
			layerGroup1mountains.y = -35.000000;
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

			boundsMinX = -20;
			boundsMinY = -45;
			boundsMaxX = 3200;
			boundsMaxY = 2400;

		}

		override public function addSpritesForLayerGroup1sprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(Column, Group1spritesGroup , 1115.000, 296.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1521.000, 424.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 603.000, 768.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 826.000, 768.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 714.000, 896.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 626.000, 520.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1968.000, 520.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 2103.000, 312.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 251.000, 808.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 515.000, 1304.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1610.000, 760.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1801.000, 888.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1603.000, 1000.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Tree, Group1spritesGroup , 46.000, 64.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 116.000, 64.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 171.000, 64.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 225.000, 64.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 280.000, 64.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 365.000, 65.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 545.000, 96.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 713.000, 128.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 856.000, 144.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Tree, Group1spritesGroup , 1172.000, 144.000, 0.000, false, 1, 1, onAddCallback );//"Tree"
			addSpriteToLayer(Column, Group1spritesGroup , 2971.000, 408.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1523.000, 856.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 2251.000, 680.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 2316.000, 856.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 2390.000, 1016.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1706.000, 1160.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1802.000, 1320.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1995.000, 1016.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1899.000, 1192.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1594.000, 1272.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1691.000, 1448.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1484.000, 1400.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 325.000, 1416.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 392.000, 1576.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1339.000, 1336.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1730.000, 696.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1899.000, 1480.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 2011.000, 1368.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 3051.000, 1464.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1242.000, 1576.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 2972.000, 1624.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 2567.000, 1704.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 3003.000, 1992.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1498.000, 1736.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1593.000, 1576.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 2180.000, 1656.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 2106.000, 1497.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1742.000, 1768.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1819.000, 1592.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1715.000, 2056.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 1857.000, 2056.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 715.000, 648.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 402.000, 1128.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 878.000, 1238.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 951.000, 1208.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 797.000, 1209.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1136.000, 1095.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1263.000, 999.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1709.000, 472.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2214.000, 402.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1968.000, 343.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2402.000, 355.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2578.000, 327.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2797.000, 454.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2708.000, 498.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2850.000, 786.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2677.000, 878.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2513.000, 690.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2356.000, 721.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2226.000, 1234.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2353.000, 1190.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2498.000, 1206.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2674.000, 1202.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2927.000, 1791.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2808.000, 1750.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2489.000, 1873.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2203.000, 1831.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1812.000, 1939.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1768.000, 1940.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1633.000, 1919.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1548.000, 1919.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1344.000, 1864.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1016.000, 1927.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2846.000, 1968.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1050.000, 1630.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 819.000, 1709.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 695.000, 1745.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 521.000, 1791.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 163.000, 1079.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 322.000, 789.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 595.000, 693.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1014.000, 786.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1258.000, 767.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 284.000, 1723.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 700.000, 549.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 861.000, 1708.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1324.000, 1013.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 819.000, 694.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 729.000, 809.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1541.000, 596.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2250.000, 402.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2593.000, 423.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2523.000, 1204.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2993.000, 1795.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2696.000, 1798.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2376.000, 1859.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1234.000, 1877.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1164.000, 1890.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2640.000, 1887.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1562.000, 1444.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1818.000, 1495.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1648.000, 1618.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 1313.000, 1511.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
			addSpriteToLayer(Skeleton, Group1spritesGroup , 2063.000, 1667.000, 0.000, false, 1, 1, onAddCallback );//"Skeleton"
		}


	}
}
