module Tivo::Hooks
  def without_tivo
    Tivo::Config.disable!
    begin
      yield
    ensure
      Tivo::Config.enable!
    end
  end
end
