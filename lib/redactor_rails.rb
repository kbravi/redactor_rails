require "redactor_rails/engine"
require "redactor_rails/http"
require "redactor_rails/asset_base"
require "redactor_rails/uploader_base"
require "redactor_rails/version"
require 'carrierwave'

module RedactorRails
  IMAGE_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/pjpeg', 'image/tiff', 'image/x-png']

  FILE_TYPES = ['application/msword', 'application/pdf', 'text/plain', 'text/rtf', 'application/vnd.ms-excel']

  mattr_accessor :mount
  self.mount = true

  mattr_accessor :image_file_types, :document_file_types
  @@image_file_types = ["jpg", "jpeg", "png", "gif", "tiff"]
  @@document_file_types = ["pdf", "doc", "docx", "xls", "xlsx", "rtf", "txt"]

  def self.picture_model
    RedactorRails::Picture
  end

  def self.document_model
    RedactorRails::Document
  end
end
