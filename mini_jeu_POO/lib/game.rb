require_relative 'player'

class Game
  attr_accessor :human_player, :enemies

  #creation du joueur et de ses ennemis
  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name)
    @enemies = [Player.new("Perceval"), Player.new("Arthur"), Player.new("Leodagan"), Player.new("Karadoc")]
  end

  # permet de supprimer un ennemi tué du tableau
  def  kill_player
    @enemies.each do |dead_player|
      if dead_player.life_points <= 0 
        @enemies.delete(dead_player)
      end
    end
  end

  # verifie si le joueur est toujours vivant ainsi que les ennemis
  def is_still_gongoing?
    if @human_player.life_points > 0 && !@enemies.empty?
      return true
    else
      return false
    end
  end
 
  # affiche l'état du joueur et de ses ennemis 
  def show_players
    puts "Voici ton état :"
    puts @human_player.show_state
    puts ""
    puts "Voici le nombre d'ennemies restant :#{@enemies.count}"
  end

  # affiche le menu d'actions
  def menu 
    puts "-------------------------------------------------"
    puts ""
    puts "Quelle action veux-tu effectuer ? "
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "Attaquer un joueur en vue :"
      count_index = 0 

      @enemies.each do |state_enemies|
          if state_enemies.life_points > 0 # affiche ceux vivant 
            print "#{count_index} - "
            state_enemies.show_state
            count_index += 1
          end
      end
  end

   # permet de faire un choix
  def menu_choice(choice)
    
  end
end
