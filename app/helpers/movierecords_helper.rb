module MovierecordsHelper
  def getPercent(number)
    return 0 unless number.present?

    calPercent = number / 5.to_f * 100
    percent = calPercent.round
    # ↑CSSは小数が含まれると、widthの幅を指定できないので四捨五入して整数化
    percent.to_s
  end
end
