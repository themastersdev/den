FROM gcc:latest
COPY ./den.sh ./den.sh
RUN bash ./den.sh
RUN rm ./den.sh
