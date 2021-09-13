extends Node
class_name NthMut

static func getMapWithNthTilePlacedIn( tileIn:int=MapGenHelper.TILES.WALL, everyWhat:int=10   ) -> Map:
	var arrOfTiles := MapGenHelper.getBlankMapArray( MapGenHelper.TILES.BLANK )
	var ind := 0
	for x in MapGenHelper.xSizeOfMap:
		for y in MapGenHelper.ySizeOfMap:
			if ind % everyWhat == 0:
				arrOfTiles[x][y] = tileIn
			ind += 1
	
	return MapGenHelper.createAMapWithArrPassedIn(arrOfTiles)

