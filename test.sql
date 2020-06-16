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

-- 条件の指定
-- select from where 条件
select name from products where price >= 9800;

-- 演算子
select * from products where id = 1; -- = 1個でいい
select * from products where name = "あああ"; -- = しっかり囲む
select * from products where name <> "あああ"; -- = ではない != でもいい
select * from products where id = in(1,2,3); -- = もしくは、否定ならnot in

-- nullの場合is not nullの場合is not null
-- 範囲はbetween and
-- かつ、はand、またははor
