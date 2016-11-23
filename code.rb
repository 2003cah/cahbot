require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MjQ5MjY4MzkzODE3OTMxNzc2.CxPvrg.q-NUnZK5BDt1htnOyV__02XSReg',  client_id: 249268393817931776, prefix: '^'

bot.command(:shutdown,  help_available: false) do |event|
  break unless event.user.id == 228290433057292288

  bot.send_message(event.channel.id  'Cah has turned off Cah Bot')
  exit
end

bot.command :ping do |event|
  m = event.respond('Pong!')
  m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
end

bot.command :rnumber do |event, min, max|
  rand(min.to_i .. max.to_i)
end

bot.command(:invite, chain_usable: false) do |event|
  event.bot.invite_url
end

bot.command :donate do |event|
  bot.send_message(event.channel.id 'Donating? Click here  http://bit.ly/2gzJpnq')
end

bot.command(:help, chain_usable: false) do |event|
  event << ' Here are all of my commands for you to use!'
  event << ' ^rnumber <Number> <Other Number>: Gives you a random number'
  event << ' ^help: Shows this, obviously'
  event << ' ^ping: Used to show response time'
  event << ' ^invite: Gives you a link to invite me to your own server!'
  event << ' ^shutdown: Shuts me down, only Cah can use this command'
  event << ' ^donate: Want to donate? That\'s great! This command gives you a link for PayPal donations'
end

bot.run