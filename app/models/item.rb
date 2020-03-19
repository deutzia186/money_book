class Item < ActiveHash::Base
  self.data = [
      {id: 1, name: '給料'}, {id: 2, name: 'ボーナス'}, {id: 3, name: '一時所得'},
      {id: 4, name: '事業所得'}, {id: 5, name: '年金'}, {id: 6, name: '配当所得'},
      {id: 7, name: '不動産所得'}, {id: 8, name: 'その他所得'}, {id: 9, name: '食費'},
      {id: 10, name: '日用品'}, {id: 11, name: '趣味'}, {id: 12, name: '交際費'},
      {id: 13, name: '交通費'}, {id: 14, name: '被服費'}, {id: 15, name: '医療費'},
      {id: 16, name: '車関連費'}, {id: 17, name: '教育費'}, {id: 18, name: '水道光熱費'},
      {id: 19, name: '通信費'}, {id: 20, name: '居住費'}, {id: 21, name: '税金'},
      {id: 22, name: '保険料'}, {id: 23, name: 'その他支出'}
  ]
end