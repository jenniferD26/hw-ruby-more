class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end
  class InvalidNameError < StandardError ; end

  def self.winner(player1, player2)
    
    #check to make sure they threw valid things
    player1Strat = player1[1] =~ /(R|P|S)/
    player2Strat = player2[1] =~ /(R|P|S)/
    
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" if (player1Strat == nil)
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" if (player2Strat == nil)
    raise InvalidNameError, "Name of player must be a string" if (!player1[0].kind_of? String)
    raise InvalidNameError, "Name of player must be a string" if (!player2[0].kind_of? String)
    
    # player 1 throws rock
    if (player1[1] == "R" and player2[1] == 'P')
      return player2
    end
    
    # player 1 throws paper
    if (player1[1] == "P" and player2[1] == 'S')
      return player2
    end
    
    # player 1 throws scissors
    if (player1[1] == "S" and player2[1] == 'R')
      return player2
    end
    
    # if none of the conditions were satisfied then player 1 won
    return player1
    
  end

  def self.tournament_winner(tournament)
    
    # terminating condition
    if(tournament.dig(0,0).kind_of? String)
      return self.winner(tournament[0], tournament[1])
    end
    
    # left branch
    finalistOne = self.tournament_winner(tournament[0])
    
    # right branch
    finalistTwo = self.tournament_winner(tournament[1])
    
    return self.winner(finalistOne, finalistTwo)
    
  end

end
