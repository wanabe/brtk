class Brtk
  def initialize(uri = nil)
    Gtk.init
    MainWindow.new(uri)
  end

  def main
    Gtk.main
  end

  class << self
    def run(uri = nil)
      new(uri).main
    rescue Exception => e
      p e
    end
  end
end
