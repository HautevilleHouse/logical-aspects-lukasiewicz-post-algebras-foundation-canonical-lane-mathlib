import .LatticeStructure

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure NegationImplicationPackage (L : LatticeStructurePackage) where
  negation : L.carrier → L.carrier
  implication : L.carrier → L.carrier → L.carrier
  involution : (a : L.carrier) → negation (negation a) = a
  lukasiewiczAxiom : (a b : L.carrier) → implication (implication a b) (implication (negation b) (negation a)) = L.topElement
  modusPonens : (a b : L.carrier) → implication a b = L.topElement → (a = L.topElement → b = L.topElement)
  deductionTheorem : (a b c : L.carrier) → implication (implication a (implication b c)) (implication (implication a b) (implication a c)) = L.topElement
  weakening : (a b : L.carrier) → implication a (implication b a) = L.topElement

structure NegationImplicationEvidence (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) where
  involutionClosed : ∀ a : L.carrier, N.involution a
  lukasiewiczAxiomClosed : ∀ a b : L.carrier, N.lukasiewiczAxiom a b
  modusPonensClosed : ∀ a b : L.carrier, N.modusPonens a b
  deductionTheoremClosed : ∀ a b c : L.carrier, N.deductionTheorem a b c
  weakeningClosed : ∀ a b : L.carrier, N.weakening a b

def NegationImplicationClosed (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) : Prop :=
  (∀ a : L.carrier, N.involution a) ∧ (∀ a b : L.carrier, N.lukasiewiczAxiom a b) ∧
  (∀ a b : L.carrier, N.modusPonens a b) ∧ (∀ a b c : L.carrier, N.deductionTheorem a b c) ∧
  (∀ a b : L.carrier, N.weakening a b)

theorem negation_implication_closed_from_evidence (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) (E : NegationImplicationEvidence L N) :
    NegationImplicationClosed L N := by
  exact And.intro E.involutionClosed (And.intro E.lukasiewiczAxiomClosed
    (And.intro E.modusPonensClosed (And.intro E.deductionTheoremClosed E.weakeningClosed)))

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse