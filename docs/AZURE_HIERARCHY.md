# Azure の階層構造とリソース管理

このドキュメントでは、Azure における階層構造（テナント、サブスクリプション、リソースグループ）の概念と、それぞれの役割について説明します。

## 階層構造の全体像

Azure のリソースは、以下のような階層構造で管理されています：

```
テナント（組織）
 │
 ├── 管理グループ（オプション）
 │    │
 │    └── サブスクリプション（課金単位）
 │         │
 │         └── リソースグループ（リソースコンテナ）
 │              │
 │              └── リソース（VM、Storage、CosmosDB など）
 │
 └── Azure Active Directory（ユーザー、グループ、アプリ登録）
```

## 1. テナント (Tenant)

### 概念

**テナント**は、Azure Active Directory（Microsoft Entra ID）のインスタンスであり、組織全体を表す最上位の概念です。

### 特徴

- **一意の識別子**: テナント ID（GUID形式）
- **スコープ**: 組織全体
- **数**: 通常、1つの組織に1つのテナント
- **含むもの**:
  - ユーザーアカウント
  - グループ
  - アプリケーション登録（Service Principal など）
  - すべてのサブスクリプション

### 例

```
テナント名: tatsukoni.onmicrosoft.com
テナントID: 3f945a12-de9d-45b7-8adb-5db61490eec4
```

### 確認方法

```bash
# テナント情報を確認
az account show --query tenantId -o tsv

# テナントの詳細を表示
az account tenant list -o table
```

### 実世界の例え

**テナント = 会社全体**

- 会社の名簿（ユーザー）
- 部署（グループ）
- 社内システムのアプリケーション

## 2. サブスクリプション (Subscription)

### 概念

**サブスクリプション**は、Azure サービスの利用契約であり、**課金の単位**です。

### 特徴

- **一意の識別子**: サブスクリプション ID（GUID形式）
- **スコープ**: テナント配下
- **数**: 1つのテナントに複数のサブスクリプションを持つことができる
- **用途**:
  - コスト管理（課金の分離）
  - リソースのグループ化
  - 権限の分離
  - 利用制限の設定

### 例

```
サブスクリプション名: Pay-As-You-Go
サブスクリプションID: ba29533e-1e4c-43a8-898a-a5815e9b577b
```

### サブスクリプションの分け方の例

**パターン1: 環境別**

```
テナント（会社全体）
 ├── 開発用サブスクリプション
 ├── ステージング用サブスクリプション
 └── 本番用サブスクリプション
```

**パターン2: プロジェクト別**

```
テナント（会社全体）
 ├── プロジェクトAサブスクリプション
 ├── プロジェクトBサブスクリプション
 └── プロジェクトCサブスクリプション
```

**パターン3: 部署別**

```
テナント（会社全体）
 ├── 開発部サブスクリプション
 ├── マーケティング部サブスクリプション
 └── 情報システム部サブスクリプション
```

### 確認方法

```bash
# 現在のサブスクリプションを確認
az account show

# すべてのサブスクリプションを一覧表示
az account list -o table

# サブスクリプションを切り替え
az account set --subscription "ba29533e-1e4c-43a8-898a-a5815e9b577b"
```

### 実世界の例え

**サブスクリプション = 部門ごとのクレジットカード**

- 開発部のクレジットカード（開発用サブスクリプション）
- 本番環境のクレジットカード（本番用サブスクリプション）
- それぞれの利用明細が分かれている

## 3. リソースグループ (Resource Group)

### 概念

**リソースグループ**は、関連する Azure リソースをまとめて管理するためのコンテナです。

### 特徴

- **一意の識別子**: リソースグループ名（サブスクリプション内でユニーク）
- **スコープ**: サブスクリプション配下
- **数**: 1つのサブスクリプションに複数のリソースグループを持つことができる
- **用途**:
  - 関連リソースのグループ化
  - ライフサイクル管理（一括削除など）
  - アクセス制御（RBAC）
  - タグ付けとコスト追跡

### 特性

- **地理的な位置**: リソースグループ自体にリージョンが設定される
- **リソースの配置**: リソースグループとは異なるリージョンにリソースを配置可能
- **移動**: リソースは別のリソースグループに移動可能
- **削除**: リソースグループを削除すると、配下のすべてのリソースが削除される

### 例

```
サブスクリプション: ba29533e-1e4c-43a8-898a-a5815e9b577b
 ├── リソースグループ: rg-tatsukoni-dev
 ├── リソースグループ: rg-tatsukoni-test
 └── リソースグループ: rg-tatsukoni-prd
```

### リソースグループの設計パターン

**パターン1: 環境別**

```
rg-myapp-dev    # 開発環境のすべてのリソース
rg-myapp-test   # テスト環境のすべてのリソース
rg-myapp-prd    # 本番環境のすべてのリソース
```

**パターン2: サービス別**

```
rg-myapp-frontend   # フロントエンドリソース
rg-myapp-backend    # バックエンドリソース
rg-myapp-database   # データベースリソース
```

**パターン3: ライフサイクル別**

```
rg-myapp-permanent     # 永続的なリソース（データベース、ストレージ）
rg-myapp-temporary     # 一時的なリソース（テスト用VM）
```

### 確認方法

```bash
# リソースグループ一覧を表示
az group list -o table

# 特定のリソースグループの詳細
az group show --name rg-tatsukoni-dev

# リソースグループ内のリソース一覧
az resource list --resource-group rg-tatsukoni-dev -o table
```

### 実世界の例え

**リソースグループ = プロジェクトフォルダ**

- 関連するファイルをまとめて管理
- フォルダごと削除できる
- フォルダごとにアクセス権限を設定

## 4. リソース (Resource)

### 概念

**リソース**は、Azure で作成・管理する実際のサービスやインフラストラクチャです。

### 特徴

- **一意の識別子**: リソース ID（完全修飾パス）
- **スコープ**: リソースグループ配下
- **種類**: 100種類以上のサービス
  - 仮想マシン（VM）
  - ストレージアカウント
  - Cosmos DB
  - App Service
  - Virtual Network など

### リソース ID の例

```
/subscriptions/ba29533e-1e4c-43a8-898a-a5815e9b577b/
  resourceGroups/rg-tatsukoni-dev/
  providers/Microsoft.DocumentDB/
  databaseAccounts/tatsukoni-test-dev
```

### 確認方法

```bash
# リソース一覧を表示
az resource list -o table

# 特定のリソースグループ内のリソース
az resource list --resource-group rg-tatsukoni-dev -o table

# 特定のリソースの詳細
az resource show --ids "/subscriptions/.../resourceGroups/.../providers/..."
```

## このプロジェクトでの階層構造

### 現在の構成

```
テナント: tatsukoni
テナントID: 3f945a12-de9d-45b7-8adb-5db61490eec4
 │
 └── サブスクリプション: Pay-As-You-Go
     サブスクリプションID: ba29533e-1e4c-43a8-898a-a5815e9b577b
      │
      ├── リソースグループ: rg-tatsukoni-dev (japaneast)
      │    ├── ストレージアカウント: sttatsukonidevtfstate
      │    ├── VNet: vnet-tatsukoni-dev
      │    ├── Cosmos DB: tatsukoni-test-dev
      │    │    └── データベース: TestDatabase
      │    │         ├── コンテナ: TestContainerApp
      │    │         └── コンテナ: TestContainerFront
      │    └── Cosmos DB: tatsukoni-feat-dev
      │         └── データベース: FeatDatabase
      │              ├── コンテナ: FeatContainerApp
      │              └── コンテナ: FeatContainerFront
      │
      └── リソースグループ: rg-tatsukoni-prd (japaneast)
           ├── ストレージアカウント: sttatsukoniprdtfstate
           ├── VNet: vnet-tatsukoni-prd
           ├── Cosmos DB: tatsukoni-test-prd
           │    └── データベース: TestDatabase
           │         ├── コンテナ: TestContainerApp
           │         └── コンテナ: TestContainerFront
           └── Cosmos DB: tatsukoni-feat-prd
                └── データベース: FeatDatabase
                     ├── コンテナ: FeatContainerApp
                     └── コンテナ: FeatContainerFront
```

## 管理グループ (Management Groups) - オプション

大規模な組織では、サブスクリプションをさらにグループ化する**管理グループ**を使用できます。

```
ルート管理グループ
 │
 ├── 管理グループ: 開発環境
 │    ├── サブスクリプション: dev-project-a
 │    └── サブスクリプション: dev-project-b
 │
 └── 管理グループ: 本番環境
      ├── サブスクリプション: prd-project-a
      └── サブスクリプション: prd-project-b
```

### 用途

- ポリシーの一括適用
- アクセス制御の階層的な管理
- コストの集計

**注**: 小規模プロジェクトでは通常使用しません。

## 識別子とスコープの整理

| レベル | 識別子の種類 | スコープ | 例 |
| --- | --- | --- | --- |
| テナント | テナント ID | グローバル | `3f945a12-de9d-45b7-8adb-5db61490eec4` |
| サブスクリプション | サブスクリプション ID | テナント内 | `ba29533e-1e4c-43a8-898a-a5815e9b577b` |
| リソースグループ | リソースグループ名 | サブスクリプション内 | `rg-tatsukoni-dev` |
| リソース | リソース名 | リソースグループ内 | `tatsukoni-test-dev` |

## Terraform での表現

Terraform でリソースを作成する際、これらの階層を意識する必要があります。

```hcl
# サブスクリプションはプロバイダーで指定
provider "azurerm" {
  subscription_id = "ba29533e-1e4c-43a8-898a-a5815e9b577b"
  tenant_id       = "3f945a12-de9d-45b7-8adb-5db61490eec4"
}

# リソースグループを参照
data "azurerm_resource_group" "example" {
  name = "rg-tatsukoni-dev"
}

# リソースを作成（リソースグループを指定）
resource "azurerm_cosmosdb_account" "example" {
  name                = "tatsukoni-test-dev"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  # ...
}
```

## ベストプラクティス

### リソースグループの設計

1. **関連リソースをまとめる**: 同じライフサイクルのリソースを同じリソースグループに配置
2. **環境ごとに分離**: dev/test/prd で異なるリソースグループを使用
3. **命名規則を統一**: `rg-{service}-{environment}` など
4. **タグを活用**: コスト管理やリソース検索のためにタグを付ける

### サブスクリプションの設計

1. **課金を分離したい場合**: 環境やプロジェクトごとに別サブスクリプション
2. **権限を厳密に分離したい場合**: 本番環境は別サブスクリプション
3. **小規模プロジェクト**: 1つのサブスクリプション内でリソースグループで分離

### セキュリティ

1. **最小権限の原則**: 必要最小限の権限のみを付与
2. **リソースグループレベルでRBACを設定**: きめ細かいアクセス制御
3. **Service Principal の権限スコープ**: リソースグループ単位で権限を付与

## 参考コマンド集

```bash
# テナント情報
az account show --query tenantId -o tsv

# サブスクリプション一覧
az account list -o table

# サブスクリプション切り替え
az account set --subscription "ba29533e-1e4c-43a8-898a-a5815e9b577b"

# リソースグループ一覧
az group list -o table

# リソースグループ作成
az group create --name rg-myapp-dev --location japaneast

# リソース一覧（リソースグループ内）
az resource list --resource-group rg-tatsukoni-dev -o table

# リソースの完全パス（リソースID）を表示
az resource list --query "[].id" -o tsv
```

## まとめ

| 概念 | 役割 | 例え |
| --- | --- | --- |
| **テナント** | 組織全体 | 会社 |
| **サブスクリプション** | 課金単位 | 部門のクレジットカード |
| **リソースグループ** | リソースコンテナ | プロジェクトフォルダ |
| **リソース** | 実際のサービス | ファイル |

この階層構造を理解することで、Azure リソースの整理、コスト管理、アクセス制御を効果的に行うことができます。
