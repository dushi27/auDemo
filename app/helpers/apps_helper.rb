module AppsHelper
  def link(url)
    video_id = url.split("=").last
    link = "//www.youtube.com/embed/#{video_id}"
  end
end
