require 'dotenv'
Dotenv.load
require 'bundler/setup'
Bundler.require

bot = Discordrb::Bot.new token: ENV.fetch('BOT_TOKEN'), client_id: ENV.fetch('CLIENT_ID')

bot.message(with_text: 'Command!') do |event|
  event.respond "Comment ça tu connais pas tes commandes ?!
  - Command! : Afficher les commandes
  - Event! : Afficher les prochains évènements
  - Bt7! : Afficher le top 5 T7
  - Bsfv! : Afficher le top 5 SFV
  - Bdbz! : Afficher le top 5 DBZ"
end

bot.message(with_text: 'Event!') do |event|
	event.respond "Y 'en a trop, je peux pas les tous les citer ..."
end

bot.message(with_text: 'Bt7!') do |event|
	event.respond "Heihachi approves ...
	1st : Super Akouma - 2230 pts
	2nd : Guni - 1795 pts
	3eme : DougFormParis - 1215 pts
	4eme : Kalak - 1105 pts
	5eme : TinkiBoobiz - 785 pts"
end

bot.message(with_text: 'Bsfv!') do |event|
	event.respond "Hadouken spirit team ...
	1st : Luffy - 2165 pts
	2nd : Akainu - 1205 pts
	3eme : JuniorLeo - 587 pts
	4eme : Mister Crimson - 410 pts
	5eme : Layo - 355 pts"
end

bot.message(with_text: 'Bdbz!') do |event|
	event.respond "Omae no deban da Gohan !
	1st : Skyll - 1720 pts
	2nd : Eifi - 1435 pts
	3eme : Wawa - 1335 pts
	4eme : Alioune - 915 pts
	5eme : Noka - 835 pts"
end

bot.run