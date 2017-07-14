class RedactorRails::Picture < RedactorRails::Asset
  mount_uploader :data, RedactorRails::PictureUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end
end
