# All the functions

def player_list(event, game)
	case game
		when "!bt7"
		game = "tekken"
		when "!bsf"
		game = "sf"
		when "!bdbz"
		game = "dbz"
	end 
	@string = @listing_player[game]
	eval("@player_#{game}").each_with_index { |(key, value), index| @string += "#{index + 1}) #{key} - #{value} points.\n" }
end

def tournois(event)
	@string = "Liste des tournois à venir:\n"
	@event.each_with_index { |(key, value), index| @string += "#{key} le #{value}\n" }
end

def projets(event)
	@string = "Liste des projets de l'association et les responsables:\n"
	@projet.each { |key, value| @string += "#{key} - Respo : #{value}\n" }
end