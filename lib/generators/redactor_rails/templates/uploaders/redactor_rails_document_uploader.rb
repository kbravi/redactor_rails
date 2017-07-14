# encoding: utf-8
class RedactorRails::DocumentUploader < CarrierWave::Uploader::Base
  include RedactorRails::UploaderBase

  # storage :fog
  storage :file

  def store_dir
    "system/redactor_assets/documents/#{model.id}"
  end

  def extension_white_list
    RedactorRails.document_file_types
  end
end
