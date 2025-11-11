# AWS Network Visibility Dashboard

**ステータス**: 🚧 準備中（2025年11月〜開発予定）

## 👤 About / このプロジェクトについて

**Author**: mr110825
**Purpose**: 2026年8月AWS・クラウドエンジニア転職に向けたポートフォリオプロジェクト

### プロジェクトの背景

ネットワーク監視業務の経験から、AWSインフラのトラフィック可視化の重要性を実感。
VPC Flow Logsを活用した自動化ツールを構築することで、以下を目指す：

- AWSネットワーク設計・構築スキルの実証
- Terraform/IaCによるインフラコード化の実践
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

- **AWS Services**: VPC Flow Logs, CloudWatch, Lambda, S3, Athena, QuickSight
- **IaC**: Terraform
- **Language**: Python (Lambda functions)
- **Network**: VPC, Transit Gateway, Security Group analysis

## 🎯 実装予定機能

- [ ] VPC Flow LogsのS3保存とAthenaクエリ環境構築
- [ ] Lambda関数によるログ分析自動化
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
├── terraform/           # Terraformインフラコード
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
