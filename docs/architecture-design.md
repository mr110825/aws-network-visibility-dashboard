# AWS Network Visibility Dashboard - アーキテクチャ設計

## 概要

VPC Flow LogsとAthena、QuickSightを活用したネットワーク監視・可視化ダッシュボード

## ネットワーク設計

### VPC CIDR
- **VPC CIDR**: 10.0.0.0/16
- **リージョン**: ap-northeast-1（東京）

### サブネット設計

| 種類 | CIDR | AZ | 用途 |
|------|------|----|----|
| Public Subnet 1 | 10.0.1.0/24 | ap-northeast-1a | ALB |
| Public Subnet 2 | 10.0.2.0/24 | ap-northeast-1c | ALB |
| Private Subnet 1 | 10.0.10.0/24 | ap-northeast-1a | EC2 (Web) |
| Private Subnet 2 | 10.0.20.0/24 | ap-northeast-1c | EC2 (Web) |

### セキュリティグループ設計

**ALB Security Group**:
- Inbound: HTTP (80), HTTPS (443) from 0.0.0.0/0
- Outbound: All traffic

**EC2 Security Group**:
- Inbound: HTTP (80) from ALB SG only
- Outbound: All traffic

## データフロー

```
Internet → ALB → EC2 (Nginx)
                  ↓
            VPC Flow Logs
                  ↓
            S3 Bucket
                  ↓
              Athena
                  ↓
            QuickSight
```

## コンポーネント一覧

### ネットワーク層
- VPC (10.0.0.0/16)
- Internet Gateway
- NAT Gateway × 2（各AZ）
- Route Tables

### コンピューティング層
- ALB (Application Load Balancer)
- EC2 × 2台 (Amazon Linux 2 + Nginx)

### 監視層
- VPC Flow Logs (ALL traffic → S3)
- CloudWatch Logs
- CloudWatch Alarms
- Lambda (Flow Logs分析)
- Athena (ログクエリ)
- QuickSight (ダッシュボード)

### ストレージ
- S3 Bucket (Flow Logsストレージ)
- S3 Bucket (Athenaクエリ結果)

## 監視項目

1. **トラフィック分析**
   - トップ送信元IPアドレス
   - トップ宛先IPアドレス
   - ポート別トラフィック分布

2. **セキュリティ分析**
   - 拒否されたトラフィック
   - 不審な通信パターン
   - Security Group設定の可視化

3. **コスト分析**
   - データ転送量
   - NAT Gateway使用量

## 実装フェーズ

### Phase 1: VPC基盤構築（Week 0-2, 0-3）
- VPC、サブネット、IGW、NAT Gateway
- VPC Flow Logs設定
- S3バケット作成

### Phase 2: コンピューティング構築（Week 0-4）
- ALB構築
- EC2構築（Nginx）
- セキュリティグループ設定

### Phase 3: 監視基盤構築（Week 0-4, 0-5）
- Athenaテーブル作成
- Lambda関数実装
- CloudWatch Alarms設定

### Phase 4: ダッシュボード構築（Week 0-6, Week 1）
- QuickSight環境構築
- ダッシュボード作成
- 異常検知アラート

## コスト見積もり

**月額想定コスト: 約2,500円**

| サービス | 月額コスト |
|---------|-----------|
| EC2 (t3.micro × 2) | 約1,200円 |
| ALB | 約600円 |
| NAT Gateway | 約400円 |
| S3 (Flow Logs) | 約100円 |
| VPC Flow Logs | 約100円 |
| Athena | 約50円 |
| QuickSight | 無料枠内 |

**合計**: 約2,450円/月
**3ヶ月運用**: 約7,500円

## 参考資料

- [AWS VPC Flow Logs Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html)
- [AWS Athena Documentation](https://docs.aws.amazon.com/athena/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
