module Envs
  def self.homedir
   @@homedir ||= ENV['HOME'] || ENV['HOMEDRIVE'] + ENV['HOMEPATH']
  end
  def self.ainekodir
    @@ainekoidir ||= homedir + "/.aineko"
  end
end

