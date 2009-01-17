module Envs
  def home
   @home ||= ENV['HOME'] || ENV['HOMEDRIVE'] + ENV['HOMEPATH']
  end
  def aineko
    @aineko ||= home + "/.aineko"
  end
end

