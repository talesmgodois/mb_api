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

  def bash cmd 
    cmd = "set -o pipefail && #{cmd}"
    system("bash -c #{cmd.shellescape}")
    cmd_status = $?
    if cmd_status != 0
        raise "'#{cmd}' execution failed (exit code: #{cmd_status})"
    end 
  end 
end
