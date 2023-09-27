#import modules
import requests

#requête web pour récupérer les données de l'url
response = requests.get('https://data.education.gouv.fr/api/v2/catalog/datasets?limit=10&offset=0&timezone=UTC')

#extraction des données de l'url en json
json_data = response.json()

#affichage des données récupérées en json
print(json_data)