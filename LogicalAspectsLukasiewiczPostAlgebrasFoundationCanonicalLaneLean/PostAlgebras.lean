import .FiniteValuedness

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure PostAlgebrasPackage (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) (F : FiniteValuednessPackage L N) where
  distinguishedElement : L.carrier
  centerElement : L.carrier
  centerProperties : (a : L.carrier) → N.implication (N.negation a) a = centerElement
  dualLattice : LatticeStructurePackage
  dualEmbedding : L.carrier → dualLattice.carrier
  embeddingPreservesOperations : (a b : L.carrier) → 
    dualEmbedding (L.meet a b) = dualLattice.meet (dualEmbedding a) (dualEmbedding b)

structure PostAlgebrasEvidence (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) (F : FiniteValuednessPackage L N)
    (P : PostAlgebrasPackage L N F) where
  centerPropertiesClosed : ∀ a : L.carrier, P.centerProperties a
  embeddingPreservesOperationsClosed : ∀ a b : L.carrier, P.embeddingPreservesOperations a b

def PostAlgebrasClosed (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) (F : FiniteValuednessPackage L N)
    (P : PostAlgebrasPackage L N F) : Prop :=
  (∀ a : L.carrier, P.centerProperties a) ∧ (∀ a b : L.carrier, P.embeddingPreservesOperations a b)

theorem post_algebras_closed_from_evidence (L : LatticeStructurePackage)
    (N : NegationImplicationPackage L) (F : FiniteValuednessPackage L N)
    (P : PostAlgebrasPackage L N F) (E : PostAlgebrasEvidence L N F P) :
    PostAlgebrasClosed L N F P := by
  exact And.intro E.centerPropertiesClosed E.embeddingPreservesOperationsClosed

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse