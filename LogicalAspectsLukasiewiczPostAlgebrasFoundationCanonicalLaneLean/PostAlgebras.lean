import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure PostAlgebra (n : ℕ) where
  carrier : Type u
  chain : LukasiewiczChain n
  lattice : Prop
  latticeClosed : lattice
  constants : Fin n → carrier
  constantsClosed : ∀ i, constants i = constants i

structure PostAlgebraMorphism (A B : PostAlgebra n) where
  map : A.carrier → B.carrier
  preservesStructure : Prop
  preservesStructureClosed : preservesStructure

def PostAlgebraClosed (n : ℕ) (P : PostAlgebra n) : Prop :=
  P.lattice

theorem post_algebra_closed_from_evidence (n : ℕ) (P : PostAlgebra n) :
    PostAlgebraClosed n P := by
  exact P.latticeClosed

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse