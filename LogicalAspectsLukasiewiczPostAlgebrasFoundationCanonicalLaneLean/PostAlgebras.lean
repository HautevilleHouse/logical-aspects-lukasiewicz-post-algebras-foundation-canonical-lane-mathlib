import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure PostAlgebrasPackage where
  carrier : Type u
  operations : carrier → carrier → carrier
  distinguishedElements : List carrier
  postAlgebraAxioms : Prop
  representation : Prop
  chainCondition : Prop
  completeness : Prop

structure PostAlgebrasEvidence (P : PostAlgebrasPackage) where
  postAlgebraAxiomsClosed : P.postAlgebraAxioms
  representationClosed : P.representation
  chainConditionClosed : P.chainCondition
  completenessClosed : P.completeness

def PostAlgebrasClosed (P : PostAlgebrasPackage) : Prop :=
  P.postAlgebraAxioms ∧ P.representation ∧ P.chainCondition ∧ P.completeness

theorem post_algebras_closed_from_evidence (P : PostAlgebrasPackage) (E : PostAlgebrasEvidence P) : PostAlgebrasClosed P := by
  exact And.intro E.postAlgebraAxiomsClosed (And.intro E.representationClosed (And.intro E.chainConditionClosed E.completenessClosed))

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
