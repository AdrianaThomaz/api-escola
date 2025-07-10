# Imersão DevOps - Alura Google Cloud
# API Escola

Este projeto é uma API RESTful para gerenciamento de dados de uma escola, desenvolvida com **FastAPI** e conteinerizada com **Docker**.

## 🚀 Tecnologias Utilizadas

* **Python 3.10**: Linguagem de programação principal.
* **FastAPI**: Framework web moderno e rápido para construção de APIs em Python.
* **Uvicorn**: Servidor web ASGI para rodar aplicações FastAPI.
* **SQLModel**: Biblioteca para interagir com bancos de dados, combinando a facilidade do Pydantic com o poder do SQLAlchemy.
* **Docker**: Para empacotar a aplicação e suas dependências em um contêiner, facilitando a portabilidade e implantação.
* **Google Cloud Run**: Serviço serverless para rodar contêineres na nuvem, escalando automaticamente e com pagamento por uso.
* **Google Artifact Registry**: Repositório de imagens Docker na nuvem.
* **Google Cloud Build**: Serviço de CI/CD para construir e versionar imagens Docker.

## ✨ Funcionalidades Principais

Esta API permite gerenciar informações de **Alunos**, **Cursos**, **Disciplinas** e **Professores**. Alguns dos endpoints disponíveis incluem:

* Listar todos os alunos
* Adicionar novos alunos
* Buscar alunos por ID
* Atualizar dados de alunos
* Deletar alunos
* (E funcionalidades similares para Cursos, Disciplinas e Professores, conforme implementado no código)


## ☁️ API Implantada no Google Cloud Run

A API está atualmente implantada e acessível publicamente através do Google Cloud Run:

* **URL da API:** `https://minha-api-escola-514805867024.southamerica-east1.run.app`
* **Documentação Interativa (Swagger UI):** `https://minha-api-escola-514805867024.southamerica-east1.run.app/docs`

Você pode usar a documentação interativa para explorar e testar os endpoints da API diretamente no seu navegador!



## ⚙️ Como Rodar Localmente (Desenvolvimento)

Para rodar esta API em sua máquina local:

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/AdrianaThomaz/api-escola.git](https://github.com/AdrianaThomaz/api-escola.git)
    cd api-escola
    ```
    (Lembre-se de usar seu nome de usuário exato no lugar de `AdrianaThomaz` se for diferente para clonar)

2.  **Crie e ative um ambiente virtual:**
    ```bash
    python3 -m venv venv
    source venv/bin/activate  # No Linux/macOS
    # venv\Scripts\activate   # No Windows
    ```

3.  **Instale as dependências:**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Execute a aplicação:**
    ```bash
    uvicorn main:app --reload --host 0.0.0.0 --port 8000
    ```
    A API estará acessível em `http://127.0.0.1:8000` e a documentação em `http://127.0.0.1:8000/docs`.



## 🐳 Construção e Implantação com Docker (Exemplo)

O projeto inclui um `Dockerfile` para conteinerização.

Para construir a imagem Docker localmente:

```bash
docker build -t minha-api-escola .

Para rodar a imagem Docker localmente:

Bash

docker run -p 8080:8080 minha-api-escola


A implantação na nuvem foi realizada no Google Cloud Run usando o Google Cloud Build e o Google Artifact Registry. O comando de deploy utilizado foi:

Bash

gcloud builds submit --tag southamerica-east1-docker.pkg.dev/ivory-lotus-464821-f4/api-escola/minha-api:latest .
gcloud run deploy minha-api-escola \
--image southamerica-east1-docker.pkg.dev/ivory-lotus-464821-f4/api-escola/minha-api:latest \
--platform managed \
--region southamerica-east1 \
--allow-unauthenticated \
--project ivory-lotus-464821-f4


