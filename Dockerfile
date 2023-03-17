FROM python:3.10
WORKDIR /app
RUN git clone https://github.com/dev-hack95/health_insurance_cross_sell_prediction
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN dvc repro
EXPOSE 8501
CMD streamlit run app.py