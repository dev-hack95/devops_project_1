FROM python:3.10
LABEL maintainer="saiprasadtoshatwad01@gmail.com"
RUN apt update
RUN apt install git openssh-server -y
RUN service ssh start
RUN git clone https://github.com/dev-hack95/health_insurance_cross_sell_prediction
WORKDIR /health_insurance_cross_sell_prediction
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN dvc repro
EXPOSE 8501 22
CMD streamlit run app.py