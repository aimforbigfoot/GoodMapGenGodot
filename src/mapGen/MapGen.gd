extends Node2D

var mainMap := Map.new()

func _ready() -> void:
	randomize()
	mainMap = OSNoiseMod.getOSNoiseOnMap()
#	mainMap = RandLineMut.getRandomLineOnMap()
	mainMap = SymMod.foldMapInHalfAlongMiddleXAxis( mainMap )
	mainMap = SymMod.foldMapInHalfAlongMiddleYAxis( mainMap )
	
	
	MapGenHelper.printMap( mainMap.getMap()  )  
	

