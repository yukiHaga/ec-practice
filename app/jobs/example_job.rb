class ExampleJob < ApplicationJob
  # デフォルトキューを使用する
  queue_as :default

  def perform(how_hard = "super hard", how_long = 1)
    sleep how_long
    puts "HOGE Workin' #{how_hard}"
  end
end
