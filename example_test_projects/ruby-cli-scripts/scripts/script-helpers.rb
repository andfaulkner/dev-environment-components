# encoding: utf-8

def unindent(s)
  s.gsub(/^#{s.scan(/^[ \t]+(?=\S)/).min}/, '')
end
