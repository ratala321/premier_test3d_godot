class_name InventaireJoueur extends abstractInventaire 

func _ready():
	listeInventaire.connect("item_clicked", selectionnerObjet)
	#chargerContenuInventaire()
	set_process_mode(PROCESS_MODE_WHEN_PAUSED)



func selectionnerObjet(indexObjet, positionClic, indexBouttonSouris) -> void:
	if inventaireDestination != null and inventaireDestination.visible:
		transfererInventaire(indexObjet)
	else:
		var metadata = listeInventaire.get_item_metadata(indexObjet)
		if metadata != null and metadata.has_method("effectuerProcedureSelection"):
			metadata.effectuerProcedureSelection()


##Permet d'evaluer si les conditions sont remplies pour qu'un objet soit
##transfere vers un inventaire de destination.
#func evaluerDisponibiliteTransfertObjet() -> bool:
	#var disponible : bool = inventaireDestination != null and inventaireDestination.visible
	#disponible = disponible and get_itemm_metadata(indexObjet).getStatusInstance()
	#return disponible


##Permet d'evaluer si l'objet peut etre transfere de l'inventaire
##au joueur, autrement dit si le joueur peut equiper l'objet.
#func evaluerDisponibiliteEquiperObjet() -> bool:
	#return conditionDuJoueur and ConditionObjet
