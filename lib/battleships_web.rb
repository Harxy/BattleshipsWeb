require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  set :views, proc { File.join(root, '..', 'views') }

  get '/name_entry' do
    @visitor = params[:name]
    erb :name_entry
  end

  get '/board' do
    game = Game.new Player, Board
    game.player_1.place_ship Ship.battleship, :A1, :vertically
    @board = game.opponent_board_view game.player_1
    erb :board
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
