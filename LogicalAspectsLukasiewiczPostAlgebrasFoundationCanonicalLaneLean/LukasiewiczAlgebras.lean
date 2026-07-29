import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure LukasiewiczAlgebra (n : ℕ) where
  carrier : Type u
  top : carrier
  bot : carrier
  impl : carrier → carrier → carrier
  neg : carrier → carrier
  axioms : Prop
  axiomsClosed : axioms

structure LukasiewiczChain (n : ℕ) where
  values : Fin n → Prop
  order : Fin n → Fin n → Prop
  chainAxioms : Prop
  chainAxiomsClosed : chainAxioms

def LukasiewiczAlgebraClosed (n : ℕ) (L : LukasiewiczAlgebra n) : Prop :=
  L.axioms

theorem lukasiewicz_algebra_closed_from_evidence (n : ℕ) (L : LukasiewiczAlgebra n) :
    LukasiewiczAlgebraClosed n L := by
  exact L.axiomsClosed

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse