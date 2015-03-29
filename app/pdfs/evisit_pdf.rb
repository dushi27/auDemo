class EvisitPdf < Prawn::Document
    def initialize
        super
        text "This should show up"
    end
end