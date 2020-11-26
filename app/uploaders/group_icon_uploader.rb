class GroupIconUploader < CarrierWave::Uploader::Base
  if Rails.env == 'test'
    storage :file
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  else
    include Cloudinary::CarrierWave

    process convert: 'png'
    process tags: ['group_picture']

    version :standard do
      process resize_to_fill: [64, 64, :north]
    end

    version :thumbnail do
      resize_to_fit(64, 64)
    end

    CarrierWave.configure do |config|
      config.cache_storage = :file
    end
  end
end
