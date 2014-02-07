#!/usr/bin/env ruby

# from http://errtheblog.com/posts/89-huba-huba

home = ENV['HOME']

IGNORES = ['README', 'install.rb', 'iterm2_themes']

Dir.chdir File.dirname(__FILE__) do
  dotfiles_dir = Dir.pwd.sub(home + '/', '')

  Dir['*'].each do |entry|
    next if IGNORES.include? entry
    target_name = entry == 'bin' ? entry : ".#{entry}"
    target = File.join(home, target_name)
    # File.unlink target if File.symlink? target
    unless File.exist? target
      system %[ln -vsf #{File.join(dotfiles_dir, entry)} #{target}]
    end
  end
end
