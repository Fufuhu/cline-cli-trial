開発用 Docker Compose 環境

目的
- このリポジトリの FastAPI アプリを Docker Compose で開発起動できるようにする。
- ホストのコード変更がコンテナ内で反映される（uvicorn の --reload を利用）。

用意したファイル
- Dockerfile
- docker-compose.yml
- requirements.txt
- .dockerignore

起動手順

1. イメージビルドしてコンテナを起動（バックグラウンド）

```bash
docker compose up --build -d
```

2. ログを確認する

```bash
docker compose logs -f app
```

3. コンテナに入る（必要時）

```bash
docker compose exec app sh
```

開発時の注意
- ホストのプロジェクトをコンテナにバインドマウントしているため、コード変更はコンテナ内で即座に反映されるはずです。
- 依存を追加・更新した場合は `requirements.txt` を更新した上で再ビルドが必要です。

ポート
- アプリは http://localhost:8000 で確認できます（デフォルト）。

本番環境
- `--reload` は開発専用です。本番用の Dockerfile / compose 設定は別途作成してください。

