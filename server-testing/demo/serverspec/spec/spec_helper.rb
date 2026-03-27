require 'serverspec'
require 'net/ssh'

set :backend, :ssh

def parse_ssh_config(path)
  config = {}
  File.readlines(path).each do |line|
    next if line =~ /^\s*(#|Host )/
    key, value = line.strip.split(/\s+/, 2)
    config[key.downcase] = value if key && value
  end
  config
end

RSpec.configure do |c|
  ssh = parse_ssh_config('../.vagrant-ssh-config')
  c.host = ssh['hostname'] || '127.0.0.1'
  c.ssh_options = {
    user:                  ssh['user'] || 'vagrant',
    port:                  (ssh['port'] || 22).to_i,
    keys:                  [ssh['identityfile']],
    auth_methods:          ['publickey'],
    user_known_hosts_file: '/dev/null',
    verify_host_key:       :never
  }
end
