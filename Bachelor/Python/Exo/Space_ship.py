class Vaisseau:
    def __init__(self, nom: str, couleur: str, vitesse_nominale: int, duree_acceleration: int):
        self.nom = nom
        self.couleur = couleur
        self.vitesse_nominale = vitesse_nominale
        self.duree_acceleration = duree_acceleration
        self.position = 0
 
class Circuit:
    def __init__(self, distance: int, nombre_tours: int):
        self.distance = distance
        self.nombre_tours = nombre_tours
 
def calculer_distances(vaisseaux, temps) -> dict:
 
    tmp_positions = {}
    for vaisseau in vaisseaux:
        position = vaisseau.position + vaisseau.vitesse_nominale * temps
        tmp_positions[vaisseau.nom] = position
 
    return dict(sorted(tmp_positions.items(), key=lambda x: x[1], reverse=True))
    
 
def distance_to_pos(distances: dict) -> dict:
 
    positions = {}
 
    for index, valeur in enumerate(distances.keys()):
        positions[valeur] = index+1
 
    return positions
 
vaisseau_gris = Vaisseau("pingpong", "gris", 200, 5)
vaisseau_blanc = Vaisseau("racaille", "blanc", 150, 8)
vaisseau_noir = Vaisseau("tchung-su", "noir", 180, 6)
 
circuit = Circuit(1, 5)
 
temps = 10
distances = calculer_distances(vaisseaux=[vaisseau_gris, vaisseau_blanc, vaisseau_noir], temps=temps)
positions = distance_to_pos(distances=distances)
 
for vaisseau, position in positions.items():
    print(f"Le vaisseau {vaisseau} est à la position {position} dans la course.")