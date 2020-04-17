class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: '食費'},{id: 2, name: '日用品'}, {id: 3, name: '趣味'}, {id: 4, name: '交際費'},{id: 5, name: '交通費'}, 
    {id: 6, name: '被服費'}, {id: 7, name: '医療費'},  {id: 8, name: '車関連費'}, {id: 9, name: '教育費'}, {id: 10, name: '水道光熱費'},
    {id: 11, name: '通信費'}, {id: 12, name: '居住費'}, {id: 13, name: '税金'},{id: 14, name: '保険料'}, {id: 15, name: 'その他支出'},
    {id: 16, name: '給料'}, {id: 17, name: 'ボーナス'}, {id: 18, name: '一時所得'},{id: 19, name: '事業所得'}, {id: 20, name: '年金'},
    {id: 21, name: '配当所得'},{id: 22, name: '不動産所得'}, {id: 23, name: 'その他所得'}
  ]
end