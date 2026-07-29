import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure LukasiewiczPostAlgebraObject where
  carrier : Type
  latticeStructure : Prop
  negationInvolutive : Prop
  lukasiewiczImplication : Prop
  bounded : Prop
  conclusion : carrier → Prop

structure AdmissibleClass where
  object : LukasiewiczPostAlgebraObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse