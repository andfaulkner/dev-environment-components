# encoding: utf-8
# frozen_string_literal: true

require 'rubygems'
require 'inline'

puts "about to monkey-patch Kernel"

# monkey-patching Kernel to show filename with puts & get a caller_filename method
module Kernel
  def caller_filename(caller_file = false, has_ext = true)
    filename = (caller_file || caller)[0].split('/').last.split(/:[0-9]{1,2}:in /).first.to_s
    return filename if has_ext

    split_filenm = filename.split(/./).size
    return filename if split_filenm == 1 || split_filenm == 2 && split_filenm.first == ''

    split_filenm.drop_right(1)
  end

  # inline :C do |builder|
    # puts 'TODO: get inline c code to work'
    # builder.include '"ruby.h"'
    # builder.c <<-'EOF'
    #   static VALUE
    #   global_variable_set(char * varname, VALUE object) {
    #     return rb_gv_set(varname, object);
    #   }
    # EOF
  # end

  old_puts = instance_method(:puts)
  define_method(:puts) do |str, *strs|
    old_puts.bind(self).("#{caller_filename(caller)}: #{str}", *strs)
  end
end
