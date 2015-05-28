# === Define: create_channel
#
# This resource type defines a new channel in spacewalk.
#
Puppet::Type.newtype(:create_channel) do
  @doc = "Create a new channel in spacewalk."
  ensurable
  
  newparam(:name, :namevar => true) do
    desc "Name of the spacewalk channel."
  end

  newparam(:user) do
    desc "Spacewalk username."
  end

  newparam(:pass) do
    desc "Spacewalk password."
  end

  newproperty(:label) do
    desc "Label for the spacewalk channel."
  end

  newproperty(:description) do
    desc "Description for the spacewalk channel."
  end

end
