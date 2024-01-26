# 2
## Exercice 1 

L'erreur est : Initializer 'init(_:rowContent:)' requires that 'String' conform to 'Identifiable'
Il y a besoin d'un id pour pouvoir itérer sur la lister.

## Exercice 2

L'id de la liste est directement mit dans le foreach.

On utilise le foreach car désormais on peut itérer sur la liste et récupérer l'id.
son rôle est de parcourir notre liste.
Car si on met le bouton dans le foreach on aura autant de bouton que d'items dans notre liste.

## Exercice 3

Non il ne fonctionne pas car on a l'erreur Cannot use mutating member on immutable value: 'self' is immutable. Car notre liste n'est pas déclaré en tant qu'état et on donc on ne peut pas la modifier

j'ai déclaré ma liste en tant que State donc maintenant à chaque changement ma liste est modifié.

# 4

## Exercice 1 

L'objet n'est pas écouté donc il a besoin de @StateObject pour que quand on modifie l'objet cela s'actualise.
Et il faut envoyer nos données à notre vue grâce au mot clé @Published.

Le problème est que nous ajoutons plusieurs items avec le même id, voici le message d'erreur : 
ForEach<Array<String>, String, Text>: the ID Magie de feu occurs multiple times within the collection, this will give undefined results!

## Exercice 2

Cela fonctionne de nouveau car nous avons  rajouter de quoi écouter nos variables et que l'on envoyait pas nos données.

Car State ne fonctionne pas avec les objets et ObservableObject n'est pas fait pour être associé a une classe.

## Exercice 3

Pour pouvoir itérer.

