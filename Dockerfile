FROM python:3.10-slim-buster

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o arquivo de requisitos para o contêiner
COPY requirements.txt .

# Instalar as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante do código da aplicação para o contêiner
COPY . .

# A porta padrão que o Cloud Run espera é a 8080.
# Sua API deve estar configurada para escutar nesta porta.
ENV PORT 8080
EXPOSE 8080

# Comando para iniciar sua API FastAPI com Uvicorn quando o contêiner for executado.
# Assumimos que seu arquivo principal é 'main.py' e a variável da aplicação FastAPI é 'app'.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
