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

-- ワイルドカード検索
-- select * from users where last_name like "中%";
-- 例："中%" 中で始まる文字列
--    "%中%" 中を含む文字列
--    "__中" 二文字＋中で終わる文字列

-- limit
select * from products limit 0,10; -- (1から10までではなく、0から10こ)


-- ★まとめ
select id,last_name from users where gender = 1 limit 1000;

-- 合計値を求めるSQL
select
  sum(amount)
from
  orders
where
 order_time >= "2017-01-01 00:00:00"
  and order_time < "2017-02-01 00:00:00";


-- 平均値
select
  avg(price)
from
  products;

-- 最小値
select
  min(price)
from
  products;

-- 最大値
select
  max(price)
from
  products;

-- DBにnullがあると、値がないけど平均に0として含まれてしまう

-- 数を数える

select
  count(*)
from
  users
where
 gender = 1;


-- ユニーク数の求め方
select
  count(distinct user_id)
from
  access_logs
where
 request_month = "2017-01-01" ;

 -- 指定のグループ化

 select
  prefecture_id, count(*)
from
  users
group by
 prefecture_id;

-- 応用
select
  request_month, count(distinct user_id) -- 二つを出してください
from
  access_logs -- から
where
 request_month >= "2017-01-01" and request_month < "2018-02-01" -- 期間
group by
 request_month;  -- グルーピング
having
 count(distinct user_id) >= 630;

-- sort 高い順
select *
from products
order by price desc,id asc;

-- null計算
10 + null -- nullとなる

-- 絶対値
select abs(-10);

-- 四捨五入
round(10.1111,2) -- 数字、桁数

-- 文字列の結合
select
 concat
(last_name, " ", first_name,"さん")
from
 users;


-- 日付

select current_date
();
select current_timestamp
();
select current_date
()+3;
select current_time
() + interval 6 hour;
select *
from orders
where extract(year_month from order_time) = 201701;
