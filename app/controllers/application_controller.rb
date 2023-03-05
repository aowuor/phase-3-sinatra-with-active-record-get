class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/games' do
    games = Game.all.order(:title).limit(10)
    games.to_json
  end

  # get specific game attributes

  # get '/games/:id' do
  #   game = Game.find(params[:id])
  #   game.to_json
  # end

   # get specific game attributes and its reviews

  # get '/games/:id' do
  #   game = Game.find(params[:id])
  #   game.to_json(include: :reviews)
  # end

   # get specific game attributes and its reviews as well as users

  # get '/games/:id' do
  #   game = Game.find(params[:id])
  #   game.to_json(include: { reviews: {include: :user } })
  # end

  # get specific attributes

  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json(only: [:id, :title, :genre, :price], include: {
      reviews: {only: [:comment, :score], include: {
        user: {only: [:name] }
      }}
    }
    )
  end

end
