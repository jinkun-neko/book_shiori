class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  #nclude CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 全部の形式をjpgにすることで、全ての形式に対応できる。
  process :convert => 'jpg'

  process resize_to_fill: [240, 376, "Center"]

  version :thumb250 do
    process resize_to_fit: [250, 250]
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default(*args)
    "cats240.jpg"
    "cats_icon.png"
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
