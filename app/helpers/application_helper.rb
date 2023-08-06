module ApplicationHelper
  def logged_in?
      session[:user_id].present?
  end

  def page_title(page_title = '')
    base_title = 'My Cinema Record'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def default_meta_tags
    {
      site: 'MyCinemaRecord',
      title: '見た映画を記録＆ツイートできるサービス',
      reverse: true,
      charset: 'utf-8',
      description: '',
      keywords: '映画,レビュー,感想,Twitterシェア,記録,',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@r_RUNTEQ37', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
