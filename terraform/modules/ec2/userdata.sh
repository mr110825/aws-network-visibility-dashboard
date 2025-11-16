#!/bin/bash
set -e

# ログ出力
exec > >(tee /var/log/user-data.log)
exec 2>&1

echo "=== Starting userdata script ==="
date

# システムアップデート
echo "=== System update ==="
dnf update -y

# Nginxインストール
echo "=== Installing Nginx ==="
dnf install -y nginx

# Nginxサービス起動・自動起動設定
echo "=== Starting Nginx ==="
systemctl start nginx
systemctl enable nginx

# シンプルなHTMLページ作成
echo "=== Creating HTML page ==="
cat > /usr/share/nginx/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AWS Network Visibility Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #232f3e;
        }
        .status {
            color: #28a745;
            font-weight: bold;
        }
        .info {
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-left: 4px solid #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>AWS Network Visibility Dashboard</h1>
        <p class="status">✓ Nginx is running successfully!</p>

        <div class="info">
            <h2>Instance Information</h2>
            <p><strong>Hostname:</strong> <span id="hostname"></span></p>
            <p><strong>Private IP:</strong> <span id="private-ip"></span></p>
        </div>

        <p style="margin-top: 20px; color: #6c757d; font-size: 14px;">
            Powered by Amazon Linux 2023 + Nginx + Terraform
        </p>
    </div>

    <script>
        // ホスト名とIPアドレスを表示
        fetch('/info.json')
            .then(response => response.json())
            .then(data => {
                document.getElementById('hostname').textContent = data.hostname;
                document.getElementById('private-ip').textContent = data.private_ip;
            })
            .catch(() => {
                document.getElementById('hostname').textContent = 'N/A';
                document.getElementById('private-ip').textContent = 'N/A';
            });
    </script>
</body>
</html>
EOF

# インスタンス情報のJSON作成（オプション）
echo "=== Creating instance info JSON ==="
PRIVATE_IP=$(hostname -I | awk '{print $1}')
HOSTNAME=$(hostname)

cat > /usr/share/nginx/html/info.json << EOF
{
    "hostname": "$HOSTNAME",
    "private_ip": "$PRIVATE_IP"
}
EOF

# Nginx設定確認
echo "=== Nginx configuration test ==="
nginx -t

echo "=== Userdata script completed ==="
date