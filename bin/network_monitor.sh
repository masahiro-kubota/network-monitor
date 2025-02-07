#!/bin/bash

INFLUXDB_URL="http://localhost:8086"
INFLUXDB_ORG="my-org"  # InfluxDBの組織名（Web UI で確認）
INFLUXDB_BUCKET="network_speed"
INFLUXDB_TOKEN="XXXXXXXXX"  # ここに取得したAPIトークンを入れる
SPEEDTEST_CMD="/usr/bin/speedtest --server 14623"

# speedtest-cli がインストールされているか確認
if ! command -v speedtest &> /dev/null; then
    echo "speedtest-cli がインストールされていません。インストールしてください。"
    exit 1
fi

while true; do
    TIMESTAMP=$(date +%s%N)  # ナノ秒単位のタイムスタンプ
    SPEED_RESULT=$($SPEEDTEST_CMD --json 2>/dev/null)

    DOWNLOAD=$(echo "$SPEED_RESULT" | jq .download)
    UPLOAD=$(echo "$SPEED_RESULT" | jq .upload)
    PING=$(echo "$SPEED_RESULT" | jq .ping)
    
    # InfluxDB 2.x にデータを送信（バケット指定）
    curl -i -XPOST "$INFLUXDB_URL/api/v2/write?org=$INFLUXDB_ORG&bucket=$INFLUXDB_BUCKET&precision=ns" \
        --header "Authorization: Token $INFLUXDB_TOKEN" \
        --header "Content-Type: text/plain; charset=utf-8" \
        --data-binary "network_speed,server=14623 download=$DOWNLOAD,upload=$UPLOAD,ping=$PING $TIMESTAMP"

    sleep 300  # 5分ごとに測定
done

