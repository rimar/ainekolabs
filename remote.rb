require 'job'

class Remote
  def register

  end

  def getJobs
    [Job.new("Tic Tac Toe", 
             Job::START, 
             {"bot"=>"git://github.com/rimar/tttbot.git",
              "player1"=>"git://github.com/rimar/tttrandomplayer.git",
              "player2"=>"git://github.com/rimar/tttrandomplayer.git" })]
  end

  def reportStatistics

  end
end

