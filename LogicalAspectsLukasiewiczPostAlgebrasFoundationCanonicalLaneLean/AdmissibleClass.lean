import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : Type
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  True ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
