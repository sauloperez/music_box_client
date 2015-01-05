module MusicBox
  module WithFiles

    def read(filename)
      file = File.open(filename)
      file.read
    end
  end
end
