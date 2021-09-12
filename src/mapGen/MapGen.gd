extends Node2D

var mainMap := Map.new()

func _ready() -> void:
	randomize()
#	mainMap = OSNoiseMod.getOSNoiseOnMap()
	mainMap = RandLineMut.getRandomLineOnMap()
	mainMap = GrowMod.growMap( mainMap )
	
	MapGenHelper.printMap( mainMap.getMap() )  
	
	

