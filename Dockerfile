FROM python:3.13-slim

# 作業ディレクトリ
WORKDIR /app

ENV PYTHONUNBUFFERED=1

# 最小限のビルドツール（必要に応じて）
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

# 依存だけ先にコピーしてインストール（キャッシュ活用）
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# ソースは開発ではボリュームで上書きされるが、ビルド時にもコピーしておく
COPY . /app

EXPOSE 8000

# 開発向け: --reload と --reload-dir でソース変更を監視
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload", "--reload-dir", "/app"]

