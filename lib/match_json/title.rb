module MatchJSON
  module Title
    def title
      "\n" + border + money_wall + title_text + money_wall + "\n" + border + "\n"
    end

    def title_text
      "\t  JSON MATCH ERROR\t".magenta.colorize(:mode => :blink)
    end

    def border
      "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$".light_green + "\n"
    end

    def money_wall
      "$$$$".light_green
    end
  end
end
