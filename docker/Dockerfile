FROM gnuoctave/octave:6.1.0
LABEL LIONSIMBA docker file
ENV CASADI_URL="https://github.com/casadi/casadi/releases/download/3.5.5/casadi-linux-octave-6.1.0-v3.5.5.tar.gz"
ENV SUNDIALS_URL="https://computing.llnl.gov/sites/default/files/inline-files/sundials-2.6.2.tar.gz"
ENV LIONSIMBA_URL="https://github.com/lionsimbatoolbox/LIONSIMBA.git"
WORKDIR /workdir
RUN wget $CASADI_URL && mkdir casadi && tar -xvzf $(basename $CASADI_URL) -C casadi && rm $(basename $CASADI_URL)
RUN wget $SUNDIALS_URL && SUNDIALS_ARCHIVE=$(basename $SUNDIALS_URL) && tar -xvzf $SUNDIALS_ARCHIVE && rm $SUNDIALS_ARCHIVE && mv sundials* sundials
WORKDIR /workdir/sundials/sundialsTB
RUN sed -i -e "s/answ\ *=\ *input('\ *Compile.*/answ = 'y'/g" -e "s/answ\ *=\ *input('\ *Proceed.*/answ = 'y'/g" -e "s/answ\ *=\ *input('\ *Install.*/answ = 'n'/g" install_STB.m
WORKDIR /workdir
RUN git clone $LIONSIMBA_URL

CMD ["octave-cli"]
