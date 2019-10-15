# thp_mini_jeu_poo
Emeric Solome & Debora Lariviere

Porjet du jour : Création d'un petit jeu de combat du type Fortnite. Malgré des visuels bien moins ambitieux que le vrai jeu… Mais le principe sera là : des joueurs vont s'affronter dans une grande arène, s'échanger des coups, et tu ne pourras vaincre que si tu es le dernier debout ! 😎 

Le but : produire une version 1.0 , puis une version 2.0 un peu plus recherchée, pour conclure sur une version 3.0 (si possible ...). 

##Version 1.0 : coder un combat entre 2 joueurs##

Voilà les bases d'un combat :
1) 2 joueurs ;
2) Que chaque joueur ait un niveau de vie donné ;
3) Que ce niveau de vie baisse à chaque attaque subie ;
4) Si la vie atteint zéro, le personnage est mort.

Ce programme va être coder dans un fichier player.rb qui va contenir la classe Player dont le but est de modéliser un joueur.  
En plus du fichier payer.rb, la création du fichier app.rb va permettre d'orchestrer le combat et faire appel à la classe Player. Petite exception à la règle : pas besoin de créer une classe App dans ce fichier.

Version 2.0 : créer un nouveau type de joueur

Création d'un nouveau type de joueur qui va disposer de plus de compétences et de plus de choix : il sera joué par un humain.

Le but ici est de compléter le fichier player.rb en rajoutant, à la suite de la classe Player, une nouvelle classe que nous appellerons HumanPlayer. Les bonnes pratiques en Ruby voudraient qu'on découpe cela en 2 fichiers différents mais ici, on va faire simple et efficace car ce programme est relativement petit. Cette classe doit hériter de Player car il faut qu'un objet HumanPlayer ait la même base : les attributs name et life_points ainsi que toutes les méthodes codées dans la classe Player.

Pour pouvoir orchestrer tout cela nous allons créer un fichier app_2.rb permettant de feindre un combat intéractif : 
1) Un message d'accueil 
2) initialisation du joueur 
3) initialisation des ennemis
4) le combat
5) fin du jeu

Version 3.0 : un jeu mieux organisé et plus d'ennemis

En partant du fichier app_2.rb il faut créer une classe Game dans le fichier game.rb qui aura pour rôle de stocker les informations du jeu et effectuer chaque étape. 80% du contenu du fichier app_2.rb va être réutiliser pour la création du fichier game.rb. 
Comme pour les versions précèdente, un fichier app_3.rb va être créé pour qu'il puisse coordonner le jeu.
