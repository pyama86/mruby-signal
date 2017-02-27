MRuby::Build.new do |conf|
  toolchain :gcc
  conf.gem :core => "mruby-bin-mruby"
  conf.gem :core => "mruby-print"
  conf.enable_test
end

MRuby::Build.new('test') do |conf|
  toolchain :gcc

  enable_debug
  conf.enable_bintest
  conf.enable_test
  conf.cc.include_paths << %w(/usr/local/include)
  conf.linker.library_paths << %w(/usr/local/lib)
  conf.linker.libraries << ['pthread']

  conf.gem :core => "mruby-print"
  conf.gem "../mruby-signal"
end
