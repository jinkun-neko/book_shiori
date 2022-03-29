module PagesHelper

#iにpages,eにnow_pages
  def percent(i,e) 
    return ((e.to_f / i )*100).floor
  end

  def praise(i) 
      if  i == 100
          return "#{i}% は素晴らしい！よく読破しました！！" 
    elsif  i > 70
          return "#{i}% は少しですよ！！ラストスパートです" 
    elsif  i > 50
          return "#{i}% ですね！中盤まで来ました！！" 
      elsif  i > 30
        return  "#{i}% いいです！その調子です！" 
    elsif i > 20
        return"#{i}% はまだ序盤です！記録して読書を続けましょう！" 
      else 
        return "楽しく読書を続けましょう！！"
      end
  end
end