# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
require "ipaddr"

# ---- original file header ----
#
# @summary
#   Returns an ip address for the given network in cidr notation
#
#ip_for_network("127.0.0.0/24") => 127.0.0.1
#
#
Puppet::Functions.create_function(:'openstack::ip_for_network') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end


  def default_impl(*args)
     
    addresses_in_range = [] 

    range = IPAddr.new(args[0])
    facts = compiler.node.facts.values
    ip_addresses = facts.select { |key, value| key.match /^ipaddress/ }

    ip_addresses.each do |pair|
      key = pair[0]
      string_address = pair[1]
      ip_address = IPAddr.new(string_address)
      if range.include?(ip_address)
        addresses_in_range.push(string_address)
      end
    end

    # TODO don't be a dork dork with the return
    # handle multiple values!
    return addresses_in_range.first
  
  end
end
