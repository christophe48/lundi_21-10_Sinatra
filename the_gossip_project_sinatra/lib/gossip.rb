require 'bundler'
Bundler.require

class Gossip
  attr_accessor :content, :author

  def initialize(author,content)
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
end
