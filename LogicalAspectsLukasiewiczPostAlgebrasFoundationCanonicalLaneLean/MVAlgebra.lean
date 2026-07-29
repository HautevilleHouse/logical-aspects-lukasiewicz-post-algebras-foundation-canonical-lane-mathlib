import LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean.LatticeStructure

namespace HautevilleHouse
namespace LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure MVAlgebra where
  carrier : Type u
  addition : carrier → carrier → carrier
  negation : carrier → carrier
  zero : carrier
  one : carrier
  associative : Prop
  commutative : Prop
  involutiveNegation : Prop
  additionCompatibleWithOrder : Prop
  evidence : MVAlgebraEvidence

structure MVAlgebraEvidence (A : MVAlgebra) where
  associativeClosed : A.associative
  commutativeClosed : A.commutative
  involutiveNegationClosed : A.involutiveNegation
  additionCompatibleWithOrderClosed : A.additionCompatibleWithOrder

def MVAlgebraClosed (A : MVAlgebra) : Prop :=
  A.associative ∧ A.commutative ∧ A.involutiveNegation ∧ A.additionCompatibleWithOrder

theorem mv_algebra_closed_from_evidence
    (A : MVAlgebra) (E : MVAlgebraEvidence A) :
    MVAlgebraClosed A := by
  exact And.intro E.associativeClosed
    (And.intro E.commutativeClosed
      (And.intro E.involutiveNegationClosed E.additionCompatibleWithOrderClosed))

end LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse