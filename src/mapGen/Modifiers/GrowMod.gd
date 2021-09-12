extends Node
class_name GrowMod 

static func growMap(mapIn:Map, tilesToGrow:int=MapGenHelper.TILES.FLOOR) -> Map:
	var arrToMod:Array= MapGenHelper.getASafeModableMap( mapIn ).getMap()
	
	var tempNum :int= MapGenHelper.TILES.TEMP
	
	for y in MapGenHelper.ySizeOfMap:
		for x in MapGenHelper.xSizeOfMap:
			var currTileNum : int = arrToMod[x][y]
			if (currTileNum == tilesToGrow):
				arrToMod[x-1][y-1]=tempNum
				arrToMod[x	][y-1]=tempNum
				arrToMod[x+1][y-1]=tempNum
#
				arrToMod[x-1][y  ]=tempNum

				arrToMod[x+1][y  ]=tempNum
#
				arrToMod[x-1][y+1]=tempNum
				arrToMod[x	][y+1]=tempNum
				arrToMod[x+1][y+1]=tempNum
		
	for y in MapGenHelper.ySizeOfMap:
		for x in MapGenHelper.xSizeOfMap:
			if arrToMod[x][y] == tempNum:
				arrToMod[x][y] = tilesToGrow
	
	
	return MapGenHelper.createAMapWithArrPassedIn( arrToMod )
	
	
	
