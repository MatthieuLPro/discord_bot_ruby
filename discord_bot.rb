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
bot.message(with_text: @player_game.each { |value| "!#{value}"}) do |event|
	player_list(event, event.message.content)
	event.respond @string
end

# Association part
bot.message(with_text: '!bureau') do |event|
	event.respond "#{event.author.mention} Président : RudeBoy - Trésorier : Malus"
end

bot.message(with_text: '!projet') do |event|
	projets(event)
	event.respond "#{event.author.mention} #{@string}"
end

# Animation part
bot.message(with_text: @merci_array.each { |value| value }) do |event|
	event.respond "#{event.author.mention} de rien !"
end

bot.message(with_text: '!dice') do |event|
	value = rand(6) + 1
	if value <= 2
		event.respond "#{event.author.mention} obtient une valeur de #{value} ... dommage !"
	elsif value <= 5
		event.respond "#{event.author.mention} obtient une valeur de #{value}, pas mal !"
	else
		event.respond "#{event.author.mention} obtient une valeur de #{value}, GG !"
	end
end

bot.run