-- mysql -u root -p
-- mysql -u ユーザー名を指定、今回は管理者、-p:パスワード付き
-- mysql.server stop ローカルなら停止しておく

-- ユーザー一覧を取得
use mydb;
select * from users;
