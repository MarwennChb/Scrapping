require 'rubygems'
require 'nokogiri'
require 'open-uri'

=begin
	L'idée dans cette fonction est de chercher le selectionneur du mail.
	Laproblematique est que ce selectionneur renvoie à plsuieurs oject du code HTML
	L'idée est donc d'utiliser le maximum de tags possibles pour serner au mieux cette valeu
	donc le mail se trouve dans une balise p ayant comme classe Style22, qui ele même se trouve 
	dans une balise td de classe27, et aisi de suite.
	Quand on fait page.css avec ces elements plusieurs résultats sortent,
	On cherche donc dans cett output (en mettant des puts intermédiaires)
	Ainsi nous avons vu que le main est sur la position 7 de l'array
	Pour cette raison ligne 20 on voit le [6]
	on applique le .text ==> qui nous sort le mail

	l'histoire du +url
	au fait on va faire prendre comme entrée à la fonction 
	get_the_email_of_a_townhal_from_its_webpage l'output (url) de la fonction 2 
	get_all_the_urls_of_val_doise_townhalls précédé d'un lien qui ne change pas pour le site des mairie
	https://annuaire-des-mairies.com/"+url : 

=end


def get_the_email_of_a_townhal_from_its_webpage(url)
	page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/"+url))   
	mairie_list = page.css('td.style27 p.Style22 font')[6].text

	puts mairie_list

end



def get_all_the_urls_of_val_doise_townhalls
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	mairie_url = page.css('a.lientxt')
	mairie_url.each do |x|
		puts get_the_email_of_a_townhal_from_its_webpage(x["href"][1..-1])#j'aurais pas du coder la boucle ici. Ce code prend l'url, avec le href !! le [1..-1], car les url que ça renvoie, ont tous des point (.) devant, donc ce code les supprime
	end
end

get_all_the_urls_of_val_doise_townhalls
