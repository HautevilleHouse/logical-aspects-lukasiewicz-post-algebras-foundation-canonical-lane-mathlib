import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure PostAlgebraPackage (M : MVAlgebraPackage) where
  latticeStructure : Type u
  monadicOperator : (M.carrier → M.carrier)
  diagonalityCondition : Prop
  representationTheorem : Prop

structure PostAlgebraEvidence {M : MVAlgebraPackage} (P : PostAlgebraPackage M) where
  diagonalityConditionClosed : P.diagonalityCondition
  representationTheoremClosed : P.representationTheorem

def PostAlgebraClosed {M : MVAlgebraPackage} (P : PostAlgebraPackage M) : Prop :=
  P.diagonalityCondition ∧ P.representationTheorem

theorem post_algebra_closed_from_evidence {M : MVAlgebraPackage} (P : PostAlgebraPackage M)
    (E : PostAlgebraEvidence P) : PostAlgebraClosed P :=
  And.intro E.diagonalityConditionClosed E.representationTheoremClosed

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
