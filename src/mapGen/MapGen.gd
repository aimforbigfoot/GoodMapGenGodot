extends Node2D

var mainMap := Map.new()

func _ready() -> void:
	randomize()
	mainMap = WalkerMut.getWalkedOnMap()
	
	MapGenHelper.printMap( mainMap.getMap() )  
	
	

