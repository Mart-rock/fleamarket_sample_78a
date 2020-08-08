class Condition < ActiveHash::Base
  self.data = [
    {id: 0, name: '選択して下さい'}, {id: 1, name: '新品、未使用'}, {id: 2, name: '目立った汚れ傷なし'}, {id: 3, name: '傷や汚れ有り'}, {id: 4, name: '全体的に状態が悪い'}
]
end
