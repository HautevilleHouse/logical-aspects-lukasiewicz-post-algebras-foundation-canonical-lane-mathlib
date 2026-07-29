import LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : LukasiewiczPostAlgebraAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  LukasiewiczPostAlgebraWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse