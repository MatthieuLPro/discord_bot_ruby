require 'dotenv'
Dotenv.load
require 'bundler/setup'
Bundler.require
require_relative 'function'
require_relative 'data'

bot = Discordrb::Bot.new token: ENV.fetch('BOT_TOKEN'), client_id: ENV.fetch('CLIENT_ID')

bot.message(with_text: '!command') do |event|
  event.respond "Comment ça tu connais pas tes commandes ?!
  - !event : Afficher les prochains évènements
  - !bt7 : Afficher le top 5 T7
  - !bsf : Afficher le top 5 SFV
  - !bdbz : Afficher le top 5 DBZ"
end


# Event part
bot.message(with_text: '!event') do |event|
	tournois(event)
	event.respond @string
end

# Player part
bot.message(with_text: '!bt7') do |event|
	player_list(event, "tekken")
	event.respond @string
end

bot.message(with_text: '!bsf') do |event|
	player_list(event, "sf")
	event.respond @string
end

bot.message(with_text: '!bdbz') do |event|
	player_list(event, "dbz")
	event.respond @string
end

# Association part
bot.message(with_text: '!bureau') do |event|
	identify_user(event)
	event.respond "@#{@user}: Président : RudeBoy - Trésorier : Malus"
end

bot.message(with_text: '!projet') do |event|
	identify_user(event)
	projets(event)
	event.respond "@#{@user}: #{@string}"
end

# Animation part
bot.message(with_text: '!merci') do |event|
	identify_user(event)
	event.respond "@#{@user}: de rien !"
end

bot.message(with_text: '!dice') do |event|
	value = rand(6) + 1
	identify_user(event)
	if value <= 2
		event.respond "@#{@user} obtient une valeur de #{value} ... dommage !"
	elsif value <= 5
		event.respond "@#{@user} obtient une valeur de #{value}, pas mal !"
	else
		event.respond "@#{@user} obtient une valeur de #{value}, GG !"
	end
end

bot.run