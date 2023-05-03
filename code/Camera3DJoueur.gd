extends Camera3D

##contient la reference au node du joueur
@onready var joueurCanard = get_node("../JoueurCanard")

func _ready():
	#connexion au signal rotation_joueur_
	joueurCanard.rotation_joueur_.connect(ajusterPositionCamera_rotation_joueur)

##permet d'ajuster la position de la camera par rapport a la position du joueur
##notes : cette fonction est appelee le signal [b]rotation_joueur_[/b]
func ajusterPositionCamera_rotation_joueur(directionJoueur : Vector3) -> void:
	position = joueurCanard.position - Vector3(0,-3,5)
	
