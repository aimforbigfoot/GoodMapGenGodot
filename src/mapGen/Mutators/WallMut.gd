extends Node
class_name WallMut

const defaultThicknessOfWall :int= 1

static func getMapForWall(thicknessOfWall:int=defaultThicknessOfWall) -> Map:
	var wallArr : Array = MapGenHelper.getBlankMapArray( MapGenHelper.TILES.BLANK )
	
	for horizontalNum in MapGenHelper.ySizeOfMap:
		for thicknessVal in thicknessOfWall:
			wallArr[thicknessVal][horizontalNum] = MapGenHelper.TILES.WALL
#			arr			y			x
			wallArr[(MapGenHelper.xSizeOfMap-thicknessVal-1)][horizontalNum] = MapGenHelper.TILES.WALL
	
	for verticalNum in MapGenHelper.xSizeOfMap:
		for thicknessVal in thicknessOfWall:
			wallArr[verticalNum][thicknessVal] = MapGenHelper.TILES.WALL
			wallArr[verticalNum][(MapGenHelper.ySizeOfMap-thicknessVal-1)] = MapGenHelper.TILES.WALL
	
	return MapGenHelper.createAMapWithArrPassedIn( wallArr )
