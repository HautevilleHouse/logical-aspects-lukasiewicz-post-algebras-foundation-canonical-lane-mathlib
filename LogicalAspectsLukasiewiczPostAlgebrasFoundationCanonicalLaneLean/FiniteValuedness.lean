import .NegationImplication

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure FiniteValuednessPackage (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) where
  valueSet : L.carrier → Nat
  ordering : L.carrier → L.carrier → Prop
  totalOrder : (a b : L.carrier) → ordering a b ∨ ordering b a
  linearity : (a b : L.carrier) → N.implication a b = L.topElement ∨ N.implication b a = L.topElement
  finiteChains : (a : L.carrier) → valueSet a < 10

structure FiniteValuednessEvidence (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) (F : FiniteValuednessPackage L N) where
  totalOrderClosed : ∀ a b : L.carrier, F.totalOrder a b
  linearityClosed : ∀ a b : L.carrier, F.linearity a b
  finiteChainsClosed : ∀ a : L.carrier, F.finiteChains a

def FiniteValuednessClosed (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) (F : FiniteValuednessPackage L N) : Prop :=
  (∀ a b : L.carrier, F.totalOrder a b) ∧ (∀ a b : L.carrier, F.linearity a b) ∧
  (∀ a : L.carrier, F.finiteChains a)

theorem finite_valuedness_closed_from_evidence (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) (F : FiniteValuednessPackage L N)
    (E : FiniteValuednessEvidence L N F) : FiniteValuednessClosed L N F := by
  exact And.intro E.totalOrderClosed (And.intro E.linearityClosed E.finiteChainsClosed)

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse