class Interaction < ApplicationRecord
  belongs_to :medication_1, class_name: "Medication"
  belongs_to :medication_2, class_name: "Medication"

  # possible validations:
  # - the medication pairing does not already exist
  # - the two medications are not the same medication
  # - all three columns must be present

  # note when seeding this table, it seems to want the medication *objects*, and not just the id of the medication (an integer); otherwise get AssociationMismatch: Medication expected.. got Integer
  # wondering if this is because of the belongs_to / has_many declarations that require the extra verbiage due to the self-joiny nature of this model?

end
