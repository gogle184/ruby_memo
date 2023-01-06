require "csv"# CSVファイルを扱うためのライブラリを読み込んでいます
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
input_number = memo_type

if input_number == 1
  puts "拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp
  
  puts "メモの内容を記入してください。Ctrl+Dで保存します。"
  input_memo = STDIN.read
  memo = input_memo.chomp
  
  CSV.open("#{file_name}.csv","w") do |csv|
  csv << ["#{memo}"]
  puts memo
end

elsif input_number == 2
  puts "ファイル名を拡張子を除いて入力してください。"
  file_name = gets.chomp
  
  puts "内容を記入してください。Ctrl+Dで保存します。"
  edit_memo = STDIN.read
  memo = edit_memo.chomp
  
  CSV.open("#{file_name}.csv","a") do |csv|
  csv << ["#{memo}"]
  puts memo
 end

else
  puts "1か2の数字を入力してください"
end