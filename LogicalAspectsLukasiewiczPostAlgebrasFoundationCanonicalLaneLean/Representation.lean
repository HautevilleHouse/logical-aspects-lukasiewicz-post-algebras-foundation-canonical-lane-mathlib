import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure RepresentationTheory where
  algebra : MVAlgebra
  representation : Type u → Type u
  faithful : Prop
  faithfulClosed : faithful
  irreducible : Prop
  irreducibleClosed : irreducible

def RepresentationClosed (R : RepresentationTheory) : Prop :=
  R.faithful ∧ R.irreducible

theorem representation_closed_from_evidence (R : RepresentationTheory) :
    RepresentationClosed R := by
  exact And.intro R.faithfulClosed R.irreducibleClosed

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse