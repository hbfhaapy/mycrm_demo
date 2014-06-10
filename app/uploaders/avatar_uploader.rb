# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
# AVATAR_UPLOADER_ALLOW_IMAGE_VERSION_NAMES = %(mini normal large)
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  
    "http://water-avatar.b0.upaiyun.com/user/avatar/default.png"
  end
  # # 覆盖 url 方法以适应“图片空间”的缩略图命名
  # def url(version_name = "")
  #   @url ||= super({})
  #   version_name = version_name.to_s
  #   return @url if version_name.blank?
  #   if not version_name.in?(AVATAR_UPLOADER_ALLOW_IMAGE_VERSION_NAMES)
  #     # 故意在调用了一个没有定义的“缩略图版本名称”的时候抛出异常，以便开发的时候能及时看到调错了
  #     raise "AvatarUploader version_name:#{version_name} not allow."
  #   end
  #   [@url,version_name].join("!") # 我这里在图片空间里面选用 ! 作为“间隔标志符”
  # end
  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  version :large do
    process :resize_to_fit => [120, 120]
  end
  version :normal do
    process :resize_to_fit => [80, 80]
  end
  version :mini do
    process :resize_to_fit => [50, 50]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  # def filename
  #   if super.present?
  #     model.uploader_secure_token ||= SecureRandom.uuid.gsub("-","")
  #     Rails.logger.debug("(BaseUploader.filename) #{model.uploader_secure_token}")
  #     "#{model.uploader_secure_token}.#{file.extension.downcase}"
  #   end
  # end
end
