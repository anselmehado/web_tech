require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/Lexercice', WEBrick::HTTPServlet::ERBHandler, 'Lexercice.html.erb')
# この一行を追記
server.mount('/indique.cgi', WEBrick::HTTPServlet::CGIHandler, 'indique.rb')
server.start
