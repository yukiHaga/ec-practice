# jbuilderではjsonに対してkey: valueをセットしていく。
# キー付きで配列で出力したい場合
# usersをキー, valueがArray<User>のjsonを出力してくれる
json.users @users, :created_at

json.customers @users do |user|
  json.full_name "#{user.first_name} #{user.last_name}#"
end

if @users.length === 3
  json.user_counts @users.length
end

# key, valueを動的に定義したいなら、set!を使う
json.set! :admin_user do
  json.set! :name, @users.first.first_name
  json.set! :created_at, @users.first.created_at
end
