FROM ubuntu:saucy

#ENV PATH /home/s-app/.npm/npm/1.4.7/package/bin:/home/s-app/.nvm/v0.10.26/bin:/home/s-app/.nvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PATH /home/s-app/.nvm/v0.10.26/bin:/home/s-app/.nvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV HOME /home/s-app

# nvm
ENV NVM_DIR /home/s-app/.nvm
ENV NVM_NODEJS_ORG_MIRROR http://nodejs.org/dist

# npm
ENV clean no

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install git curl make

RUN addgroup --system --gid 1000 s-app
RUN adduser --system --shell /bin/bash --uid 1000 --gid 1000 --disabled-password s-app

USER s-app

RUN touch ~/.profile
#RUN touch ~s-app/.profile
#RUN chown s-app:s-app ~s-app/.profile

# nvm
RUN curl -L https://raw.github.com/creationix/nvm/master/install.sh | sh
RUN bash -l -c "nvm install 0.10"

# npm
RUN curl -L http://npmjs.org/install.sh | bash -l

#RUN mkdir /s
#RUN cd /s; git clone https://github.com/angular/angular.js.git
