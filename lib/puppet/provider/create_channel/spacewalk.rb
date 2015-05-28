require "xmlrpc/client"

Puppet::Type.type(:create_channel).provide(:spacewalk) do
  desc "This provider handles the creation, status, and deletion of a spacewalk channel"

  #
  # Functions as required by ensurable types
  #
  def create
    debug("Creating spacewalk channel \"#{resource[:name]}\"")
    debug(resource[:name])
  end

  def destroy
    debug("Removing spacewalk channel \"#{resource[:name]}\"")
    debug(resource[:name])
  end

  def exists?
    debug("Checking spacewalk for channel \"#{resource[:name]}\"")
    debug(resource[:name])
    return 0
  end

  def rpc(client)
    @URL = "http://localhost/rpc/api"
    @USER = resource[:user]
    @PASS = resource[:pass]

    @client = XMLRPC::Client.new2(@URL)

    return @client
  end

  def login(client)
    @key = client.call('auth.login', @USER, @PASS)
    return @key
  end

  def logout(client, key)
    client.call('auth.logout', key)
    return null
  end

end
