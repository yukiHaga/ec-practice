class ProductBlueprint < Blueprinter::Base
  # 識別子として使われるフィールドは、fieldsではなくて、identifierを使って定義する。
  # 識別子は常にレンダリングされる。そしてレンダリング時は常に他のフィールドよりも先にソートされる
  identifier :id

  # nameオプションでjsonキーを変えられる
  field :name
end
