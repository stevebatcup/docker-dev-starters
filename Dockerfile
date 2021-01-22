FROM ruby:2.7.2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
  default-mysql-client default-libmysqlclient-dev vim nodejs yarn \
  && rm -rf /var/lib/apt/lists

ENV RAILS_ENV development
ENV APP_PATH /usr/src/app
ENV PATH $APP_PATH/bin:$PATH
ENV BUNDLE_PATH /usr/src/gems

RUN mkdir -p $BUNDLE_PATH

# RUN groupadd appuser
# RUN useradd -m -r -u 1000 -g appuser appuser
# RUN chown appuser:appuser $BUNDLE_PATH

WORKDIR $APP_PATH
ADD . $APP_PATH

# RUN chown appuser:appuser $APP_PATH
# USER appuser

EXPOSE 4000
EXPOSE 3035