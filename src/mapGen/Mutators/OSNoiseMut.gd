class_name OSNoiseMod

static func getOSNoiseOnMap(   ) -> Map:
	var arrOfOSN := MapGenHelper.getBlankMapArray( MapGenHelper.TILES.BLANK )
	
	var osn := OpenSimplexNoise.new()
	osn.seed = randi()
	osn.octaves = 4
	osn.period = 20.0
	osn.persistence = 0.8
	
	for y in MapGenHelper.ySizeOfMap:
		for x in MapGenHelper.xSizeOfMap:
			var tileType := min( floor(abs(osn.get_noise_2d( x,y ))*10), 1 )
			arrOfOSN[x][y] = tileType 
	
	
	return MapGenHelper.createAMapWithArrPassedIn(arrOfOSN)
