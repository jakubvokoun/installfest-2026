require 'spec_helper'

describe package('caddy') do
  it { should be_installed }
end

describe service('caddy') do
  it { should be_running }
  it { should be_enabled }
end

describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end
