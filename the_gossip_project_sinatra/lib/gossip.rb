require 'bundler'
Bundler.require

class Gossip
  attr_accessor :content, :author

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content]
    end
  end

  def self.all
  all_gossips = [] #on initialise un array vide
  # va chercher chacune des lignes du csv do
    # crée un gossip avec les infos de la ligne
    # all_gossips << gossip qui vient d'être créé
  # end
    CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
  return all_gossips
  end

  #Pour récapituler, nous allons :

  #Créer une route dynamique pour qu'à chaque fois qu'un utilisateur rentre une URL du type http://localhost:4567/gossips/x/, Sinatra comprenne que l'on veut voir la page show du potin N°x en BDD ;
  #Récupérer dans notre BDD le potin N°x avec une belle méthode #find ;
  #Afficher le contenu du potin dans la page show.

  def self.find(id)
    gossip = [] #je crée un nouveau tableau pour afficher le potin correspondant à l'id
    gossip << Gossip.all[id.to_i] #je renvoie la méthode all afin de récupéré le tableau all_gossips
      return gossip
  end
end
