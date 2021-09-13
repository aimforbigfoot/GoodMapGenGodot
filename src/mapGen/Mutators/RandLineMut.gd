extends Node
class_name RandLineMut

const drunkPercent := 0.9
const iterations :int= 256
const rateToDecraseRandom :float=0.01

static func getRandomLineOnMap(tileToPlace:int=MapGenHelper.TILES.FLOOR  ,  percentChanceToMoveRandomly:float=drunkPercent) -> Map:
	var percentChanceToMoveRandomlyModded := percentChanceToMoveRandomly
	var lineArr :Array= MapGenHelper.getBlankMapArray(MapGenHelper.TILES.BLANK)
	
	var startPos := MapGenHelper.getRandPosOnMap()
	var cursor := startPos
	var endPos := MapGenHelper.getRandPosOnMap()
	
	lineArr[startPos.y][startPos.x] = tileToPlace
	lineArr[endPos.y][endPos.x] = tileToPlace
	
	for i in iterations:
		if randf() > percentChanceToMoveRandomlyModded:
			cursor = moveTowardsVec1TowardsVec2(cursor, endPos)
		else:
			cursor = moveVecRandomly(cursor)
			percentChanceToMoveRandomlyModded -= rateToDecraseRandom
		if (cursor.y < lineArr.size() and cursor.y > 0):
			if ( cursor.x < lineArr[cursor.y].size() and cursor.x > 0 ):
				lineArr[cursor.y][cursor.x] = tileToPlace
		if cursor == endPos:
			break
	
	return MapGenHelper.createAMapWithArrPassedIn( lineArr )

static func moveTowardsVec1TowardsVec2(vec1:Vector2, vec2:Vector2) -> Vector2:
	var vecToReturn : Vector2 = Vector2.ZERO
	if vec1.x != vec2.x:
		vecToReturn.y = vec1.y
		if vec1.x < vec2.x:
			vecToReturn.x = vec1.x + 1
		else:
			vecToReturn.x = vec1.x - 1
	elif vec1.y != vec2.y:
		vecToReturn.x = vec1.x
		if vec1.y < vec2.y:
			vecToReturn.y = vec1.y + 1
		else:
			vecToReturn.y = vec1.y - 1
	else:
		vecToReturn = vec1
	
	return vecToReturn
static func moveVecRandomly(vec1:Vector2) -> Vector2:
	var vecToReturn := vec1
	var r := randf()
	if r < 0.25:
		vecToReturn.x += 1
	elif r < 0.50:
		vecToReturn.x -= 1
	elif r < 0.75:
		vecToReturn.y += 1
	else:
		vecToReturn.y -= 1
	return vecToReturn
