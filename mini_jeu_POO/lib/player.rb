class Player
  # variables d'instances permet de lire et de modifier 
  attr_accessor :name, :life_points 

  # initialisation du joueur
  def initialize(name) 
    @name = name
    @life_points = 10
  end

  # montre l'etat du joueur 
  def show_state 
    puts "#{@name} a #{@life_points} points de vie."
  end

  # stock les points de vie
  def gets_damage(damage) 
    @life_points -= damage

    if @life_points <= 0 
      puts "Déso #{@name} t'es mort !"
    end
  end

  # lance une attaque plus affiche les dommages 
  def attacks(other_player) 
    puts "Le joueur #{@name} attaque le joueur #{other_player.name}."
    other_player_damage = compute_damage

    puts "Il lui inflige #{other_player_damage} points de dommages."
    other_player.gets_damage(other_player_damage)
  end

  # points de dommage aléatoire
  def compute_damage 
    return rand(1..6)
  end
end

# heritage de la classe Player
class HumanPlayer < Player 
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
  
    # appel toutes les methodes d'instances de la classe Player
    super 
    @life_points = 100
  end

  # fonction show_state, affiche du level de l'arme du joueur 
  def show_state 
    puts "#{@name} a #{@life_points} points de vie et une arme au niveau #{@weapon_level}."
  end

  def compute_damage 
    rand(1..6) * @weapon_level
  end

  # fonction acquerir une nouvelle arme d'un niveau supérieur
  def search_weapon 
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}."

    if new_weapon_level <= @weapon_level
      puts "Ça ne vaut pas le coup de la garder !"

    elsif new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Yes ! Je la garde."
    end
  end

  # fonction pour le package de vie en plus 
  def search_health_pack 
    health_pack = rand(1..6)

    if health_pack == 1 
      puts "Tu n'as rien trouvé !"

    elsif health_pack == 6 
      if @life_points >= 20 
        @life_points = 100
      else
        @life_points + 80
      end
      puts "Wahouuu, tu as trouvé un pack de +80 points de vie !"

    else    
     if @life_points >= 50
        @life_points = 100
     else 
        @life_points + 50
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    end
  end
end


