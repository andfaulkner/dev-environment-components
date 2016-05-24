first_pass = $_.to_s.sub("<TR><TD>", "KEY:    ").sub("</TD><TD>", "            | ACTION:   ");
two_parts = first_pass.split("        | ACTION:   ")
first_half=two_parts[0].to_s.rstrip.ljust(25)
puts ""
puts "#{first_half}|"
$_ = [first_half, two_parts[1].to_s].join('')
