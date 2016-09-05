# encoding: utf-8
# frozen_string_literal: true

# saves alias_method before monkey-patching it
class Class
  alias :alias_method_orig :alias_method
end

# monkey-patch alias_method, add lifecycle hooks
class Class
  def alias_method(orig_method, new_method)
    puts "new method alias_method: #{orig_method} aliased to #{new_method}"
    alias_method_orig(orig_method, new_method)
  end

  def self.inherited(base)
    puts "Class inherited by: #{base}"
  end
end
