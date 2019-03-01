module ApplicationHelper

  #
  # full_title メソッド
  # タイトルを返す．
  #
  def full_title(message='')
    if message.empty?
      "FMU"
    else
      "#{message} | FMU"
    end
  end

end
