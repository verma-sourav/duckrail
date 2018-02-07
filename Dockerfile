FROM debian
LABEL maintainer="Lazarus Lazaridis http://iridakos.com"

# Install required debian packages
RUN apt-get update && apt-get install -y build-essential curl procps git-core libxml2-dev nodejs

# Install rvm
RUN \curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN \curl -L https://get.rvm.io | bash -s stable

# Install rvm requirements, ruby & bundler
RUN /bin/bash -l -c "rvm requirements && rvm install ruby-2.4.2"

# Clone the repo
RUN /bin/bash -l -c "cd /opt && git clone https://github.com/iridakos/duckrails"

# Change to repo directory
WORKDIR /opt/duckrails

# From now on execute rails stuff in production mode
ENV RAILS_ENV production

# Expose container port 80
EXPOSE 80

# Configure database & install gems
RUN /bin/bash -l -c "cp config/database.yml.sample config/database.yml && gem install bundler --no-ri --no-rdoc && bundle install --deployment --without development test"
# Export the required secret key base for production rails environment
RUN /bin/bash -l -c 'foo=$(/bin/bash -l -c "bundle exec rake secret") && echo "export SECRET_KEY_BASE=$foo" >> ~/.bashrc'
# Create database & compile the assets
RUN /bin/bash -l -c "RAILS_ENV=production bundle exec rake db:create db:migrate assets:precompile"

# Start the server
CMD ["/bin/bash", "-l", "-c", "bundle exec puma -p 80 -w 3"]
