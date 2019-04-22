require 'csv'
require 'byebug'
require 'tty-table'
csv = CSV.read(ARGV[0], headers: true)
# Q1: 流浪狗(intake_type)以何種品種(breed)居多？何種顏色(color)居多？

# 塞選
data_csv = csv.select{|row| row['intake_type']=="Stray" }

# 分類
data_hash = data_csv.group_by{|row| row["color"]}

data_array = data_hash.map{|col| [col[0], col[1].count]}

# 排序
table = TTY::Table.new ['顏色','數量'], data_array.sort_by{|key, value| value}.reverse

# 印出
puts table.render(:ascii)
