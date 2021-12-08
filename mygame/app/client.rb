# frozen_string_literal: true

NL_C_PRE = '[NetLib][Client] '

# Client Class
class NLClient
  def initialize(server_url: 'https://localhost', server_port: 9001)
    $gtk.log_debug "#{NL_C_PRE}Initializing"
    @server_url = server_url
    @server_port = server_port
    @download_timeout = 1000
    @state_age = @download_timeout
    @state_download = nil
  end

  def tick(args)
    if @state_age >= @download_timeout
      @state_download = get_json(url: @server_url, port: @server_port, channel: 'state')
      $gtk.log_debug "#{NL_C_PRE}http response code: #{@state_download[:http_response_code]}"
      @state_age = 0
    end

    if !@state_download.nil?
      if @state_download[:complete]
        puts "Response #{@state_download[:response_data]}" if @state_download[:http_response_code] == 200
        @state_download = nil
      else
        br = @state_download[:response_read]
        total = @state_download[:response_total]
        if total != 0
          pct = br.to_f / total.to_f
          puts pct
        end
      end
    end

    @state_age += 1
    #y_height = 500
    #server_state.each_value { |value|
    #  args.outputs.labels << {x: args.grid.center_x, y: y_height, text: value, alignment_enum: 1 }
    #}
  end
end
