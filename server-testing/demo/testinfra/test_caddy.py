def test_caddy_package(host):
    pkg = host.package("caddy")
    assert pkg.is_installed

def test_caddy_service(host):
    svc = host.service("caddy")
    assert svc.is_running
    assert svc.is_enabled

def test_caddy_port_http(host):
    assert host.socket("tcp://0.0.0.0:80").is_listening

def test_caddy_port_https(host):
    assert host.socket("tcp://0.0.0.0:443").is_listening
