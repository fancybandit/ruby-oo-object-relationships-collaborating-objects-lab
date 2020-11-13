
class MP3Importer

    attr_accessor :path

    def initialize(path)
        self.path = path
    end

    def files
        file_list = []
        Dir.each_child(self.path) {|file_name| file_list << file_name}
        file_list
    end

    def import
        self.files.each do |file_name|
            Song.new_by_filename(file_name)
        end
    end
end

