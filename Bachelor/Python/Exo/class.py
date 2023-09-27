class Moldu():
    def __init__(self,nom):
        self.__nom = nom
class Sorcier(Moldu):
    def __init__(self,nom,maison):
         # Appel du constructeur de la classe parent (Moldu)
        Sorcier().__init__(nom)
        self.__maison = maison

    def lancer_un_sort(self):
        print(f'Lancer un sort par {self._Moldu__nom}')

voldemort= Sorcier('voldemort','serpentard')
dursley = Moldu('dursley')

voldemort.lancer_un_sort()
dursley.lancer_un_sort()