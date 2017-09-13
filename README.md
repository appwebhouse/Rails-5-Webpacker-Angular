# Code Challenge APP

    git clone -b Angular https://github.com/appwebhouse/challenge.git
    cd challenge
    cp .env_example .env #fill envs
    bundle install
    bundle exec rake db:migrate
    foreman start -f Procfile.dev
    localhost:5000

#### [Rails version](https://github.com/appwebhouse/challenge/tree/master)
