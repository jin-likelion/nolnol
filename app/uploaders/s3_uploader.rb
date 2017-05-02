class S3Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog
  process :resize_to_fill => [240, 180] ,:if => :horizontal?
  process :resize_to_fill => [240, 320]  ,:if => :vertical?
  process :resize_to_fill => [240, 240]  ,:if => :same?

   def horizontal?(new_file)
     image = MiniMagick::Image.open(self.file.file)
     true if image[:height] < image[:width]
   end

   def vertical?(new_file)
     image = MiniMagick::Image.open(self.file.file)
     true if image[:height] > image[:width]
   end
   def same?(new_file)
     image = MiniMagick::Image.open(self.file.file)
     true if image[:height] == image[:width]
   end
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  #Process files as they are uploaded:
  #process scale: [200, 200]
  #
  #def scale(width, height)
  #end
  #process :scale => [100, 10000]

  #def scale(width, height)
   # process! :resize_to_fit => [200, 200]
  #end
  # Create different versions of your uploaded files:
  #version :thumb do
     #process resize_to_fit: [300, 200]
  #end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
