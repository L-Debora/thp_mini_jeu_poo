require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts ""

# creation du joueur humain
puts "Quel est ton pseudo de combattant ?"
print"> "
user_name = gets.chomp
puts ""
user = HumanPlayer.new(user_name)

# creation des ennemies 
players_arr = [player1 = Player.new("Josiane"), player2 = Player.new("José")]

while  user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) 

  puts "Voici ton état #{user_name} :"
  puts user.show_state
  puts "Voici l'état de tes ennemis :"
  print player1.show_state
  puts player2.show_state

  puts "-------------------------------------------------"
  puts ""
  puts "Quelle action veux-tu effectuer ? "
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "Attaquer un joueur en vue :"
  if player1.life_points > 0
    print "0 - "
    player1.show_state
  end
  if player2.life_points > 0
    print "1 - "
    player2.show_state
  end
  puts ""
  puts "Votre choix ?"
  print "> "
  action = gets.chomp

  if action == "a" 
    user.search_weapon
  end

  if action == "s"
    user.search_health_pack
  end

  if action == "0" && player1.life_points > 0
    user.attacks(player1)
  end

  if action == "1" && player2.life_points > 0
    user.attacks(player2)
  end
  puts ""
  puts "-------------------------------------------------"
  puts ""

  # attaque des ennemies seulement si ils sont vivant
  if player1.life_points > 0 && player2.life_points > 0
    puts "Les autres joueurs d'attaquent !"
  end

  players_arr.each do | enemy |
    if enemy.life_points>0
      enemy.attacks(user)
    end
  end
end

puts "-------------------------------------------------"
puts "-------------La partie est finie !---------------"
puts ""

if user.life_points > 0
  puts "BRAVO TU AS GAGNÉ !"
else
  puts "LOOSER TU AS PERDU !"
end