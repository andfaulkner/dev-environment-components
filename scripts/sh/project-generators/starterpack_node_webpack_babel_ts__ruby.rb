require 'slop';

opt_to_search_for = ARGV.first.split('--').join
opts = Slop.parse do |o|
    o.bool '--redis', 'redis selected'
    o.bool '--express', 'express selected'
end

if opts.to_hash[opt_to_search_for.to_sym] == true
    puts 'true'
else
    puts 'false'
end
