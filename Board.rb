class Board
  include Enumerable

  attr_accessor :cases

  def initialize # Définition des instances et regroupement dans une array
    @boardcase_1 = BoardCase.new(1)
    @boardcase_2 = BoardCase.new(2)
    @boardcase_3 = BoardCase.new(3)
    @boardcase_4 = BoardCase.new(4)
    @boardcase_5 = BoardCase.new(5)
    @boardcase_6 = BoardCase.new(6)
    @boardcase_7 = BoardCase.new(7)
    @boardcase_8 = BoardCase.new(8)
    @boardcase_9 = BoardCase.new(9)
    @cases = [[@boardcase_1, @boardcase_2, @boardcase_3], [@boardcase_4, @boardcase_5, @boardcase_6], [@boardcase_7, @boardcase_8, @boardcase_9]]
  end

  def to_s # mise en String
    @cases.each do |board|
      board = board.to_s
    end
    puts @cases[0].join("|") # affichage du board
    puts @cases[1].join("|")
    puts @cases[2].join("|")
  end

  def victory?(player1, player2)
    win_combos = [[@boardcase_1, @boardcase_2, @boardcase_3], # Array des combinaisons gagnantes
                  [@boardcase_1, @boardcase_4, @boardcase_7],
                  [@boardcase_1, @boardcase_5, @boardcase_9],
                  [@boardcase_4, @boardcase_5, @boardcase_6],
                  [@boardcase_7, @boardcase_8, @boardcase_9],
                  [@boardcase_3, @boardcase_5, @boardcase_7],
                  [@boardcase_2, @boardcase_5, @boardcase_8],
                  [@boardcase_3, @boardcase_6, @boardcase_9]]

    win_combos.each do |combos| # Boucle de vérification de condition de victoire
      if combos[0].to_s == player1.value && combos[1].to_s == player1.value && combos[2].to_s == player1.value
        player1.state = "win"
        puts player1.name + " " + "won"

      elsif combos[0].to_s == player2.value && combos[1].to_s == player2.value && combos[2].to_s == player2.value
        puts player2.name + " " + "won"
        player2.state = "win"
      end
    end
    # à partir du tableau de tableau (qui n'a servi à rien au final), on le flatten
    # puis comme c'est un tableau de boardman
    # on .map value
    # pour qu'il devienne un tableau de value
    # càd un tableau de string ou de integer
    tablo = @cases.flatten.map(&:value)
    # on vérifie si le tableau est composé entièrement de string
    # càd c'est un draw
    # unless il y a déjà un win
    # unless (player1.state = "win" || player2.state = "win")
    if tablo.all?(String)
      puts "draw mfw"
      player1.state = "draw"
      player2.state = "draw"
    end
    # end
  end

  def play(player, num) # Changement des numéros initiaux en O ou X. Si l'input n'est pas un numéro, on passe le tour. Tolérance 0 !
    if @cases.flatten.fetch(num - 1, "non").value == "O"
      puts "invalid move, player change"
    elsif @cases.flatten.fetch(num - 1, "non").value == "X"
      puts "invalid move, player change"
    else @cases.flatten.fetch(num - 1, "non").value = player.value
    end
  end
end
