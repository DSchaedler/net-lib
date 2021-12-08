# frozen_string_literal: true

NL_S_PRE = '[NetLib][Server] '

# Server class
class NLServer
  attr_accessor :port

  def initialize(port: 9001)
    $gtk.log_debug "#{NL_S_PRE}Initializing"
    
    @port = port
    $gtk.log_debug "#{NL_S_PRE}port: #{@port}"
    
    $gtk.start_server! port: @port, enable_in_prod: true

    $gtk.log_debug "#{NL_S_PRE}host url: http://localhost:#{@port}/"
    $gtk.log_debug "#{NL_S_PRE}local url: http://#{local_ip}:#{@port}/"
    $gtk.log_debug "#{NL_S_PRE}external url: http://#{external_ip}:#{@port}/"
  end
end
