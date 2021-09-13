extends Node
class_name WalkerMut

static func getWalkedOnMap(iterations:int=100, tileToPlace:int=MapGenHelper.TILES.FLOOR) -> Map:
	var walkerArr :Array= MapGenHelper.getBlankMapArray( MapGenHelper.TILES.BLANK )
	var middleX := int(floor(MapGenHelper.xSizeOfMap/2))
	var middleY := int(floor(MapGenHelper.ySizeOfMap/2))
	
	print(middleX,",",MapGenHelper.xSizeOfMap )
	
	var x := middleX
	var y := middleY
	walkerArr[x][y] = tileToPlace
	
	for i in iterations:
		if not(x > MapGenHelper.xSizeOfMap-1 or y > MapGenHelper.ySizeOfMap-1):
			walkerArr[x][y] = tileToPlace
		x = potentiallyVaryValBy1(x)
		y = potentiallyVaryValBy1(y)
	
	return MapGenHelper.createAMapWithArrPassedIn( walkerArr )


static func potentiallyVaryValBy1(val:int) -> int:
	var rand :int= 0
	var r := randf()
	if r < 0.33:
		rand = 1
	elif r < 0.66:
		rand = -1
	return val + rand


# make a function that will attempt to push the walker towards the center if 1/5 to the edges
