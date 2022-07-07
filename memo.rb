require "csv"

puts "1(新規でメモを作成)2(既存のメモ編集する)"
 memo_type = gets.to_s
input_number = memo_type.chomp

puts "---------------------"

if input_number == "1"
    puts "新規でメモを作成します。拡張子を除いたファイル名を記入してください。"
    file_name = gets.chomp

    puts "---------------------"

    puts "メモしたい内容を記入してください。完了したらCtrl + Dを押してください。"
    content = $stdin.read

    puts "---------------------"

    CSV.open("#{file_name}.csv" , "w") do |csv|
    csv << [content]

   

    puts "#{file_name}ファイルに以下のメモをcsvファイルで保存しました。"
    puts "#{content}"

end


elsif input_number == "2"
    puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
    existing_file_name = gets.chomp

    puts "---------------------"
    puts "メモの内容を表示します。"
    data = CSV.read("#{existing_file_name}.csv")
    puts data
    puts "---------------------"
    puts "このメモに追記する内容を記入してください。完了したらCtrl + Dを押してください。"
    additional_content = $stdin.read

    puts "---------------------"
    CSV.open("#{existing_file_name}.csv" , "a") do |csv|
    csv << [additional_content]
    puts "#{existing_file_name}ファイルに以下のメモを追記して保存しました。"
    puts "#{additional_content}"
end


else
    puts "1か2を入力してください。"
end
