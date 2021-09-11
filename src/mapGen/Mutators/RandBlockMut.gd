extends Node
class_name RandBlockMut

const defaultPercentChanceToFill := 0.5

static func getRandBlockMap(percentChanceToBeFilled:float=defaultPercentChanceToFill) -> Map:
	var randMap := MapGenHelper.getBlankMap( MapGenHelper.TILES.BLANK)
	
	for y in MapGenHelper.ySizeOfMap:
		for x in MapGenHelper.xSizeOfMap:
			if randf() < percentChanceToBeFilled:
				randMap[x][y] = MapGenHelper.TILES.WALL
	
	return MapGenHelper.createAMapWithArrPassedIn( randMap )
