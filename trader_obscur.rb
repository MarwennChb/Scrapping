require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) #on va diriger Nokogiri vers la page coin marketcap 

name_list = page.css('a.currency-name-container') #On repere le selecteur du nom des coins et on stock dans l'objet page.css qu'on nomme name_list , on va faire appel à ça par la suite en utlisant le .text qui va chercher le texte de la balise , dans notre cas le nom du coin
price_list = page.css('a.price') #On va de même stocker la liste de prix, on rpère son selecteur : a.price, et la stocke avec la methode Nokogiri dans price_list, on va par la suite appeler ['data-usd'] pour donner le prix du coin 

tab = Hash.new #on crée un nouveau Hash, dans lequel on va stocker le nom des coin et le prix associé


=begin
	Elements sur le code dessous :
	on va faire prendre à notre hash à chaque fois l'entrée : nom coin ==> prix coin
	on va donc utiliser .text et ['data-usd'] pour chaque éléments de nos array définits dessus
	pour y extraire le nom du coin et le prix associé
	Ici nous avons la chance que la longeur des 2 tableau (prix, coin)
 sont identiques
	on crée donc une boucle for qui commence à 0 et se termine à name_list.length-1 : qui
	correspond à la longueur de notre tableau
	et on termine par puts notre hash
=end

for i in 0 .. (name_list.length-1)
	tab[name_list[i].text] = [price_list[i]['data-usd']] 
end

#un petit timer pour que le code dort 1h et puis se relance
puts tab
puts "-----------------------------------------------------------------"
puts "sleeping 1h"
sleep(3600)
