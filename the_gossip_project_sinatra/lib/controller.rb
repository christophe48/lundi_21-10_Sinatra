require 'bundler'
Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base

    get '/' do
      erb :index, locals: {gossips: Gossip.all}
  end

    get '/gossips/new/' do
  erb :new_gossip
  end

    post '/gossips/new/' do
  Gossip.new(params["gossip_author"],params["gossip_content"]).save
  redirect '/'
  end

    get '/gossips/:id/' do
  erb :show, locals: {gossips: Gossip.find(params['id'])} #je fais appel à mon fichier show,et j'applique mes methode all et find tout en précisant que mon id doit être un Intenger
  end


end
  #Et quand tu vas soumettre le formulaire, voici ce qui va se passer :
  #Le programme va récupérer les informations du formulaire avec params ;
  #Il enregistre ces informations dans un fichier CSV grâce à notre classe Gossip ;
  #Il redirige l'utilisateur vers la page d'accueil.
