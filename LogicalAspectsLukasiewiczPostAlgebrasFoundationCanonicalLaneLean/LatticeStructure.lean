import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure MVAlgebraPackage where
  carrier : Type u
  top : carrier
  bottom : carrier
  negation : carrier → carrier
  implication : carrier → carrier → carrier
  additionalOperation : carrier → carrier → carrier
  axiomsSatisfied : Prop

structure MVAlgebraEvidence (M : MVAlgebraPackage) where
  axiomsSatisfiedClosed : M.axiomsSatisfied

def MVAlgebraClosed (M : MVAlgebraPackage) : Prop :=
  M.axiomsSatisfied

theorem mv_algebra_closed_from_evidence (M : MVAlgebraPackage) (E : MVAlgebraEvidence M) :
    MVAlgebraClosed M :=
  E.axiomsSatisfiedClosed

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
