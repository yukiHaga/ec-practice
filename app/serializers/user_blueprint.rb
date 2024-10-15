class UserBlueprint < Blueprinter::Base
  # 識別子として使われるフィールドは、fieldsではなくて、identifierを使って定義する。
  # 識別子は常にレンダリングされる。そしてレンダリング時は常に他のフィールドよりも先にソートされる
  identifier :id

  # nameオプションでjsonキーを変えられる
  field :email, name: :login_email

  # fieldは個別にフィールドを定義したい時に使って、fieldsはまとめてフィールドを定義したい時に使う
  fields :first_name, :last_name

  # associtionの場合、blueprintオプションを指定しないとうまく動かなかった
  association :products, blueprint: ProductBlueprint

  # viewを使うことで、コンテキストに応じた値を出力できるようになる
  view :normal do
    field :created_at
  end

  view :full do
    include_view :normal
    field :updated_at
    # 特定のviewで特定のフィールドを除外できる。excludesでまとめて除外することもできる
    exclude :last_name

    # 動的にフィールドを定義できる
    field :full_name do |user|
      "#{user.first_name} #{user.last_name}"
    end
  end
end
