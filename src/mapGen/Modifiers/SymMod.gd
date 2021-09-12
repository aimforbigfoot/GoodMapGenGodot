extends Node
class_name SymMod

static func foldMapInFourths(mapIn:Map) -> Map:
	var arrToModify : Array = []
	var tempMap := foldMapInHalfAlongMiddleXAxis( mapIn )
	arrToModify = foldMapInHalfAlongMiddleYAxis( tempMap ).getMap()
	return MapGenHelper.createAMapWithArrPassedIn( arrToModify )


static func foldMapInHalfAlongMiddleYAxis(mapIn:Map) -> Map:
	var arrToModify := mapIn.getMap()
	var middleIntOfMap :int= int(floor(MapGenHelper.xSizeOfMap/2))
	for y in MapGenHelper.ySizeOfMap:
		for x in middleIntOfMap:
			arrToModify[x][y] = arrToModify[x+middleIntOfMap][y]
	return MapGenHelper.createAMapWithArrPassedIn( arrToModify )


static func foldMapInHalfAlongMiddleXAxis(mapIn:Map) -> Map:
	var arrToModify := mapIn.getMap()
	var middleIntOfMap :int= int(floor(MapGenHelper.ySizeOfMap/2))
	for y in middleIntOfMap:
		for x in MapGenHelper.xSizeOfMap:
			arrToModify[x][y] = arrToModify[x][y+middleIntOfMap]
	return MapGenHelper.createAMapWithArrPassedIn( arrToModify )


static func foldMapInHalfLikeInk(mapIn:Map) -> Map:
	var arrToMod:=mapIn.getMap()
	return MapGenHelper.createAMapWithArrPassedIn( arrToMod )

