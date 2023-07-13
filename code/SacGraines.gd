extends RigidBody3D

const espacePlanteGroupe : String = "EspacePlante"

#load ajouté pour des tests temporaires
var graineContenue : PackedScene = load("res://scenes/plantesScenes/BleScene.tscn")
var aireDetectionSolFertile : Area3D

func _ready():
	aireDetectionSolFertile = $AireDetectionEspacePlante
	$IntervalleDetectionEspacesPlantes.connect("timeout", _detecterEspacePlante)


func _detecterEspacePlante():
	var airesEnCollision = aireDetectionSolFertile.get_overlapping_areas()
	
	var i : int = 0
	var espaceNEstPasDetecte = true
	while _detectionEstIncomplete(i, airesEnCollision.size(), espaceNEstPasDetecte):
		if(_estEspaceFertile(airesEnCollision[i])):
			espaceNEstPasDetecte = false
			print("espace fertile detecte par le sac")
			#EspacePlante.gd
			airesEnCollision[i].previsualiserPlante(graineContenue)
		i += 1


func _detectionEstIncomplete(compteurBoucle : int,
 nombreAiresEnCollision : int, nEstPasDetecte : bool) -> bool:
	return compteurBoucle < nombreAiresEnCollision and nEstPasDetecte


func _estEspaceFertile(aireEnCollision) -> bool:
	return aireEnCollision.is_in_group(espacePlanteGroupe)