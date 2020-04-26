namespace :dev do

  desc "Set dev environment"
  task env_dev: :environment do
    bash "source ./.envs/dev.env && rails s"
  end

  desc "Set test environment"
  task env_test: :environment do   
    bash "source ./.envs/test.env && rails s" 
  end

  desc "Set prod environment"
  task env_prod: :environment do
    bash "source ./.envs/prod.env && rails s"
  end

acti  desc "run rest"
  task test: :environment do   
    bash "source ./.envs/test.env && rails t" 
  end

  desc "deploy"
  task deploy: :environment do
    sh "git push heroku master"
    sh "heroku run rails db:migrate --remote heroku"
  end


  def bash cmd 
    cmd = "set -o pipefail && #{cmd}"
    system("bash -c #{cmd.shellescape}")
    cmd_status = $?
    if cmd_status != 0
        raise "'#{cmd}' execution failed (exit code: #{cmd_status})"
    end 
  end 
end
