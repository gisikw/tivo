module Test::Unit
  class TestCase
    include Tivo::Hooks
  end

  class Runner
    # Overriding of MiniTest::Unit#puke
    def puke klass, meth, e
      # TODO:
      #   this overriding is for minitest feature that skip messages are
      #   hidden when not verbose (-v), note this is temporally.
      e = case e
          when Tivo::PendingRequestError then
            @skips += 1
            "Skipped:\n#{meth}(#{klass}) [#{location e}]:\n#{e.message}\n"
          when MiniTest::Skip then
            @skips += 1
            "Skipped:\n#{meth}(#{klass}) [#{location e}]:\n#{e.message}\n"
          when MiniTest::Assertion then
            @failures += 1
            "Failure:\n#{meth}(#{klass}) [#{location e}]:\n#{e.message}\n"
          else
            @errors += 1
            bt = MiniTest::filter_backtrace(e.backtrace).join "\n    "
            "Error:\n#{meth}(#{klass}):\n#{e.class}: #{e.message}\n    #{bt}\n"
          end
      @report << e
      e[0, 1]
    end
  end
end
