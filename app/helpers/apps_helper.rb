module AppsHelper
  def screen(url)
    video_id = url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{video_id}")
  end
end
