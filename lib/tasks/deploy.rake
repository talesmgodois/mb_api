namespace :deploy do
  
  desc 'Deploy at Heroku'
  task heroku: :environment do
    sh 'git push heroku master'
    sh 'heroku run rails db:migrate --remote heroku'
  end

  private

  def bash(cmd)
    cmd = "set -o pipefail && #{cmd}"
    system("bash -c #{cmd.shellescape}")
    cmd_status = $CHILD_STATUS
    if cmd_status != 0
      raise "'#{cmd}' execution failed (exit code: #{cmd_status})"
    end
  end
end
