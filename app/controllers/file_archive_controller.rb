require 'zip'
class FileArchiveController < ApplicationController
  def index
  end

  def zipping
    folder = "#{Rails.root}/public"
    input_filenames = ['404.html']

    zipfile_name = "#{Rails.root}/archive.zip"

    FileUtils.rm_r(zipfile_name) if FileTest.exist?(zipfile_name)

    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
        # Two arguments:
        # - The name of the file as it will appear in the archive
        # - The original file, including the path to find it
        zipfile.add(filename, folder + '/' + filename)
      end
    end

    redirect_to :back
  end
end
