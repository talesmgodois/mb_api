# frozen_string_literal: true

namespace :dev do
  namespace :run do
    desc 'Run dev environment'
    task dev: :environment do
      bash 'source ./.envs/dev.env && rails s'
    end

    desc 'Run prod environment'
    task prod: :environment do
      bash 'source ./.envs/prod.env && rails s'
    end

    desc 'Run tests'
    task test: :environment do
      bash 'source ./.envs/test.env && bundle exec guard'
    end
  end

  namespace :console do
    desc 'Run dev console'
    task dev: :environment do
      bash 'source ./.envs/dev.env && rails c'
    end

    desc 'Run prod console'
    task prod: :environment do
      bash 'source ./.envs/prod.env && rails c'
    end

    desc 'Run test console'
    task test: :environment do
      bash 'source ./.envs/test.env && rails c'
    end
  end

  namespace :deploy do
    desc 'Deploy at Heroku'
    task heroku: :environment do
      sh 'git push heroku master'
      sh 'heroku run rails db:migrate --remote heroku'
    end
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
