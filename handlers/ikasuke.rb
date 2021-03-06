module Ruboty
  module Handlers
    class Ikasuke < Base
      on /brand (?<brand_name>.*?)\z/, name: 'brand', description: 'ブランド毎に付きやすい/付きにくいギア出力', all: true
      on /gpower (?<gpower_name>.*?)\z/, name: 'gpower', description: 'ギア名から付きやすいブランドを出力', all: true

      # ブランド名からギア詳細出力
      def brand(message)
        # 入力が"list"の時
        if message[:brand_name] == "list"
          Ruboty::Actions::Ikasuke.brand_list(message)
        # 入力がブランド名の時
        else
          Ruboty::Actions::Ikasuke.brand(message)
        end
      end

      # ギア名からブランド名出力
      def gpower(message)
        if message[:gpower_name] == "list"
          Ruboty::Actions::Ikasuke.gearpower_list(message)
        else
          Ruboty::Actions::Ikasuke.gearpower(message)
        end
      end
    end
  end
end
