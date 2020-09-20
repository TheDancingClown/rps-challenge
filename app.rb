require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/score'

class RPSLS < Sinatra::Base

  before do
    @game = Game.instance
    @p1_score = Score.instance
    @p2_score = Score.instance
  end

  get '/' do
    erb :login
  end

  post '/names' do
    @p1, @p2 = params[:p1], params[:p2]
    @game = Game.create(@p1, @p2)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/selection' do
    @game.p1_choice(params[:selection])
    @game.randomiser
    @game.compare
    redirect '/play'
  end
  
  run! if app_file == $0

end
