module Tivo::Hooks
  def without_tivo
    Tivo.disable!
    begin
      yield
    ensure
      Tivo.enable!
    end
  end
end
