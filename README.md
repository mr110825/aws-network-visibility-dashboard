# AWS Network Visibility Dashboard

**ステータス**: 🚧 準備中（2025年11月〜開発予定）

## 👤 About / このプロジェクトについて

### プロジェクトの目的

ネットワーク監視業務の経験から、AWSインフラのトラフィック可視化の重要性を実感。
本プロジェクトでは、VPC Flow Logsを活用した自動化ツールを構築することで、
以下のスキルの実証と実践を目指す：

- AWSネットワーク設計・構築スキル
- Terraform/IaCによるインフラコード化
- セキュリティ監視の自動化とコスト最適化

### なぜこの技術スタックか

- **VPC Flow Logs**: AWSネットワーク監視の標準的なアプローチ
- **Athena**: S3データを直接SQLクエリ可能（サーバーレス、コスト効率的）
- **QuickSight**: AWS統合が容易で、リアルタイムダッシュボード構築に最適
- **Terraform**: 再現性の高いインフラ管理、GitOpsワークフローの実践

## 📋 プロジェクト概要

AWS VPC Flow LogsとAthena、QuickSightを活用したネットワーク監視・可視化ダッシュボード。
ネットワークトラフィックの可視化、異常検知、Security Group分析を自動化し、
AWSインフラの運用効率を向上させるツールを目指す。

## 🛠 技術スタック（予定）

### 監視対象（幅広さ）
- **VPC**: Virtual Private Cloud, Subnets, Route Tables, NAT Gateway
- **EC2**: Webサーバー（Nginx）
- **ALB**: Application Load Balancer
- **RDS**: (オプション、予算次第で省略可)

### 監視基盤（専門性）
- **VPC Flow Logs**: トラフィック収集
- **S3**: ログ保存
- **Athena**: ログ分析（SQLクエリ）
- **QuickSight**: 可視化ダッシュボード
- **CloudWatch**: アラート・監視
- **Lambda**: ログ分析自動化（Python）

### IaC
- **Terraform**: 全インフラのコード化

## 🎯 実装予定機能

### フェーズ1: Webアプリケーション環境構築
- [ ] VPC/サブネット/ルートテーブル構築
- [ ] EC2インスタンス構築（Nginx Webサーバー）
- [ ] ALB（Application Load Balancer）構築
- [ ] セキュリティグループ設計

### フェーズ2: 監視基盤構築
- [ ] VPC Flow LogsのS3保存設定
- [ ] Athenaクエリ環境構築（トラフィック分析）
- [ ] Lambda関数によるログ分析自動化

### フェーズ3: 可視化・アラート
- [ ] QuickSightダッシュボードでのトラフィック可視化
- [ ] 異常トラフィック検知とCloudWatch Alarms連携
- [ ] Security Group設定の可視化と不要ルール検出

## 📅 開発スケジュール

- **準備期間**: 2025年11月〜12月（基盤整備・技術検証）
- **開発期間**: 2026年1月〜2月（実装・テスト）
- **目標**: 2026年2月末までに完成

## 📁 プロジェクト構成（予定）

```
aws-network-visibility-dashboard/
├── terraform/
│   ├── network/         # VPC, Subnets, Route Tables, NAT Gateway
│   ├── compute/         # EC2, ALB, Security Groups
│   └── monitoring/      # VPC Flow Logs, S3, Athena, QuickSight, CloudWatch
├── lambda/              # Lambda関数（Python）
├── docs/                # ドキュメント・アーキテクチャ図
└── README.md
```

## 📚 参考資料

- [AWS VPC Flow Logs Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html)
- [AWS Athena Documentation](https://docs.aws.amazon.com/athena/)
- [AWS QuickSight Documentation](https://docs.aws.amazon.com/quicksight/)

---

**Last Updated**: 2025-11-12
