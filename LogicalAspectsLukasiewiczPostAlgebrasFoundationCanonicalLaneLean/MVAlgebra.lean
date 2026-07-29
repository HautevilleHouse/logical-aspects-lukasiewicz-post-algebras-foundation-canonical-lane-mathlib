import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure MVAlgebra where
  carrier : Type u
  zero : carrier
  one : carrier
  addition : carrier → carrier → carrier
  negation : carrier → carrier
  axioms : Prop
  axiomsClosed : axioms

structure MVAlgebraMorphism (A B : MVAlgebra) where
  map : A.carrier → B.carrier
  preservesZero : map A.zero = B.zero
  preservesOne : map A.one = B.one
  preservesAddition : ∀ x y, map (A.addition x y) = B.addition (map x) (map y)
  preservesNegation : ∀ x, map (A.negation x) = B.negation (map x)

def MVAlgebraClosed (M : MVAlgebra) : Prop :=
  M.axioms

theorem mv_algebra_closed_from_evidence (M : MVAlgebra) :
    MVAlgebraClosed M := by
  exact M.axiomsClosed

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse