-- mysql -u root -p
-- mysql -u ユーザー名を指定、今回は管理者、-p:パスワード付き
-- mysql.server stop ローカルなら停止しておく

-- ユーザー一覧を取得
use mydb; -- 忘れること多い
select * from users; -- formのタイポ

-- エラーはコードが振られるので、調査に使う

/*
複数行コメント
*/
select id,last_name from users LIMIT 0, 1000;
-- 必要なデータの取得

-- 名前の変更
select name as 名前 ,price as 価格 from products;

-- 処理をして出力
select
 name as 名前,
 price as 価格,
 price * 1.08 as 税込価格
from 
 products;
