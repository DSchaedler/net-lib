# frozen_string_literal: true

def local_ip
  ($gtk.exec 'powershell -Command (Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address).IPAddressToString').strip
end

def external_ip
  ($gtk.exec 'powershell -Command (Resolve-DnsName -Name myip.opendns.com -Server 208.67.222.220).IPAddress').strip
end

def send_json(channel:, json:, port: 9001)
  $gtk.http_post "http://localhost:#{port}/#{channel}", json, ['Content-Type: application/json', "Content-Length: #{json.length}"]
end

def get_json(url:, port:, channel:)
  $gtk.http_get "#{url}:#{port}/#{channel}"
end

def hash_to_json(hash)
  puts hash
end
