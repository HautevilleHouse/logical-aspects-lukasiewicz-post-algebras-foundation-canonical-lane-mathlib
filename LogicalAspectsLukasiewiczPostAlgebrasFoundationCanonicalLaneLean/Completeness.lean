import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure CompletenessPackage where
  postAlgebra : PostAlgebraPackage
  representationTheorem : Prop
  stoneRepresentation : Prop
  dualEquivalence : Prop
  completenessTheorem : Prop

def CompletenessClosed (C : CompletenessPackage) : Prop :=
  PostAlgebraClosed C.postAlgebra ∧ C.representationTheorem ∧ C.completenessTheorem

structure CompletenessEvidence (C : CompletenessPackage) where
  postAlgebraClosed : PostAlgebraClosed C.postAlgebra
  representationTheoremClosed : C.representationTheorem
  completenessTheoremClosed : C.completenessTheorem

theorem completeness_closed_from_evidence
    (C : CompletenessPackage) (E : CompletenessEvidence C) :
    CompletenessClosed C := by
  exact And.intro E.postAlgebraClosed
    (And.intro E.representationTheoremClosed E.completenessTheoremClosed)

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
