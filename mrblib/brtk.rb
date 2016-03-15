class Brtk
  def initialize(uri = nil)
    @widgets = {}
    Gtk.init
    MainWindow.new(self)
    @widgets[WebRenderer].open uri if uri
  end

  def main
    Gtk.main
  end

  def []=(klass, widget)
    @widgets[klass] = widget
  end

  class << self
    def run(uri = nil)
      new(uri).main
    rescue Exception => e
      p e
    end
  end
end
