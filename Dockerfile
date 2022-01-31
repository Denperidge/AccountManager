# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

RUN printf "SECRET_KEY='$(openssl rand -hex 24)'\n\nDB_URL='mysql+pymysql://root:mysql_darkflame_password@darkflameserver-db/luniserver_net'\n" > credentials.py
# https://github.com/DarkflameUniverse/AccountManager#run-and-install part 2
RUN printf "LOGO = 'logo/logo.png'\n\nPRIVACY_POLICY = 'policy/Privacy Policy.pdf'\n\nTERMS_OF_USE = 'policy/Terms of Use.pdf'" > resources.py

COPY . .

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
