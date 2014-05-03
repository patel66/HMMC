module HMMC
  module Databases
    class InMemory

      def initialize
        @users = {}

      end

      def create_user(attrs)
        # attr_accessor :id, :school, :name, :email, :password
        user = User.new(:name => attrs[:name], :email=> attrs[:email], :password=>attrs[:password])
      end

      def create_school(attrs)

      end

      def get_user(id)

      end

      def get_school(id)

      end

    end
  end
end

# def create_game(attrs)
#         game = Game.new(:players => attrs[:players], :dice_cup => DiceCup.new)
#         game.id = (@game_id_counter += 1)
#         @games[game.id] = game

#         starting_player = game.players.sample
#         starting_turn = Turn.new(:game_id => game.id, :player => starting_player)
#         game.turns.push(starting_turn)
#         game
#       end
# module RabbitDice
#   module Databases
#     class InMemory
