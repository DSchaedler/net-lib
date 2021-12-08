# frozen_string_literal: true

require 'app/net_lib.rb'
require 'app/server.rb'
require 'app/client.rb'

def tick(args) # rubocop:disable Lint/UnusedMethodArgument
  args.state.nl_server ||= NLServer.new
  args.state.cl_client ||= NLClient.new
end
