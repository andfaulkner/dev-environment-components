# encoding: utf-8
# rubocop:disable HashSyntax

# EX. 4: Passing lambdas to rules for applying them more widely
# =============================================================

# This isn't referencable inside method source_for_htm below if not in caps: it must be a constant
MARKDOWN_FILES = Rake::FileList['rake_test_files/**/*.md', 'rake_test_files/**/*.markdown']
puts "MARKDOWN_FILES: #{MARKDOWN_FILES}"

task :htm => MARKDOWN_FILES.ext('.htm')

def source_for_htm(htm_file)
  MARKDOWN_FILES.detect{|fl| fl.ext('') == htm_file.ext('') }
  # note that htm_file items are plain strings, but rake alters ruby String class to contain ext fn
end

# convert EVERY file passed to a .htm task to .htm, regardless of extension
rule '.htm' => ->(f){source_for_htm(f)} do |t|
  sh "pandoc -o #{t.name} #{t.source}"
end
