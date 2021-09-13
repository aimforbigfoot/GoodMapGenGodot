extends Node
class_name MapGenHelper

const xSizeOfMap := 21
const ySizeOfMap := 47
enum TILES {
	TEMP=-3 
	DEBUG=-2,
	BLANK=-1,
	FLOOR=0,
	WALL=1
}
enum OPERATIONS {
	MAX,
	MIN
}

static func getASafeModableMap(mapIn:Map, sizeOfRing:int=2) -> Map:
	var arr := mapIn.getMap()
	
	for y in ySizeOfMap:
		for i in sizeOfRing:
			arr[i][y] = TILES.DEBUG
			arr[xSizeOfMap-1-i][y] = TILES.DEBUG
	
	for x in xSizeOfMap:
		for i in sizeOfRing:
			arr[x][i] = TILES.DEBUG
			arr[x][ySizeOfMap-1-i] = TILES.DEBUG
	
	
	
	return createAMapWithArrPassedIn(arr)
	



# DON'T TOUCH
static func combineMaps(map1:Map, map2:Map, operation:int) -> Map:
	var arr1:Array= map1.getMap()
	var arr2:Array= map2.getMap()
	var resultArr : Array = getBlankMapArray( TILES.BLANK )
	
	for y in ySizeOfMap:
		for x in xSizeOfMap:
			resultArr[x][y] = getNumBasedOnOperation( arr1[x][y], arr2[x][y], operation )
		
	return createAMapWithArrPassedIn( resultArr )
static func printMap( arr:Array ) -> void:
	for row in arr:
		var rowToPrint :String=""
		for num in row:
			var stringToPrint :String= str(num)
			if sign(num) != -1:
				stringToPrint += str(num)
			rowToPrint+=stringToPrint+" "
		print(rowToPrint,"\n")
static func getBlankMapArray( typeToPlaceEverywhere:int ) -> Array:
	var arr : Array
	for y in xSizeOfMap:
		arr.append([])
		for x in ySizeOfMap:
			arr[y].append(typeToPlaceEverywhere)
	return arr
static func createAMapWithArrPassedIn( arr:Array ) -> Map:
	var m := Map.new()
	m.setMap( arr )
	return m
static func getNumBasedOnOperation(num1:int, num2:int,operation:int) -> int:
	var numToReturn : int = 0
	match operation:
		OPERATIONS.MAX:
			numToReturn = max( num1 , num2 )
		OPERATIONS.MIN:
			numToReturn = min( num1 , num2 )
		_:
			numToReturn = TILES.FLOOR
	return numToReturn

static func getRandXValFromXSize() -> int:return getRandValFrom2Nums( 0,xSizeOfMap )
static func getRandYValFromYSize() -> int:return getRandValFrom2Nums(0,ySizeOfMap)
static func getRandPosOnMap() -> Vector2:
	return Vector2( getRandYValFromYSize(),getRandXValFromXSize() )
static func getRandValFrom2Nums(num1:int,num2:int) -> int:
	return int( floor( rand_range( num1,num2 )  ) )


